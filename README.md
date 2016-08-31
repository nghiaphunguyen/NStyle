# NStyle 0.1
**NStyle** help you reuse UI styles. It is refactored from [Fashion](https://github.com/vadymmarkov/Fashion).

# CHANGE LOG

**v0.1**

# INSTALLATION

### Pod
```bash
use_frameworks!

pod 'NStyle'
```

# USAGE

```swift
import NStyle
```

##### Create stylesheet
```swift
enum UIClass: String, NKStringConvertible {
    case TitleLabel 
    case LargeBorder

    var string: String {
        return rawValue
    }
}

struct MainStylesheet: NKStylesheet {
    func build(stylist: NKStylist) {
        stylist.registerClass(UIClass.TitleLabel) { (label: UILabel) in
            label.font = UIFont.title
            label.color = UIColor.blackColor()
        }

        stylist.registerClass(UIClass.LargeBorder) { (view: UIView) in
            view.layer.borderWidth = 4
            view.layer.borderColor = UIColor.yellowColor()
        }
    }
}
```

##### 
```swift
CSS.registerStylesheets(MainStylesheet())

let label = UILabel().nk_classes(UIClass.TitleLabel, UIClass.LargeBorder)
```