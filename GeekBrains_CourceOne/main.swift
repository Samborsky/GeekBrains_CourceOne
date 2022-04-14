//
//  main.swift
//  GeekBrains_CourceOne
//
//  Created by Samborsky on 05.04.2022.
//

import Foundation
// реализовать свой тип коллекции "очередь" с использованием дженериков

extension Queue {
    ///пустой массив или нет
    func isEmpty() -> Bool {
        return queue.isEmpty
    }

}

class Queue<T> {
    ///массив
    var queue: [T]
    init(queue:[T]) {
        self.queue = queue
    }
    ///добавление по 1 элементу
    func addItemInArray(add item: T) {
            queue.append(item)
    }
    ///вывод целого массива списком
    func anyItems<T>(add items: [T]) {
        for item in items {
            print(item)
        }
    }

}

var numbersArray = Queue(queue: [10,2,6,4,5])
numbersArray.addItemInArray(add: 16)
print(numbersArray.queue)

var stringArray = Queue(queue: ["a", "b"])
stringArray.addItemInArray(add: "c")
print(stringArray.queue)

var doubleArray = Queue(queue: [1.2, 5.1])
doubleArray.addItemInArray(add: 54.3)
print(doubleArray.queue)

//сортируем от меньшего к большему
print(numbersArray.queue.sorted(by: {$0 < $1}))

// отсеиваем числе меньше 7
print(numbersArray.queue.filter( {$0 > 7}))

//умножаем элементы массива на 2
print(doubleArray.queue.map({$0 * 2}))

//дублируем элементы n раз
print(numbersArray.queue.flatMap({Array(repeatElement($0, count: 4))}))

//сумма элементов массива
print(numbersArray.queue.reduce(0, +))
// можно вывести наш экземпляр класса
numbersArray.anyItems(add: numbersArray.queue)
print(numbersArray.isEmpty())

