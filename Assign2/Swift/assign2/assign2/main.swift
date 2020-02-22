//
//  main.swift
//  assign2
//
//  Created by Lauren Kapraun on 1/27/20.
//  Copyright © 2020 Lauren Kapraun. All rights reserved.
//

//******************** QUESTION C & D ********************//
  import Foundation
 
 public protocol Discountable {
    func discount() -> Double
}

public class Item: Discountable {
    private let name: String
    private let price: Double
    private let quantity: Int

    // -------------------------------------------------------
    //  Create a new item with the given attributes.
    // -------------------------------------------------------
    public init(_ itemName: String, _ itemPrice: Double, _ numPurchased: Int) {
        self.name = itemName
        self.price = itemPrice
        self.quantity = numPurchased
    }
    
    public func discount() -> Double {
        var newPrice = self.price
        
        if (newPrice > 100){
            let discount = 0.10
            newPrice = newPrice - (newPrice*discount)
        }else if (newPrice > 200){
            let discount = 0.25
            newPrice = newPrice - (newPrice*discount)
        }else{
            let discount = 0
        }
        
        return newPrice
    }
    
    // -------------------------------------------------------
    //   Return a string with the information about the item
    // -------------------------------------------------------
    public func toString() -> String {
        //Create a Currency Converter
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency

        //Format Price and the Price*Quantity
        let formatterPrice = formatter.string(from: price as NSNumber)!
        let formatterPriceQuantity = formatter.string(from: price*Double(quantity) as NSNumber)!

        return "\(name) \t \(formatterPrice) \t \(quantity) \t\t\t \(formatterPriceQuantity) \n"
    }
    
    public func getTotalPrice () -> Double {
        let totalPrice = price * Double(quantity)
        return totalPrice
    }
}

/*let item: Discountable = Item("iPhone X", 999.00, 1)
if item.discount() > 0.20 {
    print("...")
}*/

//**********************************************************************
//ShoppingCart
//Represents a shopping cart as an array of items
//**********************************************************************
public class ShoppingCart {
    private var itemCount: Int
    private var totalPrice: Double
    private var capacity: Int
    private var cart: [Item?] = []

    // -----------------------------------------------------------
    //  Creates an empty shopping cart with a capacity of 3 items.
    // -----------------------------------------------------------
    public init() {
        capacity = 3
        itemCount = 0
        totalPrice = 0
        cart = Array<Item?>(repeating: nil, count: capacity)
    }

    // -------------------------------------------------------
    //  Adds an item to the shopping cart.
    // -------------------------------------------------------
    public func addToCart(_ itemName: String, _ price: Double, _ quantity: Int) -> Void {
        if (itemCount == capacity) {
            self.increaseSize()
            cart[itemCount] = Item(itemName, price, quantity)
        }else{
            cart[itemCount] = Item(itemName, price, quantity)
            itemCount = itemCount + 1
        }
        
        totalPrice = price * Double(quantity)
    }

    // -------------------------------------------------------
    //  Returns the contents of the cart together with
    //  summary information.
    // -------------------------------------------------------
    public func toString() -> String {
        //Create a Currency Converter
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency

        //Create a String variable to be used to display the headers & Array Items
        var contents: String
        
        //Create a Double variable to calculate the total price each iteration
        var calcTotalPrice: Double = 0.0

        //Show first line
        contents = "\n Shopping Cart \n"

        //Create heading for Array Info
        contents += "\n Item \t Price \t Quantity \t Total \n"

        //Loop through the array
        for case let cartItems? in cart {
            contents += (cartItems.toString())
            calcTotalPrice = (cartItems.getTotalPrice()) + calcTotalPrice
        }

        //Add total price
        contents += "\n Total Price: \(formatter.string(from: calcTotalPrice as NSNumber)!) \n"

        return contents
    }

    // ------------------------------------------------------------
    //  Increases the capacity of the shopping cart by doubling it.
    // ------------------------------------------------------------
    private func increaseSize() {
        let tempItem:[Item?] = cart

        capacity = capacity * 2
        cart = Array<Item?>(repeating: nil, count: capacity)

        cart.append(contentsOf: tempItem)
    }
}

