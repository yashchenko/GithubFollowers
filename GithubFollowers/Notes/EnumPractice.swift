//
//  EnumPractice.swift
//  GithubFollowers
//
//  Created by Ivan on 19.05.2024.
//

import UIKit

enum TrafficLight {
    case red(time: Int)
    case yellow(time: Int)
    case green(time: Int)
}

var currentLight = TrafficLight.red(time: 45)






//Of course Let's simplify the concept of associated values with a couple of straightforward examples to help clarify how they work.
//
//### Example 1: Simple Traffic Light
//
//Imagine you're modeling a traffic light system. Each light can be in one of three states: red, yellow, or green. But, you also want to keep track of how long each state lasts. This duration can be represented as an associated value.
//
//```swift
//enum TrafficLight {
//    case red(time: Int)
//    case yellow(time: Int)
//    case green(time: Int)
//}
//
//var currentLight = TrafficLight.red(time: 60) // Red light lasts for 60 seconds
//
//switch currentLight {
//case.red(let time):
//    print("Red light for \(time) seconds.")
//case.yellow(let time):
//    print("Yellow light for \(time) seconds.")
//case.green(let time):
//    print("Green light for \(time) seconds.")
//}
//```
//
//In this example, each case of the `TrafficLight` enum has an associated value representing the duration of the light in seconds. This allows you to store additional information (the duration) alongside the state of the traffic light.
//
//### Example 2: Basic Shape Area Calculation
//
//Suppose you're calculating areas for basic shapes. Each shape type (circle, square, rectangle) requires different measurements to calculate its area. You can use associated values to store these measurements.
//
//```swift
//enum Shape {
//    case circle(radius: Double)
//    case square(side: Double)
//    case rectangle(width: Double, height: Double)
//}
//
//func calculateArea(shape: Shape) -> Double {
//    switch shape {
//    case.circle(let radius):
//        return Double.pi * radius * radius
//    case.square(let side):
//        return side * side
//    case.rectangle(let width, let height):
//        return width * height
//    }
//}
//
//var myShape = Shape.circle(radius: 5)
//print(calculateArea(shape: myShape)) // Output: 78.53981633974483
//```
//
//Here, the `Shape` enum has associated values that hold the dimensions needed to calculate the area of each shape. The `calculateArea` function uses these associated values to compute the area based on the shape's type and dimensions.
//
//### Summary
//
//Associated values in Swift enums allow you to attach additional data to each case of the enum. This data can be of any type and can vary between different cases. The examples provided illustrate how associated values can be used to store relevant information alongside the enum case, enabling more complex and expressive data models.



//enum Barcode {
//    case upc(Int, Int, Int, Int)
//    case qrCode(String)
//}
//
//var productBarcode = Barcode.upc(8, 85909, 51226, 3)
//productBarcode =.qrCode("ABCDEFGHIJKLMNOP")
//
//switch productBarcode {
//case.upc(let numberSystem, let manufacturer, let product, let check):
//    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
//case.qrCode(let code):
//    print("QR Code: \(code).")
//}

//In this example, Barcode is an enum with associated values. The .upc case has four integer associated values, and the .qrCode case has a single string associated value. This allows storing detailed information relevant to each barcode type.
