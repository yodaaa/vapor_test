import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    //parameter
    router.get("users", Int.parameter) { req -> String in
        let id = try req.parameters.next(Int.self)
        return "requested id #\(id)"
    }
    
    //parameters
    router.get("id", Int.parameter, "name", String.parameter) { req -> String in
        let id = try req.parameters.next(Int.self)
        let name = try req.parameters.next(String.self)
        return "requested id -> \(id), name -> \(name)"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
