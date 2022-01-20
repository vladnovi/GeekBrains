import Cocoa
//MARK: - Это простой вариант решения 1 пункта задания
struct QueueEasy <T> {
    
    func queue<T>( array: inout [T], newT: T) -> [T]{
        array.removeFirst()
        array.append(newT)
        print(array)
        return array
    }
    
}

var strings = ["Jony", "Max", "Jack"]
var checkStrings = QueueEasy<Any>()
checkStrings.queue(array: &strings, newT: "James")
checkStrings.queue(array: &strings, newT: "Nikolas")

var ints = [20,30,40]
var checkInts = QueueEasy<Any>()
checkInts.queue(array: &ints, newT: 10)
checkInts.queue(array: &ints, newT: 5)

//MARK: - Это более сложный вариант решения 1 пункта задания + 2 пункт
protocol WeightProtocol {
    var weight: Int {get set}
}

struct Queue<T: WeightProtocol> {
    var cargo = [T]()
    
    mutating func add(newElement: T) {
        cargo.append(newElement)
    }
    
    mutating func remove() {
        cargo.removeFirst()
    }
    
    func printingWeight() {
        var array = [Int]()
        for element in cargo {
            array.append(element.weight)
        }
        print("Общий вес равен \(array.reduce(0, +)) кг")
    }
}

class PlaneCargo: WeightProtocol {
    var weight: Int
    init(weight: Int){
        self.weight = weight
    }
}

var baggage = Queue<PlaneCargo>()

baggage.add(newElement: PlaneCargo(weight: 20))
baggage.add(newElement: PlaneCargo(weight: 230))
baggage.printingWeight()



