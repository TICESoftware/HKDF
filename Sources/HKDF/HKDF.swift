import Foundation
import Sodium

public enum HKDFError: LocalizedError {
    case invalidSalt
    case invalidL
    case HMACCalculationFailed

    public var errorDescription: String? {
        switch self {
        case .invalidSalt: return "Salt length must match exactly the key length of the HMAC function."
        case .invalidL: return "Length of L must not be larger than 255 times the length of the hash output."
        case .HMACCalculationFailed: return "HMAC calculation failed."
        }
    }
}

/**
 This function calculates a key using a HKDF (RFC 5869) which uses HMAC-SHA-512/256.
 - Parameters:
    - ikm: Input keying material
    - salt: A nonce used to seed the HKDF, which must be 32 bytes long, if provided (optional)
    - info: Context and application specific information (optional)
    - L: Length of the output keying material in bytes, must not be larger than 255 * 32 bytes
 - Returns: Output keying material of length L bytes
 */
public func deriveHKDFKey(ikm: Bytes, salt: Bytes? = nil, info: String = "", L: Int) throws -> Bytes {
    let sodium = Sodium()
    let hashOutputLength = sodium.auth.Bytes
    let salt = salt ?? Bytes(repeating: 0, count: hashOutputLength)

    guard L <= 255 * hashOutputLength else { throw HKDFError.invalidL }
    guard salt.count == sodium.auth.KeyBytes else { throw HKDFError.invalidSalt }

    // Step 1: Extract
    guard let prk = sodium.auth.tag(message: ikm, secretKey: salt) else { throw HKDFError.HMACCalculationFailed }

    // Step 2: Expand
    let N = Int((Double(L)/Double(hashOutputLength)).rounded(.up))
    var T = Bytes()

    var lastTi = Bytes()
    for i in 0..<N {
        var message = Bytes()
        message.append(contentsOf: lastTi)
        message.append(contentsOf: info.bytes)
        message.append(UInt8(i))

        guard let currentTi = sodium.auth.tag(message: message, secretKey: prk) else { throw HKDFError.HMACCalculationFailed }
        T.append(contentsOf: currentTi)
        lastTi = currentTi
    }

    return Bytes(T[..<L])
}
