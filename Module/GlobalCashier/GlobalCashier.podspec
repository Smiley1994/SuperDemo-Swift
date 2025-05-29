Pod::Spec.new do |s|
  s.name         = "GlobalCashier"
  s.version      = "0.0.1"
  s.summary      = "global cashier."
  s.description  = "收银台"
  s.homepage     = "http://example.com/GlobalCashier"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "sunnnn" => "smileysun1994@gmail.com" }
  s.source       = { :git => "", :tag => "#{s.version}" }
  s.platform     = :ios, "13.0"
  s.source_files = "Classes/**/*.{h,m,swift}"
  s.resource_bundles = {
    'GlobalCashierResources' => ['Resources/**/*']  
  }
  s.requires_arc = true
  s.dependency 'SDWebImage'
  s.dependency 'AlipaySDK-iOS'
end

