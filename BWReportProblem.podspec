 
Pod::Spec.new do |spec|

 

  spec.name         = "BWReportProblem"
  spec.ios.deployment_target = '12.0'
  spec.version      = "0.1.1"
  spec.summary      = "BWReportProblem let's a user report any issues."
  spec.homepage     = "https://github.com/Rajesh9274/BWReportProblem"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Rajesh Vekariya" => "rajesh.vekariya@bluereeftech.com" }
  spec.platform     = :ios
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/Rajesh9274/BWReportProblem.git", :tag => "#{spec.version}" }
  spec.source_files = "BWReportProblem/**/*.{swift}"
  spec.resources = "BWReportProblem/Resources/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  spec.framework  = "UIKit"
  spec.dependency 'Alamofire', '~> 5.2'
  spec.dependency 'iOSPhotoEditor'
  spec.dependency 'IBAnimatable'
  spec.dependency 'SVProgressHUD'
  spec.dependency 'ReachabilitySwift'
  spec.dependency 'IQKeyboardManagerSwift'
  spec.dependency 'Toast-Swift'
  spec.swift_versions = ['4.2', '5.0', '5.1', '5.2']


end
