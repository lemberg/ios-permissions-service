#
# Be sure to run `pod lib lint PermissionsService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html


Pod::Spec.new do |s|
  s.name             = "PermissionsService"
  s.version          = "0.9.6"
  s.summary          = "An easy way to do permissions requests & handling automatically"
  s.homepage         = "https://github.com/lemberg/ios-permissions-service"
  s.license          = { :type => 'BSD', :file => 'LICENSE' }
  s.author           = { 'Lemberg Solutions Limited' => 'www.lemberg.co.uk' }
  s.source           = { :git => 'https://github.com/lemberg/ios-permissions-service.git', :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/wearelemberg"
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'
  s.swift_version    = '4.2'

  s.description      = <<-DESC
Using this code you can get permisions for Photos, Camera and other permisisons
                       DESC

  s.default_subspec = 'Core'
  s.subspec 'Core' do |co|
    co.source_files = "Source/Core/*.{swift, h}"
  end

  s.subspec 'Location' do |lo|
    lo.dependency 'PermissionsService/Core'
    lo.source_files = 'Source/Location'
    lo.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_LOCATION" }

  end

  s.subspec 'Camera' do |ca|
    ca.dependency 'PermissionsService/Core'
    ca.source_files = 'Source/Camera'
    ca.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_CAMERA" }

  end

  s.subspec 'Contacts' do |co|
    co.dependency 'PermissionsService/Core'
    co.source_files = 'Source/Contacts'
    co.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_CONTACTS" }

  end

  s.subspec 'Events' do |ev|
    ev.dependency 'PermissionsService/Core'
    ev.source_files = 'Source/Events'
    ev.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_EVENTS" }

  end

  s.subspec 'MediaLibrary' do |ml|
    ml.dependency 'PermissionsService/Core'
    ml.source_files = 'Source/MediaLibrary'
    ml.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_MEDIA_LIBRARY" }
  end

  s.subspec 'Gallery' do |ga|
    ga.dependency 'PermissionsService/Core'
    ga.source_files = 'Source/Gallery'
    ga.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_GALLERY" }

  end

  s.subspec 'Microphone' do |mi|
    mi.dependency 'PermissionsService/Core'
    mi.source_files = 'Source/Microphone'
    mi.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_MICROPHONE" }

  end

  s.subspec 'Reminder' do |ra|
    ra.dependency 'PermissionsService/Core'
    ra.source_files = 'Source/Reminder'
    ra.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_REMINDER" }

  end

  s.subspec 'Siri' do |si|
    si.dependency 'PermissionsService/Core'
    si.source_files = 'Source/Siri'
    si.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_SIRI" }

  end

  s.subspec 'SpeechRecognition' do |sp|
    sp.dependency 'PermissionsService/Core'
    sp.source_files = 'Source/SpeechRecognition'
    sp.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSION_SPEECH_RECOGNITION" }

  end


end
