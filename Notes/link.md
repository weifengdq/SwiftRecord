iOS和macOS开发学这个: https://www.raywenderlich.com/
这个索引是绕不过去的: https://github.com/ipader/SwiftGuide

[macOS Development Tutorials](https://www.raywenderlich.com/category/macos)

[Swift 学习指引](http://swiftguide.cn/)  
[SwiftGuide](https://github.com/ipader/SwiftGuide)  

[The Swift Programming Language (Swift 4)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309)  

[The Swift Programming Language中文版](http://wiki.jikexueyuan.com/project/swift/)

如果你先想参与Swift开源项目, 可以参考 https://swift.org/  

[33 款主宰 2017 iOS 开发的开源库](http://www.cocoachina.com/ios/20170620/19555.html)  

[30天Swift](http://www.jianshu.com/p/52032bc4cbe4)  

[100 Days of Swift](http://samvlu.com/index.html)  

[IGListKit](https://github.com/Instagram/IGListKit): 由 Instagram 开发人员制作，IGListKit 是用于构建快速灵活列表的数据驱动型的 UICollectionView 框架。此外，它可以帮助你在应用程序中避免大量使用视图控制器的情况。  

Valet 可以帮助你实现将数据安全地存储在 iOS 或 OS X Keychain 中，而无需了解任何 Keychain 相关的工作原理。  

RxSwift 响应式编程   

[用RxSwift仿写知乎日报](http://www.cocoachina.com/swift/20170222/18727.html)  

[Using Swift with Cocoa and Objective-C (Swift 4)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/WorkingWithCocoaDataTypes.html#//apple_ref/doc/uid/TP40014216-CH6)  

---
用Swift写服务器, 官方有详细的教程: [vapor](https://github.com/vapor/vapor)  
用Swift写Web: [Kitura](https://github.com/IBM-Swift/Kitura)  
[ObjectiveC2Swift](https://objectivec2swift.com/#/home/main)  

100  days of Swift 是Swift2.0的版本比较老，推荐hacking with Swift系列全是最新的版本很不错，还有raywenderlich 、big nerd ranch appcoda、斯坦福的CS193以及udemy&YouTube的课程，matt neuburg 和vandad nahavandipoor的书也不错  

https://www.hackingwithswift.com/  
https://github.com/twostraws/HackingWithSwift  


```Swift
guard username == true, password == true, verification_code == true else {
    NSLog("登录失败")
}
NSLog（"登录成功"）
```
guard后面的条件，只有全部满足了，代码执行才会往下走，否则进入{}内。它会提早判断不满足判断条件的情况。  
变量常量不接受空值，如果可能出现空值的情况下使用可选类型.  
单例:  
```Swift
class Singleton  {
   static let sharedInstance = Singleton()
}
```







