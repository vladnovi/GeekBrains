import UIKit
//1
var pervyiKoren: Float = 0
var vtoroyKoren: Float = 0
var diskriminant: Float = 0

let a: Float = 3
let b: Float = 5
let c: Float = 2

diskriminant = (b * b) - 4 * (a * c)

if diskriminant > 0{
    pervyiKoren = (-b + sqrt(diskriminant)) / (2 * a)
     vtoroyKoren = (-b - sqrt(diskriminant)) / (2 * a)
    print("Первый корень= \(pervyiKoren) Второй корень= \( vtoroyKoren)")
}else if diskriminant == 0{
    pervyiKoren = -b / (2 * a)
    print("Корень= \(pervyiKoren)")
}else{
    print("нет корней")
}


//2
let katet1: Float = 5
let katet2: Float = 4

let ploshad: Float = (katet1 * katet2) / 2
let gypotenuza: Float = sqrt((katet1 * katet1) + (katet2 * katet2))
let perimetr: Float = katet1 + katet2 + gypotenuza
print("Площадь= \(ploshad) Гипотенуза= \(gypotenuza) Периметр= \(perimetr)")


//3
let a2 = 1000
let b2 = 10

let year1 = ((1000 / 100) * 10) + 1000
let year2 = ((year1 / 100) * 10) + year1
let year3 = ((year2 / 100) * 10) + year2
let year4 = ((year3 / 100) * 10) + year3
let year5 = ((year4 / 100) * 10) + year4
print("Итоговая сумма за 5 лет - \(year5)")
