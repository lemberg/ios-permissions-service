# PermissionsService

[![CI Status](http://img.shields.io/travis/lemberg/ios-permissions-service.svg?style=flat)](https://travis-ci.org/lemberg/ios-permissions-service.svg?branch=master) 
[![Version](https://img.shields.io/cocoapods/v/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![Swift Version](https://img.shields.io/badge/Swift-3.1%2B-orange.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![iOS Platform](https://img.shields.io/badge/iOS-%209.0%2B-blue.svg?style=flat)](http://cocoapods.org/pods/PermissionsService) 
[![License](https://img.shields.io/cocoapods/l/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)


## Why you need it?

This library is an easy way to handle `notDetermined` `authorized` `restricted` `denied` cases without doing it by yourself. No more need to do error handling for `restricted` and `denied` cases, create and present to user specific alerts. 
Of cause, it is not a silver bullet, but a good tool for your project!

## Features

- [x] Customise or localise alerts messages via `ServiceMessages` protocol
- [x] Automatic alert creating and presenting 
- [x] Opportunity for users to easy change permissions in Settings 

## Supported Permission Types

* Calendar  
* Camera    
* Contacts  
* Camera   
* Location  

## Installation with CocoaPods

ios-permissions-service is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod "PermissionsService"
```

## How To Use

1. Choose a type of permission and add special keys to your .plist file.  

```swift
  NSPhotoLibraryUsageDescription
```

2. Add `Permission<T: PermissionService>` object with a type you needed and use  `prepare(_:) ` method for request permission and presenting alert to the user. 

```swift

  Permission<GalleryPermission>.prepare(for: self, callback: { (granted) in
      if granted {
          //present library
      } else {
          //perform specific functions 
      }
    })

```

3. Enjoy!

## Requirements

 - iOS 9.0+
 - Swift 3.0+
 - XCode 8.1+

## Author

Lemberg Solutions Inc

## License

ios-permissions-service is available under the BSD license. See the LICENSE file for more info.
