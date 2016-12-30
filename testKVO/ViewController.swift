//
//  ViewController.swift
//  testKVO
//
//  Created by zzw on 16/10/13.
//  Copyright © 2016年 zzw. All rights reserved.
//

import UIKit

private var myContext = 0
class ViewController: UIViewController, testPro {

    var xiaoming: Student!

    convenience init () {
        self.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        xiaoming = Student()
        xiaoming.addObserver(self, forKeyPath: "age", options: .new, context: &myContext)
        var sum = 0

        for i in 0 ..< 1000 {
            sum += i
        }
        print("10")
        xiaoming.age = 10


        /// protocol
        var car =  MyCar()
        print("\(car.color.description)")
        car.changeColor()
        print("\(car.color.description)")
        // Do any additional setup after loading the view, typically from a nib.

        let arr = [0,1,2,3,4]
        //   SequenceType      for...in
        for i in ReverseSequence(array: arr) {
            print("Index \(i) is \(arr[i])")
        }

        let arr2 = ["445","345","45","35","435"]
        //   SequenceType      for...in
        for i in ReverseSequence(array: arr2) {
            print("Index \(i) is \(arr2[i])")
        }

        let arr3 = [1,2,3,4,5,6]
        let g = ReverseGenerator.init(array: arr3)
        while let obj = g.next() {
            print("*",arr3[obj])
        }

        let numbers = [2, 3, 5, 7]
        var numbersIterator = numbers.makeIterator()

        while let num = numbersIterator.next() {
            print(num)
        }
        var (x,y) = (4,5)
        let swap = swapMe()
        swap.swapMe(a: &x, b: &y)

        print(x,y)

        /// class and struct reference_type and value_type
        let cframeObj = cRect.init()
        cframeObj.frame = CGRect.init(x: 0, y: 0, width: 10, height: 20)

        let cframe2 = cframeObj
        cframe2.frame = CGRect.init(x: 0, y: 0, width: 10, height: 40)

        print(cframeObj.frame)


        var srectObj = sRect.init()
        srectObj.frame = CGRect.init(x: 0, y: 0, width: 10, height: 20)
        var srectObj2 = srectObj
        srectObj2.frame = CGRect.init(x: 0, y: 0, width: 10, height: 40)

        print(srectObj.frame)

        /// incout  传指针
        let rect = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        let (small, large) = rect.divided(atDistance: 20, from: .minXEdge)//.rectsByDividing(20, fromEdge: .MinXEdge)

        print(small, large)



        logIfTrue(3>2)
        


//        logIfTrue (predicate: {
//            return 4 > 3})


        ///@autoclosure   (void) -> (T) T can be void
//        var level : Int?
//        var startLevel = 1
//        var currentLevel = level ?? startLevel
//
//        if let result =  currentLevel{
//
//        }

        /// 解包
        let xiaoLin = Child()
        xiaoLin.pet = Pet()
        xiaoLin.pet?.toy = Toy.init(name: "toyname")


        let playClosure = {(child: Child) -> ()? in child.pet?.toy?.play()}


        if let _: () = playClosure(xiaoLin) {
            print("happy")
        } else {
            print("sad")
        }


        /// 重载运算符
        let v1 = Vector2D(x: 2.0, y: 3.0)
        let v2 = Vector2D(x: 1.0, y: 4.0)
        //let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
        let v3 = v1 + v2
        print(v3)
        let doubleSum  = v1 +* v2
        print(doubleSum)

        /// 访问控制
        let user1 = MyUser()
        print(user1.accessPrivate)

        /// 参数修饰
        var test = 12
        let test2 = incrementor(variable: test)
        print(test2)
        print(test)
        incrementOne(variable: &test)
        print(test)



        let ret = makeIncrementor(addNumber: 12)
        ret(&test)
        print("test",test)


        /// 字面量转换
        let mytrue: MyBool = true
        let myfalse: MyBool = false
        print(mytrue, myfalse)

        /// 下标
        var arrMy:Array = [1, 2, 3, 4, 5]
        arrMy[[0, 2, 3]] = [-1, -3, -4]
        print(arrMy)

        let arrTest = arrMy[[0, 1, 2]]
        print("arrTest", arrTest)

        let myarr = [0, 3, 4]
        for (index,i) in myarr.enumerated() {
            print(index,"index",i,"i")
        }

        MyClassContainer1.MyClass.hello()

        print("***********")
        MyClassContainer2.MyClass.hello()

        /// Any与anyObject
        let swiftInt: Int = 1
        let swiftString: String = "miao"
        var array: [Any] = []
        array.append(swiftInt as AnyObject)
        array.append(swiftString as AnyObject)
        print("array",array)

        let sumof5 = MySum(input: 1,2,3,4,5)
        print(sumof5)

        let tiger = Tiger.init()
       // tiger.name = "tiger"

        print(tiger.name)

        /// 父类中的convenience init方法子类没法重载但是只要子类重载了convenience所需的父类方法就可以调用父类的convenience方法
        let classb = ClassB.init(num: 12)
            //ClassB.init(bignumber: true)
        print(classb.numB)

        let url = NSURL(string: "ht tp://swifter。tips")
        print("url",url)

        let number1 = Int(fromString: "12")
        print(number1)
        // {Some 12}
        let number2 = Int(fromString: "三二五")
        print(number2)
        // {Some 325}
        let number3 = Int(fromString: "七9八")
        print(number3)
        // {Some 798}
        let number4 = Int(fromString: "吃了么")
        print(number4)
            // nil

        let number5 = Int(fromString: "1a4n")
        print(number5)
        // nil

        let arrD: [CustomStringConvertible] = [1, 2, "three"]
        for obj in arrD {
            print(obj.description)
        }

        let mixed = [IntOrString.IntValue(1),
                     IntOrString.StringValue("two"),
                     IntOrString.IntValue(3)]
        for value in mixed {
            switch value {
            case let .IntValue(i):
                print(i * 2)
            case let .StringValue(s):
                print(s.capitalized)
            }
        }


        let patternStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

        //let matcher:NSRegularExpression
        do {
            let matcher  = try NSRegularExpression.init(pattern: patternStr, options: .caseInsensitive)
            let strTest = "123qq.com"

            let result = matcher.matches(in: strTest, options: .withTransparentBounds, range: NSRange.init(location: 0, length: strTest.characters.count))
//            for obj in result {
//                print(obj.description)
//                //print((strTest as NSString).substring(with: obj.range))
//            }
            print("result",result.count)
            } catch{}



        let myc = MyClassCopyable.init()
        myc.num = 10
        print(myc.num)

        let foo = MyClass()
        foo.date = foo.date.addingTimeInterval(10086)


        /// final
        let son = sonClass.init()
        son.methodSon()
         /// lazy map
         let data = 1...3
        let result = data.lazy.map {
            (i: Int) -> Int in print("map\(i)")
            return i * 2
        }
        print("mapdone")
        for i in result {
            print("result\(i)")
        }
        print("done")

        /// mirror
        let xiaoMing = Person(name: "XiaoMing", age: 16)
        let r = Mirror(reflecting: xiaoMing) // r   MirrorType print("xiaoMing   \(r.displayStyle!)")
        print("    :\(r.children.count)")
        //r.children[0]
//        for i in r.children.startIndex ..< r.children.endIndex {
//            print("   :\(r.children[i].0!)  :\(r.children[i].1)")
//        }

        for case let (label, value) in r.children {
            print("label:",label!,"  value:",value)

        }
        dump(xiaoMing)

        /// 多重解包
        let anil: String? = nil
        let aString: String?? = anil
        let bString: String?? = nil
        if let a = aString {
            print("astring", a)
        }
        if let b = bString {
            print("bstring", b)
        }

        var num: Int? = 3
        let anyResult = num.map {
            $0 * 2
        }
        num = nil
        let someresult = num.map {
            $0 * 2
        }

        print(anyResult)
        print(someresult)

        let b1 = B1() // b1 is B1
        print(b1.method1())
        // hello
        let a1: A1 = B1()
        // a1 is A1
        print(a1.method1())

        
        let b2 = B2()
        print(b2.method2()) // hello
        print(b2.method2()) // hello

        let a2 = b2 as A2
        print(a2.method1()) // hello
        print(a2.method2()) // hi

        var objA: A?  = A.init()
        objA = nil

        var xiaomin: PersonAgain? = PersonAgain.init(personName: "xiaomin")
        _ = xiaomin!.printName
        xiaomin = nil

        //loadBigData()

        /// 构建Range<String.Index>
        let levels  = "a cde"
        let  indexOne = levels.index(levels.startIndex, offsetBy: 1)
        let endIndex = levels.index(levels.startIndex, offsetBy: 2)

        let swiftRange = indexOne ..< endIndex

        let st = levels.replacingCharacters(in: swiftRange, with: "b")
        print("st",st)



        class ZWClass {
            var a = 1
            deinit {
                print("deinit")
            }
        }
//        var zwcl = ZWClass.init()
//        var pt: UnsafeMutablePointer<ZWClass> =

        var pointer: UnsafeMutablePointer<ZWClass>!
        pointer = UnsafeMutablePointer<ZWClass>.allocate(capacity: 1)
        pointer.initialize(to: ZWClass())
        print(pointer.pointee.a)  // 1
        pointer.deinitialize()

        DispatchQueue.global().async {
            print("list")
//            synchronized(lock: self) {
//                for i in 0 ..< 10 {
//                    print("\(i)")
//                }
//            }
            //loadBigData()
            Thread.sleep(forTimeInterval: 3)
            DispatchQueue.main.async {
                print("main")
            }
        }
        //let delay = dispatch_time(DispatchTime.now,
                                 // Int64(2 * Double(NSEC_PER_SEC)))
        //DispatchQueue.asyncAfter(DispatchQueue.main)
        let timeNow = NSDate()
        let timeStr: AnyClass! = object_getClass(timeNow)
        print(timeStr)
        if timeNow.isKind(of: NSDate.self) {
            print("right")
        }
        let intNum: Int = 16
        print(intNum.hashValue)

        let arr343: NSArray = [1,2,3,4,5]
        var result12 = 0
        arr343.enumerateObjects ({ (num, ids, stop) in
            result12 += num as! Int
            if ids == 2 {
                stop.pointee = true
            }

        })
        print(result12)
        let doub = 3.13424
        let str = String.init(format: "%.2f", doub)
        print(str)

        print(doub.formatString(format: ".3"))
        let intStr: NSString = NSString.init(format: "%@", doub.formatString(format: ".3"))
        let int2 = intStr.intValue
        print(int2)

        let int3: Int = 0
       // let float3: Float = 0.0
       // let double3: Double = 0.0
        let intNumber3: NSNumber = NSNumber.init(value: int3)
        print(String.init(validatingUTF8: intNumber3.objCType))


//        let floatNumber3: NSNumber = NSNumber(float3)
//        let doubleNumber3: NSNumber = NSNumber(double3)
//        String.fromCString(intNumber3.objCType)
//        String.fromCString(floatNumber3.objCType)
//        String.fromCString(doubleNumber3.objCType)

        let del = delegateTest.init()
        del.delegate = self
        del.num = 10
        del.method()
        _ = UInt32(10000)

        let num2: Int = Int(arc4random_uniform(3))
        print("num2",num2)

        let max = Int.max
        print(max &+ 1,max)
        let maxDou: Double = Double(max) * 1000
        print("maxDou",maxDou)
        print("master")






    }

    func delegateMethod() {
        print("delegateMethod")

    }



    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if  context == &myContext {
            if let change = change {
                let a = change[NSKeyValueChangeKey.newKey]
                print("\(a)")

            }

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit {
        xiaoming.removeObserver(self, forKeyPath: "age", context: &myContext)

    }


    








}



