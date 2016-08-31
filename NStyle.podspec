Pod::Spec.new do |s|
  s.name         = "NStyle"
  s.version      = "0.1.1"
  s.summary      = "NStyle help you reuse UI styles"
  s.homepage     = "http://knacker.com"
  s.license      = "MIT"
  s.author       = "Nghia Nguyen"
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/nghiaphunguyen/NStyle", :tag => s.version}
  s.source_files  = "Classes", "NStyle/Source/**/*.{swift}"
  s.requires_arc = true

end
