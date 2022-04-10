//
//  main.swift
//  GeekBrains_CourceOne
//
//  Created by Samborsky on 05.04.2022.
//

import Foundation
//MARK: - родительский класс Car

class Car {
    ///подсчет количества автомобилей
    static var carsCount = 0

    var mark: String
    var model: String
    var country: String
    var odometr: Double
    var doors: Doors
    var windows: Windows = .close
    var transmition: Transmition
    var fuelType: FuelType
    var airbag: Airbag = .no
    var color: Color = .blue
    var condition: Condition {
        get {
            switch odometr {
            case 0...100:
                print("состояние вашей машины = \(Condition.new)")
                return .new
            case 100...:
                print("состояние вашей машины = \(Condition.old)")
                return .old
            default:
                print("введены некоректные данные")
            }
            return .old
        }
    }
    ///инициализация
    init (mark: String,
          model: String,
          country: String,
          odometr: Double,
          transmition: Transmition,
          fuelType: FuelType,
          doors: Doors) {
        self.mark = mark
        self.model = model
        self.country = country
        self.odometr = odometr
        self.transmition = transmition
        self.fuelType = fuelType
        self.doors = doors
        Car.carsCount += 1
    }
    ///деинициализация
    deinit {
        Car.carsCount -= 1
    }
///подсчет экземпляров родительского класса
    static func countInfo() {
        print("Всего существует \(self.carsCount) автомобилей")
    }
    ///метод показывающий инфу о машине
    func carInformation() {
        print("""
Вы ездите на \(mark) \(model), неплохой выбор! Коробка у вас типа \(transmition.rawValue), а
двигатель использует \(fuelType.rawValue)
""")

    }
///закрытие дверей
    func closeDoors() {
        doors = .close
    }
///открытие дверей
    func openDoors() {
        doors = .open
    }
    ///пустая функция для override для пере-использования ее в детях
    func closeOpen() {
    }
}
//MARK: - общие энамы

enum Color {
    case black
    case green
    case blue
    case white
    case red
    case yellow
    case orange
}

enum Condition {
    case new
    case old
}

enum Doors {
    case close
    case open
}

enum Windows {
    case open
    case close
}

enum Transmition: String {
    case automatic = "автомат"
    case manual = "механика"
    case robot = "робот"
}

enum FuelType: String {
    case diesel = "дизель"
    case gas = "газ"
    case electric = "электричество"
}

enum Airbag {
    case yes
    case no
}

//MARK: - класс SportCar
final class SportCar: Car {
    enum Turbine {
        case yes
        case no

        var status: String {
            switch self {
            case .yes:
                return "тачка в огнях, турбина на месте!"
            case .no:
                return "что ж, старый добрый атмосферник, неплохо"
            }
        }
    }

    var turbine: Turbine

    init(mark: String,
         model: String,
         country: String,
         odometr: Double,
         transmition: Transmition,
         fuelType: FuelType,
         doors: Doors,
         turbine: Turbine) {
        self.turbine = turbine
        ///в суперинит передаю значения из дочернего инита
        super.init(mark: mark,
                   model: model,
                   country: country,
                   odometr: odometr,
                   transmition: transmition,
                   fuelType: fuelType,
                   doors: doors)
    }

    override func carInformation() {
        print("Ваш спорткар \(mark) \(model) использует \(fuelType.rawValue), а коробка \(transmition.rawValue)")
    }
///открытие/закрытие окон
    override func closeOpen() {
        if windows == .open {
            print("окна закрыты")
            windows = .close
        } else {
            print("окна открыты")
            windows = .open }
    }
}

//MARK: - класс Truck

final class Truck: Car {
    var bed: Bool
    var trailer: Trailer

    enum Trailer {
        case yes
        case no
    }

    init(bed: Bool, trailer: Trailer) {
        self.trailer = trailer
        self.bed = bed
        ///в суперините инициализирую значения сразу
        super.init(mark: "Volvo",
                   model: "FH",
                   country: "Sweden",
                   odometr: 15,
                   transmition: .automatic,
                   fuelType: .diesel,
                   doors: .open)
    }

    override func carInformation() {
        print("Ваш грузовик \(mark) \(model) использует \(fuelType.rawValue), а коробка \(transmition.rawValue)")
    }
///присоединить прицеп
    func connectTrailer() {
        trailer = .yes
    }
///убрать прицеп
    func disconnectTrailer() {
        trailer = .no
    }
    ///метод открывающий/закрывающий окна
    override func closeOpen() {
        if windows == .open {
            print("окна закрыты")
            windows = .close
        } else {
            print("окна открыты")
            windows = .open }
    }
}

// MARK: - класс для уничтожения - deinit
final class Prototype {
   weak var prototype: SportCar?

    deinit {
        print("Опыт не удался, машину пришлось отправить на свалку")
    }
}

// MARK: - Экземпляры классов
var truckVolvo = Truck(bed: true, trailer: .no)

var truckKamaz = Truck(bed: false, trailer: .yes)

var sportCarAudi = SportCar(mark: "Audi", model: "RS8", country: "Germany", odometr: 543, transmition: .robot, fuelType: .diesel, doors: .close, turbine: .no)

var sportCarPorshe = SportCar(mark: "Porshe", model: "GT", country: "German", odometr: 43, transmition: .robot, fuelType: .electric, doors: .close, turbine: .yes)

///экземпляры под удаление
var prototypeCar: Prototype?
var basePrototype: SportCar?
prototypeCar = Prototype()
basePrototype = SportCar(mark: "Secret", model: "Omega", country: "USA", odometr: 0, transmition: .manual, fuelType: .electric, doors: .open, turbine: .yes)


// MARK: - действия с экземплярами класса грузовых авто
truckVolvo.closeOpen()
truckVolvo.carInformation()
truckVolvo.connectTrailer()
truckVolvo.condition //почему ворнинг, это ведь геттер ?
truckVolvo.airbag = .no
truckVolvo.color = .orange

truckKamaz.odometr = 42354
truckKamaz.condition
print(truckKamaz.airbag)
truckKamaz.disconnectTrailer()
// MARK: - действия с экземплярами класса спорткаров
sportCarPorshe.closeOpen()
sportCarPorshe.openDoors()
sportCarPorshe.carInformation()
sportCarPorshe.condition
sportCarPorshe.color = .red

sportCarAudi.closeOpen()
sportCarAudi.openDoors()
sportCarAudi.carInformation()
sportCarAudi.condition
sportCarAudi.color = .black
Car.countInfo()

///удаляем 
prototypeCar = nil
basePrototype = nil
Car.countInfo()
