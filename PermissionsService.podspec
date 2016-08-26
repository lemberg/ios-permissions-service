#
# Be sure to run `pod lib lint PermissionsService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PermissionsService'
  s.version          = '0.1.1'
  s.summary          = 'It is wrap for base is permisions'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Using this code you can get permisions for Photos, Camera or Calendar
                       DESC

s.homepage         = 'https://github.com/lemberg/ios-permissions-service'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'BSD', :file => 'LICENSE' }
s.author           = { 'Lemberg Inc' => '' }
s.source           = { :git => 'https://github.com/lemberg/ios-permissions-service.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'

  s.source_files = 'PermissionsService/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PermissionsService' => ['PermissionsService/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
