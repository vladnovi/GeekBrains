import UIKit

//MARK: - Перечисления
enum WindowsState {
    case open
    case close
}

enum EngineState {
    case on
    case off
}

enum TransmissionState {
    case p
    case r
    case n
    case d
}

enum TunkState {
    case nothingToDo
    case fill
    case spent
}

enum CargoState {
    case nothingToDo
    case put
    case take
}

//MARK: - Протокол с общими свойствами
protocol CarProtocol {
    var brand: String { get set }
    var model: String { get set }
    var productionYear: Int { get set }
    var kilometersState: Double { get set }
    var tunkMax: Double { get set }
    var tunkNow: Double { get set }
    var cargoMax: Int { get set }
    var cargoNow: Int { get set }
    var color: UIColor { get set }
    var windowsState: WindowsState { get set }
    var engineState: EngineState { get set }
    var transmissionState: TransmissionState { get set }
    var tunkState: TunkState { get set }
    var cargoState: CargoState { get set }
}

//MARK: - Расширение протокола с методом действий
extension CarProtocol {
    mutating func windowState(action: WindowsState) {
        switch action {
        case .open:
            windowsState = .open
            print("Окно открыто")
        case .close:
            windowsState = .close
            print("Окно закрыто")
        }
    }
    
    mutating func engineOn() {
        if tunkNow > 0 && transmissionState == .p {
            engineState = .on
        } else {
            print("Нет топлива или коробка передач не в положении 'P'")
        }
    }
    
    mutating func engineOff() {
        if transmissionState == .p && windowsState == .close {
            engineState = .off
        } else {
            print("Не закрыты окна или коробка передач не в положении 'P'")
        }
    }
    
    mutating func transmissionState(action: TransmissionState) {
        switch action {
        case .p:
            transmissionState = .p
            print("Коробка в положении Parking")
        case .r:
            transmissionState = .r
            print("Коробка в положении Reverse")
        case .n:
            transmissionState = .n
            print("Коробка в положении Neutral")
        case .d:
            transmissionState = .d
            print("Коробка в положени Drive")
        }
    }
    
    mutating func putCargo(cargoWeight: Int) {
        if cargoNow + cargoWeight <= cargoMax {
            cargoState = .put
            cargoNow += cargoWeight
        } else {
            print("Слишком большой багаж")
        }
    }

    mutating func takeCargo(cargoWeight: Int) {
        if cargoNow - cargoWeight >= 0 {
            cargoState = .take
            cargoNow -= cargoWeight
        } else {
            print("Вы не можете забрать больше, чем положили")
        }
    }
    
    mutating func fillTank(oilLitres: Double) {
        if oilLitres + tunkNow <= tunkMax {
            tunkState = .fill
            tunkNow += oilLitres
        } else {
            print("Вы не можете заправить так много")
        }
    }
    
    mutating func getRide(kilometers: Double) {
        if engineState == .on && transmissionState == .d && tunkNow * 10 >= kilometers {
            tunkState = .spent
            kilometersState += kilometers
            tunkNow = tunkNow - (kilometers / 10)
            print("Машина проехала \(kilometers) километров и потратила \(kilometers / 10) литров")
        } else {
            print("Вы не можете поехать, проверьте если мотор запущен, коробка переведена в режим 'D', и в баке есть бензин, после попробуйте еще раз. Ваши показатели: Мотор - \(engineState) Коробка передач - \(transmissionState) Топливо в баке - \(tunkNow)")
        }
    }
}

//MARK: - Класс Грузовик наследованный от протокола
final class TunkCar: CarProtocol {
   
    var brand: String
    var model: String
    var productionYear: Int
    var kilometersState: Double
    var tunkMax: Double
    var tunkNow: Double
    var cargoMax: Int
    var cargoNow: Int
    var color: UIColor
    var windowsState: WindowsState
    var engineState: EngineState
    var transmissionState: TransmissionState
    var tunkState: TunkState
    var cargoState: CargoState
  
    init(brand: String,
         model: String,
         productionYear: Int,
         kilometersState: Double,
         tunkMax: Double,
         tunkNow: Double,
         cargoMax: Int,
         cargoNow: Int,
         color: UIColor,
         windowsState: WindowsState,
         engineState: EngineState,
         transmissionState: TransmissionState,
         tunkState: TunkState,
         cargoState: CargoState) {
        
        self.brand = brand
        self.model = model
        self.productionYear = productionYear
        self.kilometersState = kilometersState
        self.tunkMax = tunkMax
        self.tunkNow = tunkNow
        self.cargoMax = cargoMax
        self.cargoNow = cargoNow
        self.color = color
        self.windowsState = windowsState
        self.engineState = engineState
        self.transmissionState = transmissionState
        self.tunkState = tunkState
        self.cargoState = cargoState
    }
}

