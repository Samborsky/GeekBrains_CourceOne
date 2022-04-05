//
//  main.swift
//  GeekBrains_CourceOne
//
//  Created by Samborsky on 05.04.2022.
//

import Foundation

///1. функция определения четное число или нет
func evenNumberOrNot(number: Int) {
    if number % 2 == 0 {
        print("число \(number) четное")
    } else {
        print("число \(number) нечетное")
    }
}
/// 2. функция определения делится число на 3 без остатка или нет
func newFunc(number: Int) {
    number % 3 == 0 ? print("ваше число делится на 3 без остатка") : print("число \(number) не делится на 3 без остатка")
}
/// 3. создать возрастающий массив из 100 чисел
var newArray = [Int]()
var number = 0

for _ in 1...100 {
    number += 1
    newArray.append(number)
}
//4. удалить из массива все четные числа и числа которые  не делятся на 3
///через замыкание
newArray.removeAll(where: { $0 % 2 == 0 || $0 % 3 != 0})//вариант с замыканием
///через цикл for in
for i in newArray where i % 2 == 0 || i % 3 != 0 {
    let number = newArray.firstIndex(of: i) ?? 0
    newArray.remove(at: number)
}

