//
//  main.swift
//  GeekBrains_CourceOne
//
//  Created by Samborsky on 05.04.2022.
//

import Foundation

//Задание 1 - решить квадратное уравнение
let a:Double = 1
let b:Double = 6
let c:Double = 9
let descriminant = pow(b,2) - 4 * a * c//находим дискриминант
if descriminant < 0 {
    print("Дискриминант меньше 0, поэтому уравнение не имеет вещественных корней")
} else if descriminant == 0 {//находим x
    let x = -b / 2 * a
    print("Дискриминант имеет один корень: \(x)")
} else {//находим x1, x2
    let x1 = (-b - sqrt(descriminant)) / (2 * a)
    let x2 = (-b + sqrt(descriminant)) / (2 * a)
    print("Уравнение имеет два разных вещественных корня:\nx1 = \(x1)\nx2 = \(x2)")
}
//Задание 2 даные катеты прямоугольного треугольника. найти площадь, периметр и гипотенузу треугольника
let leg1: Double = 15
let leg2: Double = 10
let area = 0.5 * leg1 * leg2//нахождим площадь
let hypotenuse =  sqrt(pow(leg1, 2) + pow(leg2, 2))//находим гипотенузу
let perimetr = (hypotenuse + leg1 + leg2)
print("При катетах равных \(leg1) и \(leg2), площадь прямоугольного треугольника будет равна: \(area), гипотенуза: \(hypotenuse), а периметр: \(perimetr)")
//Задание 3 пользователь вводит сумму вклада в банк и годовой процент. найти сумму вклада через 5 лет
print("Введите желаемую сумму вклада")
let summaVklada = Double(readLine() ?? "") ?? 0
print("Введите процентную ставку вклада")
let procentVklada = Double(readLine() ?? "") ?? 0
print("Введите срок вклада")
let termVklad = Double(readLine() ?? "") ?? 0
let summaryResult = (summaVklada * (procentVklada / 100) * termVklad) + summaVklada

switch termVklad {
case 1:
    print("За \(Int(termVklad)) год вы заработали \(summaryResult - summaVklada) , итого на вашем балансе \(summaryResult) денег ")
case 2...4:
    print("За \(Int(termVklad)) года вы заработали \(summaryResult - summaVklada) , итого на вашем балансе \(summaryResult) денег ")
case 5...:
    print("За \(Int(termVklad)) лет вы заработали \(summaryResult - summaVklada) , итого на вашем балансе \(summaryResult) денег ")
default: break
}

