//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
print(🐶🐮,你好)
//如果不想换行，可以传递一个空字符串给 terminator 参数--例如，print(someValue, terminator:"")
print(🐶🐮, terminator:"")
print(你好)
print(UInt8.min)

let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17


print(2_000)

//元组
//元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。
//如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(http404Error.0)")
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    //print("convertedNumber has an integer value of \(convertedNumber).")
    //! 表示“我知道这个可选有值，请使用它
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//隐式解析可选类型
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

//断言
let age = -3
// assert(age >= 0, "A person's age cannot be less than zero")
// 因为 age < 0，所以断言会触发

let iiii = 9 % -2

var emptyString = ""
if emptyString.isEmpty {
    print("Nothing to see here.")
}

age.hashValue



