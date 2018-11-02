
<p align="center"> 
<img src="http://i.piccy.info/i9/a78079fbf443139391c8bab158b8b6ed/1500892891/100777/1164536/800.png">
</p>

[![License](https://img.shields.io/cocoapods/l/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)
[![Version](https://img.shields.io/badge/pod-v0.3.0-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Version](https://img.shields.io/badge/Swift-3.1%2B-orange.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![iOS Platform](https://img.shields.io/badge/iOS-8.0%2B-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![By](https://img.shields.io/badge/By-Lemberg%20Solutions%20Limited-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)

An easy way to do permissions requests & handling automatically.

1. [Why do you need it?](https://github.com/lemberg/ios-permissions-service#why-you-need-it)
1. [Features](https://github.com/lemberg/ios-permissions-service#features)
1. [Supported Permission Types](https://github.com/lemberg/ios-permissions-service#supported-permission-types)
1. [Installation](https://github.com/lemberg/ios-permissions-service#installation)
    1. [CocoaPods](https://github.com/lemberg/ios-permissions-service#cocoapods)
    1. [Carthage](https://github.com/lemberg/ios-permissions-service#carthage)
1. [How To Use](https://github.com/lemberg/ios-permissions-service#how-to-use)
1. [Configurations](https://github.com/lemberg/ios-permissions-service#configurations) 
    1. [Custom alert messages](https://github.com/lemberg/ios-permissions-service#configurate-messages)
    1. [Location permission](https://github.com/lemberg/ios-permissions-service#location-permission-types)
1. [Requirements](https://github.com/lemberg/ios-permissions-service#requirements)
1. [Author](https://github.com/lemberg/ios-permissions-service#author)
1. [License](https://github.com/lemberg/ios-permissions-service#license)

## Why do you need it?

This library is an easy way to handle `notDetermined`, `authorised`, `restricted` and `denied` cases without doing it by yourself. No more need to do error handling for `restricted` and `denied` cases, create and present to user specific alerts. 
Of cause, it is not a silver bullet, but a good tool for your project!

## Features

- [x] Customise or localise alerts messages via `Configuration`
- [x] Automatic alert creating and presenting 
- [x] Opportunity for users to easily change permissions in Settings 
- [x] CoreLocation permission returns you completion block with user's decision 
- [x] Example project for easy understanding of framework 

## Supported Permission Types
  
* `Camera`  
* `Contacts` 
* `Events`
* `Gallery`  
* `Location`
* `MediaLibrary` 
* `Microphone` 
* `Reminder`
* `Siri`
* `SpeechRecognition` 

## Installation with CocoaPods

ios-permissions-service is available through [CocoaPods](http://cocoapods.org) and [Carthage](https://github.com/Carthage/Carthage)

### CocoaPods

To install it, simply add one or several lines to your Podfile like this:

```swift
  pod "PermissionsService/Location"
  pod "PermissionsService/Camera"
```

Full list of available permissions you can found [here](https://github.com/lemberg/ios-permissions-service#supported-permission-types). 

> If you'll need, there is still a versions written on **Swift 3/4** which you can find in separate branches

Now you need to run `pod update` command from you project folder and that's it!

### Carthage

1. Add the following line to your Cartfile:

```swift
  github "lemberg/ios-permissions-service"
```

If you want to use a specific branch with another Swift version you can add branch name:

```swift
github "lemberg/ios-permissions-service" "swift4"
```

2. Run `carthage update --platform iOS` command from you project folder.

3. Find the *Carthage/Build* folder, which is in your project folder. Drag and drop `PermissionsService.framework` file, to the *Linked Frameworks and Libraries* section in *General* settings tab of your project. 

4. Do to *Build Phases* settings tab. Click the “+” icon and choose *New Run Script Phase* if not exist. Add the following line to your script 

```swift
  /usr/local/bin/carthage copy-frameworks
```

5. Add the framework's paths under *Input Files*:

```swift
  $(SRCROOT)/Carthage/Build/iOS/PermissionsService.framework
```

6. Add the framework's paths to the *Output Files*:

```swift
  $(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/PermissionsService.framework
```

> More info about using and configuring Carthage you can find [here](https://github.com/Carthage/Carthage#getting-started).

#### Note!

There is an important note about installing, because of Apple's policy. Due to this policy regarding permission access, binaries may be rejected due to a perceived attempt to access privacy-sensitive data without a usage key, and then further rejected for not actually requesting permissions. This error will be when you'll try uploading to itunesconnect. 

But there is a **solutuion**. You need to provide custom build flags *before building the dynamic framework* to only compile with permissions you request. 

1. Go to your project root directory and add `xcconfig` file named `PermissionConfiguration.xcconfig`. 
[Example of such file you can find here.](https://github.com/lemberg/ios-permissions-service/blob/master/Example/Pods/PermissionConfiguration.xcconfig)

2. Comment lines which you don't want to use like this:

```swift
    
    PERMISSION_CAMERA            = PERMISSION_CAMERA
    PERMISSION_CONTACTS          = // PERMISSION_CONTACTS
    
```

Here you can see an example of using only `Camera` permission. `Contacts` permission will be unavailable. 

3. Now you can run `carthage update --platform iOS` to compile framework. 

> If you'll need to change available permissions, go to `PermissionConfiguration.xcconfig` file and modify it. Then update the framework again. 


## How To Use

1. Configure your project in all ways needed for chosen permission type. For example, in a case of a gallery, add a specific key to your .plist file. 

2. Implement  `Permissible` protocol in your class. If it's not a `UIVIewController` class you should implement `showAlert(_:)` method, but if it is - there is a default implementation and you can leave it empty. 

3. Add `Permission<T: PermissionService>` object with a type you needed and use  `prepare(_:) ` method for request permission and presenting alert to the user. 

```swift

  Permission<Gallery>.prepare(for: self, callback: { (granted) in
      if granted {
          //present library
      } else {
          //perform specific functions 
      }
    })

```

This case if show a simple variant of use with default permission settings. 

> Be aware that **Calendar** permission service named **Events**. 

4. Enjoy!

## Configurations

This library gives you an opportunity to do some customising or configurations if you need it. 

### Configurate messages

You can add custom alerts messages for `denied` and `restricted` cases by creating new `struct` which conform to `ServiceMessages` protocol.

```swift

struct CameraMessages: ServiceMessages {
    
    let deniedTitle = "Access denied"
    let deniedMessage = "You can enable access to camera in Privacy Settings"
    let restrictedTitle = "Access restricted"
    let restrictedMessage = "Access to camera is restricted"
    
}
```

To use your custom messages you need to use  `DefaultConfiguration` class. Let's init it!

 ```swift
    let config = DefaultConfiguration(with: CameraMessages())
 ```

And now put it in  `prepare(_:) ` method, like this:
 
 ```swift
   Permission<Camera>.prepare(for: self, with: config) { (granted) in
      if granted {
          print("Granted")
      } else {
          print("Error")
      }

  }

 ```

### Location permission types 

As you can know, you can request two types of user location permission: `WhenInUse` and `Always`. 
For choosing it you need to use configurations too.  Class `LocationConfiguration` is a subclass of `DefaultConfiguration` and have the same way to use. 

You can init it only with type

 ```swift
       let config = LocationConfiguration(.always)
 ```

Or you can use it with your messages

 ```swift
      let config = LocationConfiguration(.always, with: CustomLocationMessages())
 ```

And then simply put it in your  `prepare(_:) ` method as you already did with `DefaultConfiguration`. 

 ```swift
   Permission<Location>.prepare(for: self, with: config) { (granted) in
      if granted {
          print("Granted")
      } else {
          print("Error")
      }

  }

 ```
 
 > If you still have some questions or issues (maybe even improvements!) feel free to open new issue or PR. 


## Requirements

- [![Swift Version](https://img.shields.io/badge/Swift-3.1%2B-orange.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
- [![iOS Platform](https://img.shields.io/badge/iOS-8.0%2B-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
- [![Xcode Version](https://img.shields.io/badge/Xcode-8.1%2B-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 

## Author

### [Lemberg Solutions](http://lemberg.co.uk) 

[![iOS Platform](http://lemberg.co.uk/sites/all/themes/lemberg/images/logo.png)](https://github.com/lemberg) 

## License

ios-permissions-service is available under the [BSD license](https://directory.fsf.org/wiki/License:BSD_4Clause). See the LICENSE file for more info.
