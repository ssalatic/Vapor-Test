import Vapor

final class User {
    var name: String
    var lastname: String
    
    init(name: String, lastname: String) {
        self.name = name
        self.lastname = lastname
    }
}

/**
	This allows instances of User to be 
	passed into Json arrays and dictionaries
	as if it were a native JSON type.
*/
extension User: JSONRepresentable {
    func makeJson() -> JSON {
        return JSON([
            "name": "\(name)",
            "lastname": "\(lastname)"
        ])
    }
}

/**
	If a data structure is StringInitializable, 
	it's Type can be passed into type-safe routing handlers.
*/
extension User: StringInitializable {
    convenience init?(from string: String) throws {
        self.init(name: string, lastname: string)
    }
}