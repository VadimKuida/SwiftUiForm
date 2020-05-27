//
//  Data.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 16.04.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import Foundation



struct Question: Hashable, Codable, Identifiable {
    var id:Int
    var imageNameId:Int
    var name:String
    var imageName:String
    var question:String
    var description:String
}

let questionData:[Question] = load("drinks.json")



func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        print( try decoder.decode(T.self, from: data))
        return try decoder.decode(T.self, from: data)
    
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}





struct Todo: Hashable, Codable, Identifiable {
    let id: Int
    let imageName: String
    let imageNameId: Int
    let name: String
    let question: String
    let description: String
}



class FetchToDo: ObservableObject {
  // 1.
    

        
    
    @Published var todos = [Todo]()
     
            init() {
                let url = URL(string: "http://185.174.130.68:8081/ords/ancloud/app/feedback/")!
                // 2.
                URLSession.shared.dataTask(with: url) {(data, response, error) in
                    do {
                        if let todoData = data {
                            // 3.
                            let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                            DispatchQueue.main.async {
                                self.todos = decodedData
                                print(decodedData)
                            }
                        } else {
                            print("No data")
                        }
                    } catch {
                        print("Error")
                    }
                }.resume()
            }
        
}

