import UIKit
//MARK: - Перечисления
enum Engine {
    case on
    case off
}

enum Windows {
    case open
    case close
}

enum Cargo {
    case put
    case take
}

//MARK: - Структура
struct SportCar {
    let model: String
    let productionYear: Int
    let cargoMax: Int
    var cargoNow: Int
    var cargoStatus: Cargo
    var engineStatus: Engine
    var windowsState: Windows
    
    //MARK: - Методы меняющие свойства в структуре
    mutating func putCargo(cargoMax: Int, cargoNow: Int, cargoWeight: Int) {
        if cargoNow + cargoWeight <= cargoMax {
            self.cargoStatus = .put
            self.cargoNow += cargoWeight
        }else{
            print("Слишком большой багаж")
        }
    }
    mutating func takeCargo(cargoNow: Int, cargoWeight: Int) {
        if cargoNow - cargoWeight >= 0 {
            self.cargoStatus = .take
            self.cargoNow -= cargoWeight
        }else{
            print("Вы не можете забрать больше, чем положили")
        }
    }
    mutating func engineOn() {
        self.engineStatus = .on
    }
    mutating func engineOff() {
        self.engineStatus = .off
    }
    mutating func windowsOpen() {
        self.windowsState = .open
    }
    mutating func windowsClose() {
        self.windowsState = .close
    }
}

//MARK: - Экземпляр и применение различных действий
var carOne = SportCar(model: "Lexus", productionYear: 2020, cargoMax: 250, cargoNow: 0, cargoStatus: .put, engineStatus: .on, windowsState: .close)
carOne.putCargo(cargoMax: carOne.cargoMax, cargoNow: carOne.cargoNow, cargoWeight: 200)
carOne.putCargo(cargoMax: carOne.cargoMax, cargoNow: carOne.cargoNow, cargoWeight: 200)

//MARK: - Вывожу в консоль
print(carOne)
