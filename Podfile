# mPaaS Pods Begin
plugin "cocoapods-mPaaS", :only_frameworks => true
source "https://code.aliyun.com/mpaas-public/podspecs.git"
mPaaS_baseline '10.1.68'  # 请将 x.x.x 替换成真实基线版本
mPaaS_version_code 21   # This line is maintained by MPaaS plugin automatically. Please don't modify.
# mPaaS Pods End
# ---------------------------------------------------------------------
# Uncomment the next line to define a global platform for your project
source 'https://cdn.cocoapods.org/'
platform :ios, '9.0'
inhibit_all_warnings!

target 'Demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # pod 'AFNetworking'
  # pod 'ReactiveObjC'
  #pod 'Masonry'
  # pod 'IQKeyboardManager'
  # pod 'SDCycleScrollView'
  # pod 'DeviceUtil'
  # pod 'UICKeyChainStore'
  # pod 'MJExtension'
  # pod 'SVProgressHUD'

  #pod 'KMNavigationBarTransition'
  #pod 'XLPhotoBrowser+CoderXL'#, :git => 'git@gitee.com:HCC-Mobile/XLPhotoBrowser.git', :commit => '924ebdf08f7e'
  
  #remove_pod "mPaaS_SDWebImage"

  mPaaS_pod "mPaaS_ScanCode"
  mPaaS_pod "mPaaS_Nebula"
  mPaaS_pod "mPaaS_Upgrade"
  mPaaS_pod "mPaaS_TinyApp"
  mPaaS_pod "mPaaS_RPC"
  mPaaS_pod "mPaaS_Upgrade"
  mPaaS_pod "mPaaS_BadgeService"
  
  # target 'iServiceDev' do
  #   pod 'AFNetworkActivityLogger', :git => 'git@gitee.com:HCC-Mobile/AFNetworkActivityLogger.git', :commit => 'f679f41'

  #   mPaaS_pod 'mPaaS_DevHelper'
  #   mPaaS_pod 'mPaaS_NebulaDevHelper'
  # end
  
#  target 'iServiceTests' do
#    inherit! :search_paths
#    # Pods for testing
#  end
#
#  target 'iServiceUITests' do
#    # Pods for testing
#  end

end
