import UIKit

var str = "Hello, playground"
let dict = ["A": 12,"B":17,"C":8,"D":25]

//Q1:- Print below
//CABD


 // Its prouducing wrong results.

let dictSorted = dict.sorted { (keyVal1, keyVal2) -> Bool in
    keyVal1.value < keyVal2.value
}

//print("sorted dictionary 1 : \(dictSorted)")
//
let sortedDictionary  = dict.sorted { $0.1 < $1.1}
//print("sorted dictionary 2 : \(sortedDictionary)")

for (key,_) in sortedDictionary {
   print(key,separator: "",terminator: "")
}
print("\n")
for (key,_) in dictSorted {
     print(key,separator: "",terminator: "")
}



