//: Playground - noun: a place where people can play

import UIKit

func printBinaryRepresentation(number:Int) {
    if number == 0 { return }
    printBinaryRepresentation(number/2)
    print(number%2, terminator:"")
}

let number = 6
printBinaryRepresentation(number)


var arr = [ 1,2,3,4,5,6]
func arraySwap(inout arr: [Int], startIdx:Int) {
    if startIdx >= arr.count { return }
    swap(&arr[startIdx], &arr[startIdx+1])
    return arraySwap(&arr, startIdx: startIdx + 2)
}

arraySwap(&arr, startIdx: 0)


func f(i: Int) -> Int {
    if i == 0 {return 0}
    return f(i-1)
}
print(f(4))

func countPins(rows: Int) -> Int {
    // How many pins in the first row (tip of the triangle)?
    if rows == 1 {return 1}
    // How many pins in the nth row?
    var pins = rows
    // How many pins in the rest of the triangle?
    pins += countPins(rows-1)
    return pins
}

countPins(5)

func factorial(num:Int) -> Int {
    if num == 0 {return 1}
    return num * factorial(num - 1)
}

func fib(num: Int) -> Int {
    if num == 0 {return 1}
    if num == 1 {return 1}
    return fib(num-1) + fib(num-2)
}
fib(10)


func sum(num: Int) -> Int {
    if num == 0 { return 0 }
    let digit = num%10
    return digit + sum(num/10)
}

sum(128)


//factorial
func factorial1(number: Int) -> Int {
    if number == 0 {return 1}
    return number * factorial1(number-1)
}

//bunny ears
func bunnyEars(numberOfBunnies: Int) -> Int {
    if numberOfBunnies == 0 {return 0}
    return 2 + bunnyEars(numberOfBunnies - 1)
}

//bunny ears 2
func bunnyEars2(numberOfBunnies: Int) -> Int {
    if numberOfBunnies == 0 {return 0}
    if numberOfBunnies%2 == 0 {
        return 3 + bunnyEars2(numberOfBunnies - 1)
    } else {
        return 2 + bunnyEars2(numberOfBunnies - 1)
    }
}

//triangle
func triangle(rows: Int) -> Int {
    if rows == 0 {return 0}
    return rows + triangle(rows-1)
}

//Sum Digits
func sumDigits(number: Int) -> Int {
    if number == 0 {return 0}
    let digit = number % 10
    return digit + sumDigits(number / 10)
}

//fibonacci
func fibonacci(num: Int) -> Int {
    if num == 0 { return 0 }
    if num == 1 { return 1 }
    return fibonacci(num - 1) + fibonacci(num - 2)
}

fibonacci(10)

let arr2D =
[ [1,2,3],[4,5,6],[7,8,9],[1,5,9] ]

var newArr = [Int]()

func printRow(arr2D:[[Int]], row: Int) {
    for i in 0..<arr2D[0].count {
        print(arr2D[row][i])
    }
}

func printCol(arr2D: [[Int]], col:Int) {
    
}

printRow(arr2D, row: 2)
