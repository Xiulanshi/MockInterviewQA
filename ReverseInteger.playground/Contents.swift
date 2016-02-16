//: Playground - noun: a place where people can play

import UIKit

func reverseInteger(var number: Int) -> Int {

    var reverse = 0
    
    while (number != 0) {
        reverse = reverse * 10 + number % 10
        number = number / 10
    }
    
    return reverse
}

reverseInteger(108)



func reverse(numbers: [Int]) -> [Int] {
    var reversed: [Int] = []
    
    for number in numbers {
        reversed.insert(number, atIndex: 0)
    }
    
    return reversed
}

reverse([1, 2, 3, 4, 5, 9])
