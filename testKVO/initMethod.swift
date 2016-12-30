//
//  initMethod.swift
//  testKVO
//
//  Created by zzw on 2016/10/17.
//  Copyright © 2016年 zzw. All rights reserved.
//


// MARK: - hard
import Foundation

class ClassA {
    let numA: Int
    init(num: Int) {
        numA = num
    }
   required convenience init(bignumber: Bool) {
        self.init(num: bignumber ? 1000 : 1)
    }
}
class ClassB: ClassA {
    let numB: Int
    override init(num: Int ) {
        numB = num + 1
        super.init(num: num)
    }

}

class Cat {
    var name: String
    init() {
        name = "cat"
    }
}
class Tiger: Cat {
    let power: Int
    override init() {
        power = 10
        super.init()
        name = "tiger"

    }
}

extension Int {
    init?(fromString: String) {
        self = 0
        var digit = fromString.characters.count - 1
        for c in fromString.characters {
            var number = 0
            if let n = Int(String(c)) {
                number = n
            } else {
                switch c {
                case "一": number = 1
                case "二": number = 2
                case "三": number = 3
                case "四": number = 4
                case "五": number = 5
                case "六": number = 6
                case "七": number = 7
                case "八": number = 8
                case "九": number = 9
                case "零": number = 0
                default: return nil
                }
            }
            self = self + number * Int(pow(10, Double(digit)))
            digit = digit - 1
        }
    } }


protocol Copyable {
    func copy() -> Self
}


class MyClassCopyable: Copyable {
    var num = 1
    func copy() -> Self {
        let result = type(of: self).self.init()
        result.num = num
        return result
    }
    required init() {
    }

}

class MyClass {
    var date: NSDate {
        willSet {
            let d = date
            print("       \(d)     \(newValue)") }
        didSet {
            print("       \(oldValue)     \(date)")
        } }
    init() {
        date = NSDate()
    }
}

class FathClass {

    final func method()  {
        print("FathClass")
        methodSon()
    }

    func methodSon() {
        fatalError("fatalError,please override func methodSon")
    }
    init() {
        method()
    }

}

class sonClass: FathClass {
    override func methodSon() {
    print("methodSon overridden")
    }

}


protocol A1 {
    func method1() -> String
}
struct B1: A1 {
    func method1() -> String {
        return "hello"
    }
}

protocol A2 {
    func method1() -> String
}
extension A2 {
    func method1() -> String {
        return "hi" }
    func method2() -> String {
        return "hi"
    }
}

struct B2: A2 {
    func method1() -> String {
        return "hello"
    }
    func method2() -> String {
        return "hello"
    }
}

