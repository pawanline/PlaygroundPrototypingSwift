import UIKit

var str = "Hello, playground"



// imperative programming

let numbers = [1,2,3,4,5]
var evenNumbers : [Int] = []

for i  in 0..<numbers.count {
    let number = numbers[i]
    if number % 2 == 0 {
        evenNumbers.append(number)
    }
}

print(evenNumbers)


//functional programming

let evenNumber = [1,2,3,4,5].filter { (number) -> Bool in
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

let number = [1,2,3,4,5].filter({$0 % 2 == 0})


print(number)


let arrayWithNoNils = ["1","two","3"].compactMap({ Int($0)})
print(arrayWithNoNils)
