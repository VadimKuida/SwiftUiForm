//
//  FeedBackData.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 20.05.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

//import Foundation
//
//
//
//struct Question: Hashable, Codable, Identifiable {
//    var id:Int
//    var imageNameId:Int
//    var name:String
//    var imageName:String
//    var question:String
//    var description:String
//}
//
//let questionData:[Question] = load("drinks.json")
//
//
//
//func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
//
//
//    let url = URL(string: "http://185.174.130.68:8081/ords/ancloud/app/feedback/")!
//    // 2.
//    URLSession.shared.dataTask(with: url) {(data, response, error) in
//        do {
//            if let backData = data {
//                // 3.
////                let decoder = JSONDecoder()
//                        let decodedData = try JSONDecoder().decode(T.self, from: backData)
//                DispatchQueue.main.async {
//                    print(decodedData)
//                    self.todos = decodedData
//                }
//               
//            } else {
//                print("No data")
//            }
//        } catch {
//            print("Error")
//        }
//    }.resume()
//
//}


//let session = URLSession(configuration: .default)
//let task = session.dataTask(with: url) { (data, response, error) in
//    if error != nil {
//        self.delegate?.didFailWithError(error: error!)
//        return
//    }


//guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//}
//
//do {
//    data = try Data(contentsOf: file)
//} catch {
//    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//}
//
//do {
//    let decoder = JSONDecoder()
//    return try decoder.decode(T.self, from: data)
//} catch {
//    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//}


//struct Back: Codable {
//    let id: Int
//    let imageName: String
//    let imageNameId: Int
//    let name: String
//    let question: String
//    let description: String
//}
//
//
//
//class FetchToDo: ObservableObject {
//  // 1.
//  @Published var todos = [Back]()
//     
//    init() {
//        let url = URL(string: "http://185.174.130.68:8081/ords/ancloud/app/feedback/")!
//        // 2.
//        URLSession.shared.dataTask(with: url) {(data, response, error) in
//            do {
//                if let backData = data {
//                    // 3.
//                    let decodedData = try JSONDecoder().decode([Back].self, from: backData)
//                    DispatchQueue.main.async {
//                        print(decodedData)
//                        self.todos = decodedData
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch {
//                print("Error")
//            }
//        }.resume()
//    }
//}

