# ios-permissions-service


# 1. Usage. 
  - Fork this repo into your project.
  - Customize or localize texts
  - In case you have create new AbstractPermission subclass - please, make pull request for original reposetory

# 2. Example to use:
class ViewController: UIViewController {

@IBAction func onButtonClick() {  
  GalleryPermission().preparePermission(self) { (granted) in  
    if granted {  
      self.performSegueWithIdentifier("showImageCollection", sender: self)  
    }  
  }  
}

