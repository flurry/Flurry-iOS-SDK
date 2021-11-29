#
# Be sure to run `pod lib lint Flurry-iOS-SDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Flurry-iOS-SDK'
  s.version          = '11.4.0'
  s.summary          = 'Flurry SDK for iOS'
  s.license          = { :type => 'Commercial', :file => 'Licenses/Flurry-LICENSE.txt' }
  s.description      = 'FlurrySDK consists of: Flurry for analytics tracking and reporting. Flurry Ads for Native, Full Screen Ads integration'
  s.homepage = 'http://developer.yahoo.com/flurry'
  s.author           = { 'Flurry' => 'integration@flurry.com' }
  s.source           = { :git => 'https://github.com/flurry/Flurry-iOS-SDK.git', :tag => s.version.to_s }
  s.platforms        = { :ios => '8.0', :watchos => '2.0', :tvos => '9.0' }
  s.requires_arc     = false
  s.default_subspec  = 'FlurrySDK'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'EXCLUDED_ARCHS[sdk=watchsimulator*]' => 'arm64', 'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'EXCLUDED_ARCHS[sdk=watchsimulator*]' => 'arm64', 'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'}

  s.subspec 'FlurrySDK' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.ios.source_files = [
      'Flurry/Flurry.h',
      'Flurry/Flurry+Event.h',
      'Flurry/FlurrySessionBuilder.h',
      'Flurry/FlurryConsent.h',
      'Flurry/FlurryUserProperties.h',
      'Flurry/FlurryCCPA.h',
      'Flurry/FlurrySKAdNetwork.h',
      'Flurry/FlurryEmpty.m'
    ]
    ss.ios.frameworks = 'Foundation', 'SystemConfiguration', 'UIKit', 'Security'
    ss.ios.vendored_libraries = 'Flurry/libFlurry_11.4.0.a'

    ss.tvos.deployment_target = '9.0'
    ss.tvos.source_files = [
      'Flurry/Flurry.h',
      'Flurry/Flurry+Event.h',
      'Flurry/FlurrySessionBuilder.h',
      'Flurry/FlurryConsent.h',
      'Flurry/FlurryUserProperties.h',
      'Flurry/FlurryCCPA.h',
      'Flurry/FlurryEmpty.m'
    ]
    ss.tvos.frameworks = 'Foundation', 'SystemConfiguration', 'UIKit', 'Security'
    ss.tvos.vendored_libraries = 'Flurry/libFlurryTVOS_11.4.0.a'

    ss.watchos.deployment_target = '2.0'
    ss.watchos.source_files = [
      'Flurry/FlurryWatch.h',
      'Flurry/Flurry.h',
      'Flurry/FlurryConsent.h',
      'Flurry/FlurryUserProperties.h',
      'Flurry/FlurryCCPA.h',
      'Flurry/FlurrySessionBuilder.h',
      'Flurry/FlurryWatchEmpty.m'
    ]
    ss.watchos.frameworks = 'Foundation', 'WatchConnectivity'
    ss.watchos.vendored_libraries = "Flurry/libFlurryWatch_11.4.0.a"
  end

  s.subspec 'FlurryWatchSDK' do |ss|
    ss.source_files = [
      'Flurry/Flurry.h',
      'Flurry/FlurryWatch.h',
      'Flurry/FlurryConsent.h',
      'Flurry/FlurryUserProperties.h',
      'Flurry/FlurryCCPA.h',
      'Flurry/FlurrySessionBuilder.h',
      'Flurry/FlurryWatchEmpty.m',
      'Flurry/FlurryEmpty.m'
    ]

    ss.platform   = :ios, '8.0'
    ss.frameworks = 'Foundation', 'WatchConnectivity', 'SystemConfiguration', 'UIKit', 'Security'
    ss.vendored_libraries = "Flurry/libFlurry_11.4.0.a"
  end

  s.subspec 'FlurryWatchOSSDK' do |ss|
    ss.source_files = [
      'Flurry/FlurryWatch.h',
      'Flurry/Flurry.h',
      'Flurry/FlurryConsent.h',
      'Flurry/FlurryUserProperties.h',
      'Flurry/FlurryCCPA.h',
      'Flurry/FlurrySessionBuilder.h',
      'Flurry/FlurryWatchEmpty.m'
    ]

    ss.platform   = :watchos, '2.0'
    ss.frameworks = 'Foundation', 'WatchConnectivity'
    ss.vendored_libraries = "Flurry/libFlurryWatch_11.4.0.a"
  end

  s.subspec 'FlurryTVOS' do |ss|
    ss.source_files = [
      'Flurry/Flurry.h',
      'Flurry/Flurry+Event.h',
      'Flurry/FlurryConsent.h',
      'Flurry/FlurryUserProperties.h',
      'Flurry/FlurryCCPA.h',
      'Flurry/FlurrySessionBuilder.h',
      'Flurry/FlurryEmpty.m'
    ]

    ss.platform   = :tvos, '9.0'
    ss.frameworks = 'Foundation', 'SystemConfiguration', 'UIKit', 'Security'
    ss.vendored_libraries = "Flurry/libFlurryTVOS_11.4.0.a"
  end

  s.subspec 'FlurryConfig' do |ss|
    ss.source_files = [
      'FlurryConfig/FConfig.h',
      'FlurryConfig/FConfigEmpty.m',
    ]

    ss.platform   = :ios, '8.0'
    ss.vendored_libraries = "FlurryConfig/libFlurryConfig_11.4.0.a"
    ss.dependency 'Flurry-iOS-SDK/FlurrySDK'
  end

  s.subspec 'FlurryMessaging' do |ss|
    ss.source_files = [
        'FlurryMessaging/FlurryMessaging.h',
        'FlurryMessaging/FlurryMessagingEmpty.m'
    ]

    ss.ios.deployment_target = '8.0'
    ss.ios.vendored_libraries = "FlurryMessaging/libFlurryMessaging_11.4.0.a"

    ss.tvos.deployment_target = '9.0'
    ss.tvos.vendored_libraries = "FlurryMessaging/libFlurryMessagingTV_11.4.0.a"

    ss.dependency 'Flurry-iOS-SDK/FlurrySDK'
  end

end
