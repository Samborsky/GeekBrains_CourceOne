//
//  main.swift
//  GeekBrains_CourceOne
//
//  Created by Samborsky on 05.04.2022.
//

import Foundation
//MARK: - основные энамы
///enum отвечающий за закрытие/открытие
enum CloseOpen {
    enum Doors {
        case open
        case closed
    }
    enum Windows {
        case open
        case closed
    }
}
enum Engine {
    case on
    case off
}
enum Transmition {
    case manual
    case automat
    case robot
}
enum FuelType {
    case diesel
    case gas
    case benzin
    case electric
}
enum ClimatControl {
    case yes
    case no
}
enum AirBag {
    case yes
    case no
}
enum Condition {
    case new
    case old
}
enum Headlight {
    case on
    case off
}
enum Color: String {
    case blue
    case green
    case black
    case white
    case yellow
    case red
    case purple
    case gray
}
// MARK: - структура спорткара
struct SportCar {
    let mark: String
    let model: String
    let year: UInt
    var odometr: Double
    let manufactureCountry: String
    var doors: CloseOpen.Doors = .closed // есть метод
    var windows: CloseOpen.Windows = .closed
    var engine: Engine = .off // есть метод
    var transmition: Transmition//если год выпуска свежий, то менять
    var fuelType: FuelType
    var climatControl: ClimatControl = .no
    var airBag: AirBag = .yes
    var condition: Condition = .old // есть метод
    var headlight: Headlight = .off
    var color: Color
    var trunkSpace: UInt
    var usedTrunkSpace: UInt
    var remainTrunkSpace: UInt {
        //я так понимаю в структуре так сделать нельзя из-за value type? только в классе?
//        if usedTrunkSpace > trunkSpace {
//            usedTrunkSpace = trunkSpace
//        }
           return  trunkSpace - usedTrunkSpace
    }
    ///метод перекраски автомобиля
    mutating func colorChange(set color: Color) {
        switch color {
        case .black:
            self.color = .black
            print("Машина покрашена в черный цвет")
        case .blue:
            self.color = .blue
            print("машина покрашена в синий цвет")
        case .green:
            self.color = .green
            print("машина покрашена в зеленый цвет")
        case .purple:
            self.color = .purple
            print("машина покрашена в сиреневый цвет")
        case .red:
            self.color = .red
            print("машина покрашена в красный цвет")
        case .white:
            self.color = .white
            print("машина покрашена в белый цвет")
        case .yellow:
            self.color = .yellow
            print("машина покрашена в желтый цвет")
        case .gray:
            self.color = .gray
            print("машина покрашена в cерый цвет")
        }
    }
    ///метод работы фар
       private mutating func headlightStatus() {
           if engine == .on {
                headlight = .on

            } else {
                headlight = .off
            }
        }
    ///метод запуска двигателя и фар
    mutating func engineStatus(engine: Engine) {
        self.engine = engine
        switch engine {
        case .on:
            headlightStatus()
            print("двигатель запущен, фары включены")
        case .off:
            headlightStatus()
            print("двигатель выключен, фары потушены")
        }
    }
    ///метод открытия дверей
    mutating func closeDoors(doors: CloseOpen.Doors) {
        self.doors = doors
        switch doors {
        case .open:
            print("двери открыты")
        case .closed:
            print("двери закрыты")
        }
    }
    ///метод  изменения состояния машины в зависимости от пробега. меняем odometr и condition
    mutating func setMileage(set carOdometr: Double) {
        if carOdometr > 100 {
            odometr = carOdometr
            condition = .old
        } else if 0...100 ~= carOdometr{
            odometr = carOdometr
            condition = .new
        }
    }
}
// MARK: - структура грузовика
struct Truck {
    enum Trailer {
        case yes
        case no
    }
    var mark: String
    var model: String
    var year: UInt
    var odometr: Double
    var condition: Condition = .old
    var trailer: Trailer
    var doors: CloseOpen.Doors = .closed
    var windows: CloseOpen.Windows = .open
    var engine: Engine = .off
    var fuelType: FuelType
    var headlight: Headlight = .off
    var color: Color
    var transmition: Transmition = .automat
    var destination: String {
        willSet {
            print("Грузовик направляется в \(newValue)")
        }
        didSet {
            print("Грузовик выехал из \(oldValue) и едет дальше")
        }
    }
    ///
    mutating func colorChange(set color: Color) {
        switch color {
        case .black:
            self.color = .black
            print("Машина покрашена в черный цвет")
        case .blue:
            self.color = .blue
            print("машина покрашена в синий цвет")
        case .green:
            self.color = .green
            print("машина покрашена в зеленый цвет")
        case .purple:
            self.color = .purple
            print("машина покрашена в сиреневый цвет")
        case .red:
            self.color = .red
            print("машина покрашена в красный цвет")
        case .white:
            self.color = .white
            print("машина покрашена в белый цвет")
        case .yellow:
            self.color = .yellow
            print("машина покрашена в желтый цвет")
        case .gray:
            self.color = .gray
            print("машина покрашена в cерый цвет")
        }
    }
    ///метод  изменения состояния машины в зависимости от пробега. меняем odometr и condition
    mutating func setMileage(set carOdometr: Double) {
        if carOdometr > 100 {
            condition = .old
            odometr = carOdometr
        } else if 0..<100 ~= carOdometr{
            condition = .new
            odometr = carOdometr
        }
    }
    ///метод запуска двигателя и фар
    mutating func engineStatus(engine: Engine) {
        self.engine = engine
        switch engine {
        case .on:
            headlight = .on
            print("двигатель запущен, фары включены")
        case .off:
            headlight = .off
            print("двигатель выключен, фары потушены")
        }
    }
}
// MARK: - объявление структур
var sportCarOne = SportCar(mark: "Lamborghini", model: "Huracan", year: 2018, odometr: 50, manufactureCountry: "Italy", transmition: .automat, fuelType: .diesel, color: .red, trunkSpace: 500, usedTrunkSpace: 100)
sportCarOne.engineStatus(engine: .on)
sportCarOne.colorChange(set: .yellow)
sportCarOne.closeDoors(doors: .open)
sportCarOne.windows = .open
sportCarOne.setMileage(set: 10)
sportCarOne.fuelType = .benzin
print(sportCarOne.remainTrunkSpace)
print("---------------------------")

var volvoTruck = Truck(mark: "Volvo", model: "FH", year: 2015, odometr: 543654.5, trailer: .yes, fuelType: .diesel, color: .gray, destination: "Rome")
volvoTruck.destination = "Moscow"
volvoTruck.colorChange(set: .blue)
volvoTruck.setMileage(set: 432)
volvoTruck.engineStatus(engine: .on)
volvoTruck.transmition = .manual
