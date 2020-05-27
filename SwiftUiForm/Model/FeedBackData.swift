//
//  FeedBackData.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 20.05.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import Foundation
//
//
//
//struct QuestionJson:  Hashable, Codable, Identifiable {
//    var id:Int
//    var imageNameId:Int
//    var name:String
//    var imageName:String
//    var question:String
//    var description:String
//}
//
////    var jsonData:[QuestionJson] = jsonParse()
//
//    public var yourVariable = [1,2]
//
//
//func jsonParse() {
//    let urlString =  "http://185.174.130.68:8081/ords/ancloud/app/feedback/"
//    let url = URL(string: urlString)
////    guard  url != nil else{
////        return
////    }
//    let session = URLSession.shared
//    let dataTask = session.dataTask(with: url!) { (data, response, error) in
//        if error == nil && data != nil {
//            if parseJSON(data!) != nil {
//               let yourVariable = self.parseJSON(data!)
//            }
//        }
//    }
//    dataTask.resume()
//    print(dataTask.self)
//  return yourVariable
//}
//
//
//
//func parseJSON(_ jsonData: Data) -> QuestionJson? {
//    let decoder = JSONDecoder()
//    do {
//        let decodedData = try decoder.decode(QuestionJson.self, from: jsonData)
//        return decodedData
//    } catch {
//        print("Error in json")
//        return nil
//    }
//}







//let questionDataNew:[QuestionJson] = jsonParse()




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


