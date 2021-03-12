#
# Be sure to run `pod lib lint Lottie3ObjcWrapper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Lottie3ObjcWrapper'
  s.version          = '0.1.0'
  s.summary          = 'A wrapper for using Lottie3 in Objective-C project'
  s.description      = <<-DESC

                       DESC

  s.homepage         = 'https://github.com/FFFang/Lottie3ObjcWrapper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FFFang' => 'fang@soulapp.cn' }
  s.source           = { :git => 'https://github.com/FFFang/Lottie3ObjcWrapper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'

  s.source_files = 'Lottie3ObjcWrapper/Classes/**/*'
  s.dependency 'lottie-ios'
  # s.resource_bundles = {
  #   'Lottie3ObjcWrapper' => ['Lottie3ObjcWrapper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
