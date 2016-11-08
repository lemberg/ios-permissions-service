# PermissionsService

[![CI Status](http://img.shields.io/travis/Yuriy Trach/PermissionsService.svg?style=flat)](https://travis-ci.org/Yuriy Trach/PermissionsService)
[![Version](https://img.shields.io/cocoapods/v/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)
[![License](https://img.shields.io/cocoapods/l/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)
[![Platform](https://img.shields.io/cocoapods/p/PermissionsService.svg?style=flat)](http://cocoapods.org/pods/PermissionsService)

## Example

```swift
    class ViewController: UIViewController {
        
        @IBAction func onButtonClick() {
            
            let galleryPermissions = Permission<GalleryPermission>()
            galleryPermissions.preparePermission(self) { (granted) in
                if granted {
                    self.performSegueWithIdentifier("showGallery", sender: self)
                }
            }
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

Lemberg Inc

## License

ios-permissions-service is available under the BSD license. See the LICENSE file for more info.