//**********************************************************************
//GoShopping2
//A Java program that illustrates the use of:
// various data types, control structures, I/O (scanner), import, arrays, number formatting,
// use of multiple classes, etc.
//**********************************************************************

var str: String = "y"
var qty: Int = 0
var name: String = ""
var pr: Double = 0.0
var totalPrice:Double = 0.0

let formatter = NumberFormatter()
formatter.locale = Locale.current
formatter.numberStyle = .currency


var myCart = ShoppingCart()

repeat {
    //Show Prompt
    print("Enter the name, price and quantity of the item")

    name = readLine(strippingNewline: true)!
    pr = Double(readLine(strippingNewline: true)!)!
    qty = Int(readLine(strippingNewline: true)!)!

    myCart.addToCart(name, pr, qty)
    print(myCart.toString())

    print("Do you wish to continue (y/n)?")
    let tempStr = readLine()
    str = String(tempStr!)
    
    
    totalPrice = totalPrice+(pr*Double(qty))

} while (str == "y")

print("Please pay: \(formatter.string(from: totalPrice as NSNumber)!)")


//******************** QUESTION F ********************//
 /*import Foundation

public protocol Discountable {
    func discount() -> Double
}

public class Item: Discountable, Comparable {
    private let name: String
    private let price: Double
    private let quantity: Int

    // -------------------------------------------------------
    //  Create a new item with the given attributes.
    // -------------------------------------------------------
    public init(_ itemName: String, _ itemPrice: Double, _ numPurchased: Int) {
        self.name = itemName
        self.price = itemPrice
        self.quantity = numPurchased
    }
    
    public func discount() -> Double {
        var newPrice = self.price
        
        if (newPrice > 100){
            let discount = 0.10
            newPrice = newPrice - (newPrice*discount)
        }else if (newPrice > 200){
            let discount = 0.25
            newPrice = newPrice - (newPrice*discount)
        }else{
            let discount = 0
        }
        
        return newPrice
    }
    
    public static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.price < rhs.price
    }
    
    public static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.price == rhs.price
    }

    // -------------------------------------------------------
    //   Return a string with the information about the item
    // -------------------------------------------------------
    public func toString() -> String {
        //Create a Currency Converter
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency

        //Format Price and the Price*Quantity
        let formatterPrice = formatter.string(from: price as NSNumber)!
        let formatterPriceQuantity = formatter.string(from: price*Double(quantity) as NSNumber)!
        
        return "\(name) \t \(formatterPrice) \t \(quantity) \t\t\t \(formatterPriceQuantity)"
        
        
    }
    
    public func getTotalPrice () -> Double {
        let totalPrice = price * Double(quantity)
        return totalPrice
    }
}

let formatter = NumberFormatter()
formatter.locale = Locale.current
formatter.numberStyle = .currency

var items = [Item("item1", 20, 1), Item("item2", 10, 1)]
items.sort()

var contents: String
contents = "\n Shopping Cart \n"
contents += "\n Item \t Price \t Quantity \t Total \n"

print(contents)
var calcTotalPrice: Double = 0.0

for i in items {
    calcTotalPrice = (i.getTotalPrice()) + calcTotalPrice
    print(i.toString())
}

let totalPrice = "\n Total Price: \(formatter.string(from: calcTotalPrice as NSNumber)!) \n"
print(totalPrice)
*/


