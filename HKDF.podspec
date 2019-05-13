Pod::Spec.new do |s|

  s.name          = "HKDF"
  s.version       = "1.0.1"
  s.summary       = "HKDF using HMAC-SHA-512/256"
  s.platform      = :ios, "11.0"
  s.swift_version = "5.0"

  s.homepage      = "http://letsmeet.anbion.de"

  s.author        = { "Anbion" => "letsmeet@anbion.de" }
  s.source        = { :git => "git@github.com:AnbionApps/HKDF.git", :tag => "#{s.version}" }

  s.source_files  = "Sources/**/*"

  s.dependency "Sodium"

end
