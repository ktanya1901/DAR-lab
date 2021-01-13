import UIKit

var array: [Int] = [6,54,65,14,3,67,555,7,98,5,4,33]
print(array)

//Insertion sort
for i in 0..<array.count{
    let el = array[i]
    var j = i
    while(j > 0 && array[j-1] > el){
        array[j] = array[j-1]
        j = j - 1
    }
    array[j] = el
}

print(array)