//******************** QUESTION B ********************//
/*
import Foundation

class Fraction {
    let numerator, denominator: Int

    init (numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }

    func reduce (_ numerator: Int, _ denominator: Int) -> String {
        var numerator = self.numerator
        var denominator = self.denominator

        var n = numerator
        var d = denominator

        func gcd(_ n: Int, _ d: Int) -> Int {
            let r = n % d

            if (r != 0) {
                return gcd(d, r)
            } else {
                return d
            }
        }

        let finalGCD = gcd(numerator, denominator)

        numerator = numerator / finalGCD
        denominator = denominator / finalGCD


        return "\(numerator)/\(denominator)"
    }
}

func add(_ fraction1:Fraction, _ fraction2:Fraction) -> Fraction {
  let d1 = fraction1.denominator
  let d2 = fraction2.denominator
  let n1 = fraction1.numerator
  let n2 = fraction1.numerator

  // Greatest Common Denominator
  var gcd = 0

  if (d2%d1 == 0) {
    gcd = d1;
  } else{
    gcd = d2%d1;
  }

  let denominator = (d1*d2) / gcd;
  let numerator = ((n1)*(denominator/d1)) + ((n2)*(denominator/d2))

  return Fraction(numerator: numerator, denominator: denominator)
}

func subtract(_ fraction1:Fraction, _ fraction2:Fraction) -> Fraction {
  let d1 = fraction1.denominator
  let d2 = fraction2.denominator
  let n1 = fraction1.numerator
  let n2 = fraction1.numerator

  let commonDenominator = d1%d2
  let largerDenominator = max(d1, d2)

  let numerator = (n1*commonDenominator) - n2
  let denominator = commonDenominator*largerDenominator

  return Fraction(numerator: numerator, denominator: denominator)
}

func multiply(_ fraction1:Fraction, _ fraction2:Fraction) -> Fraction {
  let d1 = fraction1.denominator
  let d2 = fraction2.denominator
  let n1 = fraction1.numerator
  let n2 = fraction1.numerator

  let numerator = n1*n2
  let denominator = d1*d2

  return Fraction(numerator: numerator, denominator: denominator)
}

func divide(_ fraction1:Fraction, _ fraction2:Fraction) -> Fraction {
  let d1 = fraction1.denominator
  let d2 = fraction2.denominator
  let n1 = fraction1.numerator
  let n2 = fraction1.numerator

  let numerator = n1*d2
  let denominator = d1*n2

  return Fraction(numerator: numerator, denominator: denominator)
}

let f1 = Fraction(numerator: 1, denominator: 2)
let f2 = Fraction(numerator: 1, denominator: 6)
let f3 = Fraction(numerator: 1, denominator: 3)

let d1 = f1.denominator
let d2 = f2.denominator
let d3 = f3.denominator
let n1 = f1.numerator
let n2 = f2.numerator
let n3 = f3.numerator

let fAdd = add(f1, f2)
let fSubtract = subtract(f1, f3)
let fMultiply = multiply(f1, f3)
let fDivide = divide(f1, f3)

print("The addition of \(n1)/\(d1) + \(n2)/\(d2) is: \(fAdd.numerator)/\(fAdd.denominator)")
print("The subtraction of \(n1)/\(d1) + \(n3)/\(d3) is: \(fSubtract.numerator)/\(fSubtract.denominator)")
print("The multiplication of \(n1)/\(d1) * \(n3)/\(d3) is: \(fMultiply.numerator)/\(fMultiply.denominator)")
print("The division of \(n1)/\(d1) * \(n3)/\(d3) is: \(fDivide.numerator)/\(fDivide.denominator) \n")

print("\(fAdd.numerator)/\(fAdd.denominator) reduced is: \(fAdd.reduce(fAdd.numerator, fAdd.denominator)) \n")
*/


//******************** QUESTION A ********************//
/*
import Foundation

print("How many temperatures do you have? ", terminator: "")

if let size = readLine(){
    if let size = Int(size){
        // Create variables for the array, sum, and average
        var temperature:[Double] = []
        var sum: Double = 0.0
        var average: Double = 0.0

        // Read temperatures
        print("Enter \(size) temperatures: ", terminator: "")
        for i in 1...size{
            if let temperatures = readLine(){
               if let temperatures = Double(temperatures){
                    temperature.append(temperatures)
                }
            }
        }

        // Compute temperature average & sum
        for temperatures in temperature{
            sum += temperatures
            average = sum/Double(temperature.count)
        }
        print("The average temperature is \(average)")

        // Display each temperature and its relation to the average:
        print("The temperatures are")
        for temperatures in temperature{
            if(temperatures < average){
                print("\(temperatures) below average.")
            }
            else if(temperatures > average){
                print("\(temperatures) above average.")
            }
            else{
                //temperature[index] == average
                print("\(temperatures) the average.")
            }
        }

         print("Have a nice week.")
    }
}
 */
