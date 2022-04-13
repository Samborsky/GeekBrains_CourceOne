//
//  main.swift
//  GeekBrains_CourceOne
//
//  Created by Samborsky on 05.04.2022.
//

import Foundation

//MARK: - энамы

enum CloseOpen {
    enum Doors {
        case open
        case close
    }
    enum Windows {
        case open
        case close
    }
}

enum Engine {
    case on
    case off
}
enum FuelType {
    case gas
    case benzin
    case diesel
}

enum Color {
    case blue
    case green
    case black
    case white
    case orange
    case gray
    case yellow
}
//MARK: - протоколы

protocol CarProtocol {
    var mark: String { get set }
    var model: String { get set }
    var country: String { get set}
    var year: Int { get set }
    var color: Color { get set }
    var engine: Engine { get set }
    var fuelType: FuelType? { get set }
    func engineWork(check engineStatus: Engine)
}
//MARK: - Расширения

extension CarProtocol {
    ///методом выбора типа топлива
    mutating func fuelChoose(choose fuel: FuelType) {
        switch fuel {
        case .gas:
            fuelType = .gas
            print("машина ездить на газу")
        case .benzin:
            fuelType = .benzin
            print("машина ездит на бензине")
        case .diesel:
            fuelType = .diesel
            print("машина ездит на дизеле")
        }
    }
}

extension CarProtocol {
    ///метод перекраски автомобиля
    mutating func setColor(set newColor: Color) {
        switch newColor {
        case .blue:
            color = .blue
            print("машина переклареша в синий цвет")
        case .green:
            color = .green
            print("машина переклареша в зеленый цвет")
        case .black:
            color = .blue
            print("машина переклареша в черный цвет")
        case .white:
            color = .white
            print("машина переклареша в белый цвет")
        case .orange:
            color = .orange
            print("машина переклареша в оранжевый цвет")
        case .gray:
            color = .gray
            print("машина переклареша в серый цвет")
        case .yellow:
            color = .yellow
            print("машина переклареша в желтый цвет")
        }
    }
}
///описание спортивного авто
extension SportCar: CustomStringConvertible {
    var description: String {
        return "ваш автомобиль \(mark) \(model) прямиком из \(country)"
    }
}
///описание грузовика
extension Truck: CustomStringConvertible {
    var description: String {
        return "ваш автомобиль \(mark) \(model) прямиком из \(country)"
    }
}

//MARK: - Класс спортивной машины
final class SportCar: CarProtocol {
    var mark: String
    var model: String
    var country: String
    var year: Int
    var color: Color
    var engine: Engine = .off
    var fuelType: FuelType?
    var spoiler: Bool
    var doors: CloseOpen.Doors = .close
    var windows: CloseOpen.Windows = .open

    init(mark: String,
         model: String,
         country: String,
         year: Int,
         color: Color,
         spoiler: Bool) {
        self.mark = mark
        self.model = model
        self.country = country
        self.year = year
        self.color = color
        self.spoiler = spoiler
    }
    ///включить/выключить двигатель
    func engineWork(check engineStatus: Engine) {
        switch engineStatus {
        case .on:
            engine = .on
            print("двигатель включен")
        case .off:
            engine = .off
            print("двигатель выключен")
        }
    }
}

//MARK: - класс грузовика

 class Truck: CarProtocol {
    var mark: String
    var model: String
    var country: String
    var year: Int
    var color: Color
    var engine: Engine = .off
    var fuelType: FuelType?
    var trailer: Bool
    var doors: CloseOpen.Doors = .close
    var windows: CloseOpen.Windows = .open

    init(mark: String,
         model: String,
         country: String,
         year: Int,
         color: Color,
         trailer: Bool) {
        self.mark = mark
        self.model = model
        self.country = country
        self.year = year
        self.color = color
        self.trailer = trailer
    }

    ///включить/выключить двигатель
    func engineWork(check engineStatus: Engine) {
        switch engineStatus {
        case .on:
            engine = .on
            print("двигатель включен")
        case .off:
            engine = .off
            print("двигатель выключен")
        }
    }
}

//MARK: - экземпляры класса
var FordGT = SportCar(mark: "Ford", model: "GT", country: "USA", year: 2012, color: .blue, spoiler: true)
FordGT.engineWork(check: .on)
FordGT.setColor(set: .green)
FordGT.spoiler = false
FordGT.windows = .close
FordGT.fuelChoose(choose: .gas)
print(FordGT.fuelType!)

var VolvoFH = Truck(mark: "Volvo", model: "FH", country: "Sweden", year: 2020, color: .blue, trailer: true)
VolvoFH.engineWork(check: .off)
VolvoFH.setColor(set: .white)
VolvoFH.trailer = false
VolvoFH.year = 2014
VolvoFH.doors = .close



