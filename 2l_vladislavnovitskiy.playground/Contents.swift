import UIKit

//1

func evenNumber(number: Int){
    number % 2 == 0 ? "Число четное" : "Число нечетное"
}
evenNumber(number: 6)

//2
func remainder(number: Int){
    number % 3 == 0 ? "делится без остатка" : "делится с остатком"
}
remainder(number: 10)

//3
var array = [Int]()
for i in 0...100{
    array.append(i)
}
print(array)

//4
for value in array{
    if value % 2 == 0{
        array.remove(at: array.firstIndex(of: value)!)
    }else if value % 3 != 0{
        array.remove(at: array.firstIndex(of: value)!)
    }
}
print(array)

//5
func fibonacci(number: Int) -> [Int]{
    var fibonacciArray = [Int]()
    for n in 0...number{
        if n == 0{
            fibonacciArray.append(0)
        }else if n == 1{
            fibonacciArray.append(1)
        }else{
            fibonacciArray.append(fibonacciArray[n - 1] + fibonacciArray[n - 2])
        }
    }
    return fibonacciArray
}
fibonacci(number: 50)

//6
//Работает на половину, какие-то числа убрает по алгоритму, а какие-то почему-то оставляет, хотя должен убирать по тому же алгоритму
func primeNumbers(number: Int) {
    var primeNumbersArray = [Int]()
    var count = number
    repeat {
        for i in 2 ..< count {
            if count % i != 0 {
             primeNumbersArray.append(count)
            }
        count -= 1
        }
    }while count > 2
  print(primeNumbersArray)
}

primeNumbers(number: 10)


