# Uncomment the next line to define a global platform for your project
platform :ios, '10.3'

target 'Boost' do
    use_frameworks!
    
    pod 'Presentables', '~> 0.6.7'
    pod 'Reloaded', :path => '../Reloaded'
    pod 'BoostSDK', :path => '../BoostSDK'
    pod 'Base', :path => '../Base'
    pod 'Hagrid', :path => '../Hagrid'
    pod 'MarcoPolo', :path => '../MarcoPolo'
    pod 'SnapKit', '~>4.0.0'
    pod 'Modular', '~>1.0.2'
    pod 'AwesomeEnum', '~> 2.0.1'
    pod 'AlamofireImage'
    pod 'collection-view-layouts/PinterestLayout'
    pod 'DisplaySwitcher', :git => 'https://github.com/Yalantis/DisplaySwitcher.git', :tag => '1.2'
    pod 'SideMenu'

    target 'BoostTests' do
        inherit! :search_paths
        pod 'SpecTools'
    end
    
    target 'BoostUITests' do
        inherit! :search_paths
    end
    
end
