# Uncomment the next line to define a global platform for your project
#  source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'

target 'SuperDemo-Swift' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
#  use_frameworks!

#  pod 'Common', :path => 'Module/Common/'
  pod 'GlobalCashier', :path => 'Module/GlobalCashier/'
  pod 'Login', :path => 'Module/Login/'
  pod 'ShadowBase', :path => 'Module/ShadowBase/'
  pod 'KeyChain', :path => 'Module/KeyChain/'
  
  pod 'GCDWebServer'
  pod 'Mixpanel-swift'
  pod 'Alamofire', '~> 5.5'
  pod 'SnapKit', '~> 5.0.0'
  pod 'SDWebImage', :modular_headers => true
  pod 'YYKit'
  # 网络监测库
  pod 'ReachabilitySwift'
  # Pods for XSSuperDemo-Swift

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_TESTABILITY'] = 'NO'
    end
  end
end
