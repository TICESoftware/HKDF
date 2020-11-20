Pod::Spec.new do |s|

  s.name          = "HKDF"
  s.version       = "1.0.9"
  s.summary       = "HKDF using HMAC-SHA-512/256"
  s.platform      = :ios, "12.0"
  s.swift_version = "5.0"

  s.homepage      = "https://ticeapp.com"

  s.author        = { "TICE Software UG (haftungsbeschränkt)" => "contact@ticeapp.com" }
  s.source        = { :git => "https://github.com/TICESoftware/HKDF.git", :tag => "#{s.version}" }
  s.license       = { :type => 'MIT' }

  s.source_files  = "Sources/**/*"

  s.dependency "Sodium"

  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
