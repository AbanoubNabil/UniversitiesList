
platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!
keep_source_code_for_prebuilt_frameworks!
enable_bitcode_for_prebuilt_frameworks!

workspace 'UniversitiesList.xcworkspace'
project 'UniversitiesList.xcodeproj'
source 'https://github.com/CocoaPods/Specs.git'

target 'UniversitiesList' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'RealmSwift'

  target 'UniversitiesListTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'UniversitiesListUITests' do
    # Pods for testing
  end

end

target :'UnivirsityDetails' do
  
  project 'UnivirsityDetails/UnivirsityDetails.xcodeproj'
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
    end
  end
  
end
