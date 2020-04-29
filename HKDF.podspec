Pod::Spec.new do |s|

  s.name          = "HKDF"
  s.version       = "1.0.3"
  s.summary       = "HKDF using HMAC-SHA-512/256"
  s.platform      = :ios, "11.0"
  s.swift_version = "5.0"

  s.homepage      = "http://letsmeet.anbion.de"

  s.author        = { "TICE Software UG (haftungsbeschränkt)" => "contact@ticeapp.com" }
  s.source        = { :git => "git@github.com:TICESoftware/HKDF.git", :tag => "#{s.version}" }
  s.license       = { :type => 'MIT' }

  s.source_files  = "Sources/**/*"

  s.dependency "Sodium"

end
