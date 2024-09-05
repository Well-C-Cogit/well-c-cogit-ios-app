# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'WellCCogit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WellCCogit

  pod 'RxSwift'
  pod 'RxRelay' 
  pod 'RxCocoa'
  pod 'Alamofire'
  pod 'SnapKit', '~> 5.7.0'
  pod 'KeychainSwift', '~> 24.0'
  pod 'SwiftEventBus'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end

end