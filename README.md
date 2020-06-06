# Swing

Ultimate package of useful Swift Utilities. 

Forget about creating a new `Utils` folder and adding the same extensions again when you create a new project. 

Simply add `Swing` to get going with the essential Swift Utility functions.

### Usage

#### Swift Package Manager
In your Xcode Project, go to File -> Swift Packages -> Add Package Dependency -> `https://github.com/mininny/Swing`

#### Copy & Paste
If you do not prefer having all of the files added to your projects, simply copy & paste the code snippets that you like! 

There is no restriction upon what you can do with this library, and it is licensed under WTFPL. :) 

## Extensions

### UIView
#### round
* func round() -> make the corner of the view rounded.
```swift
guard let side = [self.frame.width, self.frame.height].min() else { return }
self.layer.cornerRadius = side/2
```

### UIViewController
#### topViewController ![Deprecated](https://img.shields.io/badge/deprecated-iOS%2013.0-yellow.svg)
* static var topViewController: UIViewController? -> returns the topmost view controller of the current window 
```swift
if var topController = UIWindow.keyWindow?.rootViewController {
    while let presentedViewController = topController.presentedViewController {
        topController = presentedViewController
    }
    return topController
}
return nil
```

### UIWindow
#### keyWindow ![Deprecated](https://img.shields.io/badge/deprecated-iOS%2013.0-yellow.svg)
* static var keyWindow: UIWindow? -> returns the keyWindow of the application
```swift
UIApplication.shared.windows.filter {$0.isKeyWindow}.first
```

### UIImage
#### getPixelColor
* func getPixelColor(at:CGPoint): UIColor? -> returns the UIColor of given CGPoint in a UIView. 
```swift
guard let pixelData = self.cgImage?.dataProvider?.data else { return nil }

let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)

let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4

let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)

return UIColor(red: r, green: g, blue: b, alpha: a)
```

### UIColor
#### init from hex
* init?(fromHex:String, alpha:CGFloat) -> initializes UIColor with given hex string value and alpha value.
```swift
var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

if (cString.hasPrefix("#")) {
    cString.remove(at: cString.startIndex)
}

if ((cString.count) != 6) {
    return nil
}

var rgbValue:UInt64 = 0
Scanner(string: cString).scanHexInt64(&rgbValue)

self.init(
    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    alpha: alpha
)
```

#### hexStringToUIColor
* static func hexStringToUIColor(hex:String, alpha:CGFloat): UIColor? -> returns a UIColor with given hex string value and alpha value. 
```swift
UIColor(fromHex: hex, alpha: alpha)
```

#### toHexString
* func toHexString(): String -> converts UIColor to hexString
```swift
var r:CGFloat = 0
var g:CGFloat = 0
var b:CGFloat = 0
var a:CGFloat = 0

getRed(&r, green: &g, blue: &b, alpha: &a)

let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

return NSString(format:"#%06x", rgb) as String
```

### String

### Date

### Data

### Collection

### Bundle

## Helpers

### Alerts

### Keyboard

### Objc

### Testing

--- 

Feel free to create requests for new methods!
