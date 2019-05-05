import XCTest
import Sodium
@testable import HKDF

final class HKDFTests: XCTestCase {
    func testKeyDerivation() {
        let sodium = Sodium()
        let ikm = sodium.utils.hex2bin("AA BB CC DD EE FF 00 11 22 33 44 55 66 77 88 99", ignore: " ")!
        let salt = sodium.utils.hex2bin("00 11 22 33 44 55 66 77 88 99 AA BB CC DD EE FF 00 11 22 33 44 55 66 77 88 99 AA BB CC DD EE FF", ignore: " ")!

        do {
            let L = 29
            let hkdfKey = try deriveHKDFKey(ikm: ikm, salt: salt, info: "Info", L: L)
            print(sodium.utils.bin2hex(hkdfKey)!)
            XCTAssertEqual(hkdfKey.count, L)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
    }

    static var allTests = [
        ("testKeyDerivation", testKeyDerivation),
    ]
}
