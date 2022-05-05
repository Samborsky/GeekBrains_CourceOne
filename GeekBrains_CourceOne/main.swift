//
//  main.swift
//  GeekBrains_CourceOne
//
//  Created by Samborsky on 05.04.2022.
//

import Foundation

//MARK: - первый вариант ДЗ с guard и enum

///протокол  кофемашины
protocol CoffeProtocol {
    var wallet: Int { get set }
}

///разновидность кофе в автомате
enum Products {
    case latte
    case americano
    case cappuccino
    case espresso
    case hotChocolate

    var name: String {
        switch self {
        case .latte:
            return "латте"
        case .americano:
            return "американо"
        case .cappuccino:
            return "капучино"
        case .espresso:
            return "эспрессо"
        case .hotChocolate:
            return "горячий шоколад"
        }
    }
}

//энам с возможными ошибками
enum ErrorsCoffeMachine: Error {
    case errorNoMoney
    case errorCount
    case somethingElse
}

///характеристики товара
struct Items {
    var price: Int
    var count: Int
    var product: Products
}
//наш основной класс
final class CoffeMachine: CoffeProtocol {
    var wallet: Int = 0
///словарь с продуктами
    private var inventory: [Products: Items] = [
        .americano: Items(price: 10, count: 4, product: .americano),
        .cappuccino: Items(price: 15, count: 10, product: .cappuccino),
        .espresso: Items(price: 13, count: 7, product: .espresso),
        .latte: Items(price: 20, count: 0, product: .latte),
        .hotChocolate: Items(price: 8, count: 2, product: .hotChocolate)
    ]
///заказ кофе с последующей проверкой через guard
    func coffeeOrder(product: Products) throws -> Products {
        guard let item = inventory[product] else { throw ErrorsCoffeMachine.somethingElse}
            guard item.count > 0 else { throw ErrorsCoffeMachine.errorCount}
            guard item.price <= wallet else { throw ErrorsCoffeMachine.errorNoMoney}

        var newItem = item
        newItem.count -= 1
        inventory[product] = newItem
        print("\(product.name) готовится, ожидайте")

        return newItem.product
    }

    ///функция контроля остатков товара
    func checkProductCount(item: Products) {
        print("\(inventory[item]?.product.name ?? "") осталось \(inventory[item]?.count ?? 0) чашек")
    }

}

//экземпляр класса
let coffeeMachine = CoffeMachine()
coffeeMachine.wallet = 50

//проверка метода try/catch
do {
    let machineMethod =  try coffeeMachine.coffeeOrder(product: .hotChocolate)
    print("заберите свой \(machineMethod.name)")
} catch {
    print(error)
}

coffeeMachine.checkProductCount(item: .hotChocolate)
//MARK: - второй вариант ДЗ через if
print("----------")

enum ErrorAvia: Error {
    case errorMoney
    case errorCount
    case errorDirection
}


struct AviaCompany {
    var direction: String
    var price: Int
    var ticketsCount: Int
    var isDirectFly: Bool
}

final class TicketsSeller {

    var money: Int = 0

  private var directions: [String: AviaCompany] = [
        "Dubai": AviaCompany(direction: "Dubai", price: 54334, ticketsCount: 2, isDirectFly: true),
        "Mumbai": AviaCompany(direction: "Mumbai", price: 84323, ticketsCount: 1, isDirectFly: false),
        "London": AviaCompany(direction: "London", price: 10232, ticketsCount: 10,
                              isDirectFly: true),
        "LA": AviaCompany(direction: "LA", price: 104323, ticketsCount: 0, isDirectFly: false)
    ]

//покупка билета с возможной ошибкой через if
    func buyTicket(ticket to: String) throws {
        if to != directions[to]?.direction { throw ErrorAvia.errorDirection }
        if directions[to]?.price ?? 0 > money { throw ErrorAvia.errorMoney }
        if directions[to]?.ticketsCount ?? 0 < 1 { throw ErrorAvia.errorCount }
//изменение количества билетов и денег
        directions[to]?.ticketsCount -= 1
        money -= directions[to]?.price ?? 0

        print("Вы покупаете билет в \(to)")
}
///проверка количества билетов на остатке
    func checkTicketsCount(ticket to: String) {
           print("всего осталось \(directions[to]?.ticketsCount ?? 0) билетов")
    }
}

//создаем экземпляр класса
let ticketSeller = TicketsSeller()

ticketSeller.money = 100000

//обработчик ошибок
do {
    try ticketSeller.buyTicket(ticket: "Dubai")
    print("билет куплен успешно. у вас осталось \(ticketSeller.money) рублей")
} catch {
    print(error)
}
ticketSeller.checkTicketsCount(ticket: "Dubai")

