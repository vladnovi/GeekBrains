import UIKit
//MARK: - основные перечисления
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
//MARK: - доп.перечисления для спортивных машин
enum Spoiler {
    case open
    case close
}
//MARK: - доп.перечисления для грузовиков
enum Gear {
    case low
    case high
}
//MARK: - родительский класс
class Car {
    let model: String
    let productionYear: Int
    let cargoMax: Int
    var cargoNow: Int
    var cargoStatus: Cargo
    var engineStatus: Engine
    var windowsState: Windows
    
    init(model: String,
         productionYear: Int,
         cargoMax: Int,
         cargoNow: Int,
         cargoStatus: Cargo,
         engineStatus: Engine,
         windowsState: Windows) {
        
        self.model = model
        self.productionYear = productionYear
        self.cargoMax = cargoMax
        self.cargoNow = cargoNow
        self.cargoStatus = cargoStatus
        self.engineStatus = engineStatus
        self.windowsState = windowsState
    }
    
    func putCargo(cargoMax: Int, cargoNow: Int, cargoWeight: Int) {
            if cargoNow + cargoWeight <= cargoMax {
                self.cargoStatus = .put
                self.cargoNow += cargoWeight
            } else {
                print("Слишком большой багаж")
            }
        }
    
    func takeCargo(cargoNow: Int, cargoWeight: Int) {
            if cargoNow - cargoWeight >= 0 {
                self.cargoStatus = .take
                self.cargoNow -= cargoWeight
            } else {
                print("Вы не можете забрать больше, чем положили")
            }
        }
    
    func engineOn() {
            self.engineStatus = .on
        }
    
    func engineOff() {
            self.engineStatus = .off
        }
    
    func windowsOpen() {
            self.windowsState = .open
        }
    
    func windowsClose() {
            self.windowsState = .close
        }
}


//MARK: - подкласс грузовиков
final class TrunkCar: Car {
    var gearStatus: Gear
    
    init(model: String,
         productionYear: Int,
         cargoMax: Int,
         cargoNow: Int,
         cargoStatus: Cargo,
         engineStatus: Engine,
         windowsState: Windows,
         gearStatus: Gear) {
        
        self.gearStatus = gearStatus
        super.init(model: model,
                   productionYear: productionYear,
                   cargoMax: cargoMax,
                   cargoNow: cargoNow,
                   cargoStatus: cargoStatus,
                   engineStatus: engineStatus,
                   windowsState: windowsState)
    }
    
    func gearLow() {
        self.gearStatus = .low
    }
    
    func gearHigh() {
        self.gearStatus = .high
    }
    
    override func windowsOpen() {
        super.windowsOpen()
        print("У вас грузовик, открывается только водительское окно")
    }
}


//MARK: - подкласс спортивных авто
final class SportCar: Car {
    var spoilerStatus: Spoiler
    
    init(model: String,
         productionYear: Int,
         cargoMax: Int,
         cargoNow: Int,
         cargoStatus: Cargo,
         engineStatus: Engine,
         windowsState: Windows,
         spoilerStatus: Spoiler) {
        
        self.spoilerStatus = spoilerStatus
        super.init(model: model,
                   productionYear: productionYear,
                   cargoMax: cargoMax,
                   cargoNow: cargoNow,
                   cargoStatus: cargoStatus,
                   engineStatus: engineStatus,
                   windowsState: windowsState)
    }
    
    func spoilerOpen() {
        self.spoilerStatus = .open
    }
    
    func spoilerClose() {
        self.spoilerStatus = .close
    }
    
    override func engineOn() {
        super.engineOn()
        print("Полная мощность будет доступна после полного прогрева мотора")
    }
}

//MARK: - экземпляр грузовиков и действия с ним
let trunkOne = TrunkCar(model: "Kamaz",
                        productionYear: 2010,
                        cargoMax: 1500,
                        cargoNow: 100,
                        cargoStatus: .put,
                        engineStatus: .off,
                        windowsState: .close,
                        gearStatus: .high)

trunkOne.putCargo(cargoMax: trunkOne.cargoMax, cargoNow: trunkOne.cargoNow, cargoWeight: 1000)
trunkOne.gearLow()

//MARK: - экземпляр спортивных машин и действия с ним
let sportOne = SportCar(model: "Ferrari",
                        productionYear: 2020,
                        cargoMax: 50,
                        cargoNow: 20,
                        cargoStatus: .put,
                        engineStatus: .on,
                        windowsState: .open,
                        spoilerStatus: .open)

sportOne.takeCargo(cargoNow: sportOne.cargoNow, cargoWeight: 30) //Должна появиться ошибка, что нельзя забрать больше, чем лежит
sportOne.engineOn() //Должно появится предупреждение о полной мощности мотора
