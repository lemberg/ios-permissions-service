#
# Be sure to run `pod lib lint PermissionsService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html


Pod::Spec.new do |s|
  s.name             = 'PermissionsService'
  s.version          = '0.3.0'
  s.summary          = 'An easy way to do permissions requests & handling automatically'
  s.homepage         = 'https://github.com/lemberg/ios-permissions-service'
  s.license          = { :type => 'BSD', :file => 'LICENSE' }
  s.author           = { 'Lemberg Solutions Limited' => 'www.lemberg.co.uk' }
  s.source           = { :git => 'https://github.com/lemberg/ios-permissions-service.git', :tag => s.version.to_s }
#  s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.source_files     = 'PermissionsService/Classes/**/*'
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'

  s.description      = <<-DESC
Using this code you can get permisions for Photos, Camera and other permisisons
                       DESC

  s.default_subspec = 'Core'

  s.subspec 'Core' do |co|
    co.source_files = "PermissionsService/Classes/**/*"
  end

  s.subspec 'Location' do |lo|
    lo.dependency 'PermissionsService/Core'
    lo.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_LOCATION" }
  end


end
