#
# Be sure to run `pod lib lint Moya-KakaJson.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Moya-KakaJson'
  s.version          = '0.0.1'
  s.summary          = 'KakaJson bindings for Moya for easier JSON serialization. Includes RxSwift bindings as well.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Guoxiafei/Moya-KakaJson'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Guoxiafei' => 'guoxiafei1991@163.com' }
  s.source           = { :git => 'git@github.com:Guoxiafei/Moya-KakaJson.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Moya-KakaJson/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Moya-KakaJson' => ['Moya-KakaJson/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Moya/RxSwift', '~> 14.0'
   s.dependency 'KakaJSON'

end
