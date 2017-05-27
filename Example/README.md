# PermissionsService

[![CI Status](http://img.shields.io/travis/lemberg/ios-permissions-service.svg?style=flat)](https://travis-ci.org/lemberg/ios-permissions-service.svg?branch=master)
[![Version](https://img.shields.io/cocoapods/v/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)
[![License](https://img.shields.io/cocoapods/l/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)
[![Platform](https://img.shields.io/cocoapods/p/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)

## Example

```swift
class ViewController: UIViewController {

  @IBAction func onButtonClick() { 

    Permission<GalleryPermission>.prepare(for: self, callback: { (granted) in
      if granted {
        self.performSegue(withIdentifier: "showGallery", sender: self)
      }
    })
  }
}
```

## Installation

ios-permissions-service is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PermissionsService"
```

## Author

Lemberg Solutions Inc

## License

ios-permissions-service is available under the BSD license. See the LICENSE file for more info.
