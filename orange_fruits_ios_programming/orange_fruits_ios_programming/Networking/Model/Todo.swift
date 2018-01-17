//
//  Todo.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 12/28/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import Foundation

enum BackendError : Error {
    case urlError(reason : String)
    case objectSerialization(reason: String)
}

struct Todo: Codable {
    
    var title: String?
    var serverId: String?
    var id: Int?
    var userId: Int?
    var completed: Int
    
    init?(json : [String: AnyObject]) {
        guard let title = json["title"] as? String,
            let id = json["id"] as? Int,
            let userId = json["userId"] as? Int,
            let completed = json["completed"] as? Int else {
                return nil
        }
        self.title = title
        self.id = id
        self.userId = userId
        self.completed = completed
    }
    
    static func endPointForID(_ id: Int) -> String{
        return "https://jsonplaceholder.typicode.com/todos/\(id)"
    }
    
   static func todoByID(_ id: Int, completionHandler: @escaping (Todo?, Error?) -> Void){
        //Set up URLRequest with URL
        let endpoint = Todo.endPointForID(id)
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        let urlRequest  = URLRequest(url: url)
        //Make request
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            //handle response to request
            //check for error
            guard error == nil else {
               completionHandler(nil, error)
                return
            }
            //make sure we got data in the response
            guard let responseDate = data else {
                print("Error: did not receive data")
                let error = BackendError.urlError(reason: "No data in response")
                completionHandler(nil, error)
                return
            }
            
            //parse the result as JSON
            //then create a Todo from the JSON
            do{
                if let todoJSON = try JSONSerialization.jsonObject(with: responseDate, options: []) as? [String: AnyObject],
                    let todo = Todo(json: todoJSON){
                    //created a Todo JSON
                    completionHandler(todo, nil)
                }else{
                    //couldn't create a todo object from the JSON
                    let error = BackendError.objectSerialization(reason: "Couldn't create a todo object from the JSON")
                    completionHandler(nil, error)
                }
            }catch{
                completionHandler(nil, error)
                return
            }
        })
        task.resume()
    }
    
    static func endPointForTodos() -> String{
        return "https://jsonplaceholder.typicode.com/todos/"
    }
    
    static func allTodos(completionHandler: @escaping ([Todo]?, Error?) -> Void){
        let endpoint = Todo.endPointForTodos()
        guard let url = URL(string: endpoint) else {
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            guard let responseData = data else {
            completionHandler(nil, error)
                return
            }
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            do{
                let todos = try decoder.decode([Todo].self, from: responseData)
                completionHandler(todos, nil)
            }catch{
                completionHandler(nil, error)
            }
        })
        task.resume()
    }
    
   static func getAllTodos() {
        Todo.allTodos{
            (todos, error) in
            if let error = error {
                return
            }
            guard let totos = todos else {
                return
            }
            
            print(todos?.count)
        }
    }
    
    func toJSON() -> [String: Any] {
        var json = [String: Any]()
        json["title"] = title
        json["userId"] = userId
        json["completed"] = completed
        if let id = id {
            json["id"] = id
        }
        return json
    }
    
    func save(completionHandler : @escaping (Error?) -> Void) {
        let todoEnpoint = Todo.endPointForTodos()
        guard let todoUrl = URL(string: todoEnpoint) else {
            let error = BackendError.urlError(reason: "Could not create URL")
            completionHandler(error)
            return
        }
        
        var todosUrlRequest = URLRequest(url: todoUrl)
        todosUrlRequest.httpMethod = "POST"
        
        let newTodoAsJSON = self.toJSON()
        
        do {
            let jsonTodo = try JSONSerialization.data(withJSONObject: newTodoAsJSON, options: [])
            todosUrlRequest.httpBody = jsonTodo
        } catch  {
            let error = BackendError.objectSerialization(reason: "Could not create JSON from data")
            completionHandler(error)
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: todosUrlRequest, completionHandler: {
            (data, response, error) in
            guard error == nil else{
                completionHandler(error)
                return
            }
            completionHandler(nil)
        })
        task.resume()
    }
}

struct Address : Codable {
    let city : String
    let zipcode: String
}

struct User: Codable {
    let id: Int?
    let name: String
    let email: String
    let address: Address
    
    static func endpointForID(_ id: Int) -> String {
        return "https://jsonplaceholder.typicode.com/users/\(id)"
    }
    
   static func userByID(_ id: Int, completionHandler: @escaping (User? , Error?) -> Void) {
        let endpoint = User.endpointForID(id)
        guard let url = URL(string: endpoint)else{
            let error = BackendError.urlError(reason: "Could not create URL")
            completionHandler(nil, error)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            guard let responseData = data else{
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            
            do{
                let user = try decoder.decode(User.self, from: responseData)
                completionHandler(user, nil)
            }catch{
                completionHandler(nil, error)
            }
        })
        task.resume()
    }
    
   static func getUser(_ idNumber: Int) {
        User.userByID(idNumber, completionHandler: {
            (user, error) in
            if let error = error {
                print(error)
                return
            }
            guard let user = user else{
                return
            }
            print(user)
        })
    }
}

enum CodingKeys : String, CodingKey{
    case title
    case serverId = "id"
    case userId
    case completed
}
