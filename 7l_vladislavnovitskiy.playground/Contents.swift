import Cocoa

enum SecuritySystem {
    case carOpen
    case carClose
}

enum EngineStatus {
    case turnOn
    case turnOff
}

enum EngineCondition {
    case excelent
    case good
    case bad
}

enum CarError: Error {
    case invalidSecretKey
    case engineError
    case lowFuel
    
    var description: String {
        switch self {
        case .invalidSecretKey:
            return "Ключ сигнализации не распознан"
        case .engineError:
            return "Проблема с мотором"
        case .lowFuel:
            return "Мало топлива"
        }
    }
}

final class Car {
    var securitySystem: SecuritySystem
    var engineStatus: EngineStatus
    var engineCondition: EngineCondition
    let carSecretKey: Int
    var fuelState: Int
    let fuelMax: Int
   
    
    init(securitySystem: SecuritySystem, engineStatus: EngineStatus, engineCondition: EngineCondition, carSecretKey: Int, fuelState: Int, fuelMax: Int) {
        guard fuelState <= fuelMax else {fatalError("Ошибка, создание авто с количеством топлива большим, чем вместимость бака недопустимо")}
        guard fuelState >= 0 else {fatalError("Ошибка, создание авто с количеством топлива меньшим, чем 0 литров недопустимо")}
        
        self.securitySystem = securitySystem
        self.engineStatus = engineStatus
        self.engineCondition = engineCondition
        self.fuelState = fuelState
        self.fuelMax = fuelMax
        self.carSecretKey = carSecretKey
        
    }
}

extension Car {
    func changeCarState(securityState: SecuritySystem, secretKey: Int) ->  CarError? {
        guard carSecretKey == secretKey else { return (.invalidSecretKey) }
        
        if securityState != securitySystem {
            securitySystem = securityState
            print("Сигнализация \(securitySystem == .carOpen ? "включена." : "выключена.")")
            return (nil)
        } else {
            print("Сигнализация уже в этом состоянии")
            return (nil)
        }
    }
    
    func changeEngineStatus(engineStatus: EngineStatus) -> CarError? {
        guard engineCondition == .excelent, engineCondition == .good else { return (.engineError) }
        guard fuelState > 0 else { return (.lowFuel) }
        
        if engineStatus != self.engineStatus {
            self.engineStatus = engineStatus
            print("Мотор \(engineStatus == .turnOn ? "включен." : "выключен.")")
            return (nil)
        } else {
            print("Мотор уже в этом состоянии")
            return (nil)
        }
    }
    
    func addFuel(litres: Int) {
        guard fuelState + litres <= fuelMax else { fatalError("Нельзя залить больше топлива, чем вмещает бак")}
        fuelState + litres
    }
    
}

let lexus = Car(securitySystem: .carClose, engineStatus: .turnOff, engineCondition: .good, carSecretKey: 12345678, fuelState: 0, fuelMax: 80)

lexus.changeCarState(securityState: .carOpen, secretKey: 12345)
lexus.changeCarState(securityState: .carOpen, secretKey: 12345678)
lexus.changeCarState(securityState: .carOpen, secretKey: 12345678)
lexus.changeEngineStatus(engineStatus: .turnOn)
lexus.addFuel(litres: 40)
lexus.changeEngineStatus(engineStatus: .turnOn)
lexus.changeEngineStatus(engineStatus: .turnOn)
