
# PermissionsService

[![CI Status](http://img.shields.io/travis/lemberg/ios-permissions-service.svg?style=flat)](https://travis-ci.org/lemberg/ios-permissions-service.svg?branch=master) 
[![Version](https://img.shields.io/cocoapods/v/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![Swift Version](https://img.shields.io/badge/Swift-3.1%2B-orange.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![iOS Platform](https://img.shields.io/badge/iOS-%209.0%2B-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![License](https://img.shields.io/cocoapods/l/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)
[![By](https://img.shields.io/badge/By-Lemberg%20Solutions%20Limited-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)

An easy way to do permissions requests & handling automatically.

1. [Why do you need it?](https://github.com/lemberg/ios-permissions-service#why-you-need-it)
1. [Features](https://github.com/lemberg/ios-permissions-service#features)
1. [Supported Permission Types](https://github.com/lemberg/ios-permissions-service#supported-permission-types)
1. [Installation with CocoaPods](https://github.com/lemberg/ios-permissions-service#installation-with-cocoapods)
1. [How To Use](https://github.com/lemberg/ios-permissions-service#how-to-use)
1. [Customizing](https://github.com/lemberg/ios-permissions-service#customizing) 
1. [Requirements](https://github.com/lemberg/ios-permissions-service#requirements)
1. [Author](https://github.com/lemberg/ios-permissions-service#author)
1. [License](https://github.com/lemberg/ios-permissions-service#license)

## Why do you need it?

This library is an easy way to handle `notDetermined`, `authorized`, `restricted` and `denied` cases without doing it by yourself. No more need to do error handling for `restricted` and `denied` cases, create and present to user specific alerts. 
Of cause, it is not a silver bullet, but a good tool for your project!

## Features

- [x] Customise or localise alerts messages via `ServiceMessages` protocol
- [x] Automatic alert creating and presenting 
- [x] Opportunity for users to easy change permissions in Settings 

## Supported Permission Types

* Calendar  
* Camera    
* Contacts  
* Gallery  
* Location 
* Microphone 
* Reminder

## Installation with CocoaPods

ios-permissions-service is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod "PermissionsService"
```

## How To Use

1. Configure your project in all ways needed for chosen permission type. For example, in a case of gallery, add specific key to your .plist file.  

2. Implement  `ServiceDisplay ` protocol in your class. If it's not a `UIVIewController` class you should implement `showAlert(_:)` method, but if it is - there is a default implementation and you can leave it empty. 

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

4. Enjoy!

## Customizing

You can add custom alerts messages for `denied` and `restricted` cases by creating new `struct` which conform to `ServiceMessages` protocol.

```swift

struct CameraMessages: ServiceMessages {
    
    let deniedTitle = "Access denied"
    let deniedMessage = "You can enable access to camera in Privacy Settings"
    let restrictedTitle = "Access restricted"
    let restrictedMessage = "Access to camera is restricted"
    
}
```

 To use your custom messages put them in  `prepare(_:) ` method, like this:
 
 ```swift
 
   Permission<Camera>.prepare(for: self, with: CameraMessages()) { (granted) in
      if granted {
          print("Granted")
      } else {
          print("Error")
      }

  }

 ```

## Requirements

- [![Swift Version](https://img.shields.io/badge/Swift-3.1%2B-orange.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
- [![iOS Platform](https://img.shields.io/badge/iOS-%209.0%2B-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
- [![Xcode Version](https://img.shields.io/badge/Xcode-8.1%2B-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 

## Author

### [Lemberg Solutions](http://lemberg.co.uk) 

[![iOS Platform](http://lemberg.co.uk/sites/all/themes/lemberg/images/logo.png)](https://github.com/lemberg) 

## License

ios-permissions-service is available under the [BSD license](https://directory.fsf.org/wiki/License:BSD_4Clause). See the LICENSE file for more info.
