import Foundation

public struct Value<T> {
    var name: String
    var type: T.Type
    
    public static func value(_ name: String, type: T.Type) -> Value {
        Value(name: name, type: type)
    }
}
