
Pod::Spec.new do |s|
  s.name         = "RNProximity"
  s.version      = "1.0.0"
  s.summary      = "RNProximity"
  s.description  = "toto"
  s.homepage     = "https://github.com/williambout/react-native-proximity"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/author/RNProximity.git", :tag => s.version }
  s.source_files  = "ios/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end
