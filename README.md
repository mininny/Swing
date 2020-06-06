# Swing

Ultimate package of useful Swift Utilities. 

Forget about creating a new `Utils` folder and adding the same extensions again when you create a new project. 

Simply add `Swing` to get going with the essential Swift Utility functions.

Table of Contents
=============

  * [Usage](#usage)
  * [Extensions](#extensions)
        * [UIView](#uiview)
            * [round](#round)
        * [UIViewController](#uiviewcontroller)
            * [topViewController](#topviewcontroller)
        * [UIWindow](#uiwindow)
            * [keyWindow](#keywindow)
        * [UIImage](#uiimage)
            * [getPixelColor](#getpixelcolor)
        * [UIColor](#uicolor)
            * [Init from Hex](#init-from-hex)
            * [HexString to UIColor](#hexstringtouicolor)
            * [toHexString](#tohexstring)
        * [String](#string)
            * [localized](#localized)
            * [removeExcept](#removeexcept)
            * [condensed](#condensed)
        * [Date](#date)
            * [removeTimestamp](#removetimestamp)
        * [Data](#data)
            * [hexString](#hexstring)
        * [Collection](#collection)
            * [Subscript exists](#subscript-exists)
        * [Bundle](#bundle)
            * [version](#version)
            * [name](#name)
            * [build](#build)
            
  
### Usage

> Currently, only iOS is fully supported. Support for other platforms will be coming soon.

#### Swift Package Manager
In your Xcode Project, go to File -> Swift Packages -> Add Package Dependency -> `https://github.com/mininny/Swing`

#### Copy & Paste
If you do not prefer having all of the files added to your projects, simply copy & paste the code snippets that you like! 

There is no restriction upon what you can do with this library, and it is licensed under WTFPL. :) 


## Extensions

### UIView
#### round
> func round() -> make the corner of the view rounded.
```swift
guard let side = [self.frame.width, self.frame.height].min() else { return }
self.layer.cornerRadius = side/2
```

### UIViewController
#### topViewController 
![Deprecated](https://img.shields.io/badge/deprecated-iOS%2013.0-yellow.svg)
> static var topViewController: UIViewController? -> returns the topmost view controller of the current window 
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
#### keyWindow 
![Deprecated](https://img.shields.io/badge/deprecated-iOS%2013.0-yellow.svg)
> static var keyWindow: UIWindow? -> returns the keyWindow of the application
```swift
UIApplication.shared.windows.filter {$0.isKeyWindow}.first
```

### UIImage
#### getPixelColor
> func getPixelColor(at:CGPoint): UIColor? -> returns the UIColor of given CGPoint in a UIView. 
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
> init?(fromHex:String, alpha:CGFloat) -> initializes UIColor with given hex string value and alpha value.
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
> static func hexStringToUIColor(hex:String, alpha:CGFloat): UIColor? -> returns a UIColor with given hex string value and alpha value. 
```swift
UIColor(fromHex: hex, alpha: alpha)
```

#### toHexString
> func toHexString(): String -> converts UIColor to hexString
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
#### localized
> func localized(comment:String = ""): String -> returns localized string with the given comment
```swift
NSLocalizedString(self, comment: comment)
```

#### removeExcept
> mutating func removeExcept(count: Int) -> remove all characters in the string except `count` number of characters. Trailing characters are trimmed by default.
```swift
if self.count > count {
    self.removeLast(self.count - count)
} else {
    self = ""
}
```

#### condensed
> var condensed: String? -> whitespace and newline trimmed string. Returns nil if trimmed string is empty, and regular string otherwise. 
```swift
let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)

return trimmed.isEmpty ? nil : trimmed
```

### Date
#### removeTimestamp
> func removeTimestamp(keeping: Calendar.Component = .day): Date? -> removes all components of the given `Date` until the specified `component`
> 
> i.e., for removeTimestamp(keeping: .day), returned Date will look like `June, 7, 2020` 
```swift
var calendarComponents: [Calendar.Component] = [ .nanosecond,
                                                 .second,
                                                 .minute,
                                                 .hour,
                                                 .day,
                                                 .month,
                                                 .era,
                                                 .year,
                                                 .timeZone,
                                                 .calendar]

switch component {
case .nanosecond: break
case .second:
    calendarComponents.removeFirst(1)
case .minute:
    calendarComponents.removeFirst(2)
case .hour:
    calendarComponents.removeFirst(3)
case .day:
    calendarComponents.removeFirst(4)
case .month:
    calendarComponents.removeFirst(5)
case .year:
    calendarComponents.removeFirst(6)
case .era:
    calendarComponents.removeFirst(7)
case .timeZone:
    calendarComponents.removeFirst(8)
case .calendar:
    calendarComponents.removeFirst(9)
}

return Calendar.current.date(from: Calendar.current.dateComponents(Set(calendarComponents), from: self))
```

### Data
#### hexString
> var hexString: String -> returns the hex value representation of the given `Data`. Useful when dealing with push tokens.
```swift
var hexString: String { self.map { String(format: "%02x", $0) }.joined() }
```
### Collection
#### subscript exists
> subscript(exists: Index): Iterator.Element? -> returns nil if the subscript does not exist in the collection's indexes. Returns regular value if it exists. Useful when dealing with safe collection handling
```swift
return indices.contains(index) ? self[index] : nil
```

### Bundle
#### version
> var version: String? -> returns the `CFBundleShortVersionString` of the bundle, aka. version number, of the project. 
```swift
self.infoDictionary?["CFBundleShortVersionString"] as? String
```

#### name
> var name: String? -> returns the `CFBundleName` of the bundle, aka. bundle name, of the project.
```swift
self.infoDictionary?["CFBundleName"] as? String
```

#### build
> var build: String? -> returns the `CFBundleVersion` of the bundle, aka. build number, of the project.
```swift
self.infoDictionary?["CFBundleVersion"] as? String
```

## Helpers

### Alerts

### Keyboard

### Objc

### Testing

--- 

### RoadMap
- Add Support for macOS
- Add cocoapods support
- Apply Swiftlint

Feel free to create requests for new methods!