//MARK: - Расширение CustomStringConvertible для Грузовика
extension TunkCar: CustomStringConvertible {
    var description: String {
        return """
               Грузовик марки \(self.brand),
               модель \(self.model),
               выпущенный в \(self.productionYear) году,
               на одометре \(self.kilometersState) километров,
               с объемом бензобака \(self.tunkMax)литров, в котором на данный момент \(self.tunkNow) литров,
               имеющий объем багажника \(self.cargoMax) литров, сейчас заполненным на \(self.cargoNow) литров,
               покрашенный в цвет \(self.color).
               Состояние авто: окна \(self.windowsState), мотор \(self.engineState), коробка передач в положении \(self.transmissionState)
               """
    }
}

//MARK: - класс Спортивный Автомобиль наследованный от протокола
final class SportCar: CarProtocol {

    var brand: String
    var model: String
    var productionYear: Int
    var kilometersState: Double
    var tunkMax: Double
    var tunkNow: Double
    var cargoMax: Int
    var cargoNow: Int
    var color: UIColor
    var windowsState: WindowsState
    var engineState: EngineState
    var transmissionState: TransmissionState
    var tunkState: TunkState
    var cargoState: CargoState
  
    init(brand: String,
         model: String,
         productionYear: Int,
         kilometersState: Double,
         tunkMax: Double,
         tunkNow: Double,
         cargoMax: Int,
         cargoNow: Int,
         color: UIColor,
         windowsState: WindowsState,
         engineState: EngineState,
         transmissionState: TransmissionState,
         tunkState: TunkState,
         cargoState: CargoState) {
        
        self.brand = brand
        self.model = model
        self.productionYear = productionYear
        self.kilometersState = kilometersState
        self.tunkMax = tunkMax
        self.tunkNow = tunkNow
        self.cargoMax = cargoMax
        self.cargoNow = cargoNow
        self.color = color
        self.windowsState = windowsState
        self.engineState = engineState
        self.transmissionState = transmissionState
        self.tunkState = tunkState
        self.cargoState = cargoState
    }
}

//MARK: - Расширение CustomStringConvertible для Спортивного автомобиля
extension SportCar: CustomStringConvertible {
    var description: String {
        return """
               Спортивный автомобиль марки \(self.brand),
               модель \(self.model),
               выпущенный в \(self.productionYear) году,
               на одометре \(self.kilometersState) километров,
               с объемом бензобака \(self.tunkMax)литров, в котором на данный момент \(self.tunkNow) литров,
               имеющий объем багажника \(self.cargoMax) литров, сейчас заполненным на \(self.cargoNow) литров,
               покрашенный в цвет \(self.color).
               Состояние авто: окна \(self.windowsState), мотор \(self.engineState), коробка передач в положении \(self.transmissionState)
               """
    }
}

//MARK: - Экземпляры классов
var tunkCar1 = TunkCar(brand: "Kamaz",
                       model: "3540",
                       productionYear: 2005,
                       kilometersState: 34800,
                       tunkMax: 400,
                       tunkNow: 150,
                       cargoMax: 2000,
                       cargoNow: 0,
                       color: .orange,
                       windowsState: .close,
                       engineState: .off,
                       transmissionState: .p,
                       tunkState: .nothingToDo,
                       cargoState: .nothingToDo)

var sportCar1 = SportCar(brand: "Ferrari",
                         model: "Pista",
                         productionYear: 2020,
                         kilometersState: 200,
                         tunkMax: 60,
                         tunkNow: 30,
                         cargoMax: 50,
                         cargoNow: 20,
                         color: .red,
                         windowsState: .open,
                         engineState: .off,
                         transmissionState: .n,
                         tunkState: .nothingToDo,
                         cargoState: .nothingToDo)

//MARK: - Действия с экземпляром Грузовика
tunkCar1.description
tunkCar1.fillTank(oilLitres: 200)
tunkCar1.putCargo(cargoWeight: 500)
tunkCar1.engineOn()
tunkCar1.getRide(kilometers: 200)
tunkCar1.transmissionState(action: .d)
tunkCar1.getRide(kilometers: 200)
tunkCar1.description

