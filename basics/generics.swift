import UIKit

class A {
    
}

// У массива можно явно указать тип
let array = Array<Int>()
let array2 = [1, 2, 3, 4]
let arrayStr = ["one", "two", "three"]
let arrayCls = [A(), A(), A()]

//func paramValue(param: Int) -> String {
//    return "\(param)"
//}

//paramValue(param: 2) // "2"

//func paramValue(param: String) -> String {
//    return param
//}
//
//paramValue(param: "string")

// Универсальная функция
// <T> — любой тип
func paramValue<T>(param: T) -> String { //
    return "\(param)"
}

paramValue(param: 2)
paramValue(param: "string")
paramValue(param: true)

// Структура с двумя универсальными типами
// Можно подписать тип под конкретный протокол (в данном примере Comparable и Equatable)
struct HelpfullFunctions<T: Comparable, U: Equatable> {
    func paramValue(param: T, param2: U) -> String {
        return "\(param), \(param2)"
    }
}

let example = HelpfullFunctions<String, Int>()
example.paramValue(param: "String1", param2: 5)

// Функция, которая меняет местами значения двух входных параметров

var a = "b"
var b = "a"

// Используем сквозные параметры функций. При этом функция является generic
// Несмотря на то, что a и b структуры и не ссылочные типы, а типы значений, т. е. передаются копией, мы можем использовать inout-параметры
// inout говорит о том, что параметры, которые мы передаем, будут реально менять свои значения

func swappy<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

swap(&a, &b)
a // "a"
b // "b"
