import UIKit

// Задача 1
var couples = [[45, 12], [10, 19], [191, 3], [41, 81]]
var sortedCouples = couples.map { (i) -> [Int] in
    if(i[0] > i[1]){
        var temp = [Int](i)
        temp.reverse()
        return temp
    }
    return i
}.sorted {
    $0[0] > $1[0]
}
print(sortedCouples)

// Задача 2
var str = "Hello world"
var dict = [Character:Int]()
str.map({
            if($0.isLetter){
                if(dict[$0] != nil){
                    dict.updateValue(dict[$0]! + 1, forKey: $0)
                }
                else{
                    dict[$0] = 1
                }
            }
})
//порядок букв в словаре может отличаться, можно добавить сортировку по алфавиту или значению
print(dict)

// Задача 3
var sentense = "Hello world! Today is a great day for coding!"
var upperWords = sentense.split(separator: " ").filter { Array($0)[0].isUppercase }
print(upperWords)


