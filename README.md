# HKDF

HMAC-based Extract-and-Expand Key Derivation Function (HKDF) as defined in <a href="https://tools.ietf.org/html/rfc5869">RFC 5869</a>.
The HMAC is provided by libsodium which uses the HMAC-SHA-512/256 algorithm.

## Installation
### SPM
`.package(url: "https://github.com/TICESoftware/HKDF.git", .upToNextMajor(from: "1.0.0"))`

In order to build the library it is necessary to link libsodium. The <a href="https://github.com/jedisct1/libsodium">official repository</a> includes scripts to build binaries for specific platforms.

`swift build -Xcc -I[header search path] -Xlinker -L[binary path]`

When using Xcode you can set the header search path manually to include the libsodium header files and link the static libsodium library.

### CodoaPods
`pod 'HKDF'`

This uses <a href="https://github.com/jedisct1/swift-sodium">`Sodium`</a> as a dependency which includes the pre-compiled libsodium library. No further setup necessary.

## Usage
For deriving a new key of length 32 bytes from some input keying material `ikm`:

```swift
import HKDF

let ikm = "Input key".bytes
let hkdfKey = try! deriveHKDFKey(ikm: ikm, L: 32)
```

A `salt` and some application specific info string (which is hashed into the HMAC) can additionally be provided:

`try deriveHKDFKey(ikm: ikm, salt: salt, info: "Info", L: 32)`
