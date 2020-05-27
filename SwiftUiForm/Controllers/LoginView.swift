//
//  LoginView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 19.03.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI
import Firebase

//struct loginUser {
//    var userName: String
//
//
//
//    init (userName: String)
//
//    mutating func loginUserName (_ user_name: String) {
//        userName = user_name
//    }
//    func returnUserName () -> String {
//        return userName
//    }
//}



struct LoginView: View {
    
        @State var showingDetail = false
        @State var showingRegister = false
        @State var name: String = ""
        @State var pass: String = ""
        @State var errorLogin: String = " "
        @State var formOffset: CGFloat = 0
        @State private var showingAlert = false
        @State private var alertShown = false
        @State var uidUser: String = ""
        var regNewUser = logInUser(u: "test")
        @State var showingNew = false
        

    
        @ObservedObject var uidPub = PublicVar()
    
    enum AuthResult {
        case success
        case failure(Error)
    }
    
    
    func login(name: String?, pass: String?, completion: @escaping (AuthResult) -> Void){
        
        
//        Auth.auth().createUser(withEmail: self.name, password: self.pass) { (result, error) in
//            guard let _ = result else {
//                completion(.failure(error!))
//                return
//            }
//            let db = Firestore.firestore()
//            db.collection("users").addDocument(data: [
//                "firstName": self.firstName,
//                "email":self.mail,
//                "uid":result!.user.uid
//            ]) { (error) in
//                if error != nil {
//                    completion(.failure(AuthError.serverError))
//                }
//                print(result!.user.uid)
//                completion(.success)
//            }
//
//        }
        
        Auth.auth().signIn(withEmail: self.name, password: self.pass) { (result, Error) in
                     if Error != nil {
                        // Error discription
                             print("error")
                         self.errorLogin = "Логин или пароль некорректы"
                        self.alertShown = true
                     }else{
              
                         self.showingDetail.toggle()
                         self.errorLogin = " "
                         print(result!.user.uid)
                         self.uidUser = result!.user.uid
                         self.uidPub.uid = result!.user.uid
                         let db = Firestore.firestore()
                         db.collection("users").whereField("uid", isEqualTo: self.uidUser)
                             .getDocuments() { (querySnapshot, err) in
                                 if let err = err {
                                     print("Error getting documents: \(err)")
                                 } else {
                                     for document in querySnapshot!.documents {
                                         print("\(document.documentID) => \(document.data())")
                                         let data = document.data()
                                         self.uidPub.firstName = data["firstName"] as! String
                                     }
                                 }
                         }
                     }
         }
    }
    var body: some View {
        ZStack {
                Color(#colorLiteral(red: 0.1185091361, green: 0.1185343638, blue: 0.1819397807, alpha: 1)).edgesIgnoringSafeArea(.all)
        VStack{
            if self.formOffset == 0 {
                Image("logo").resizable().frame(width: 120, height: 63)
            }
            ZStack{
                VStack{
                VStack(alignment: .leading){
                    Text("E-mail")
                        .font(.callout)
                        .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                    HStack {
                      Image(systemName: "envelope").foregroundColor(.gray)
                      TextField("", text: $name, onEditingChanged: { flag in
                          withAnimation {
                                self.formOffset = flag ? -180 : 0
                                if self.name != "" {
                                    self.formOffset = -180
                                }
                          }
                        }
                      )
                        .disabled(false)
                      }
                    .padding()
                    .foregroundColor(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                }
            VStack(alignment: .leading){
                Text("Пароль")
                    .font(.callout)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                HStack {
                  Image(systemName: "lock.open").foregroundColor(.gray)
                    
                    if name == "" {
                        SecureField("", text: $pass).disabled(true)
                    } else {
                        SecureField("", text: $pass).disabled(false)
                    }
                  }
                .padding()
                .foregroundColor(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
                }.padding(EdgeInsets(top: 80, leading: 10, bottom: 60, trailing: 10))
            }
            VStack{
                
                NavigationLink(destination: DetailView(uidUser: self.$uidPub.uid, firstName: self.$uidPub.firstName, questions: questionData), isActive: self.$showingDetail){Text("")}
                
                Button(action: {
                    Auth.auth().signIn(withEmail: self.name, password: self.pass) { (result, Error) in
                                if Error != nil {
                                   // Error discription
                                        print("error")
                                    self.errorLogin = "Логин или пароль некорректы"
                                   self.alertShown = true
                                }else{
                         
                                    self.showingDetail.toggle()
                                    self.errorLogin = " "
                                    print(result!.user.uid)
                                    self.uidUser = result!.user.uid
                                    self.uidPub.uid = result!.user.uid
                                    let db = Firestore.firestore()
                                    db.collection("users").whereField("uid", isEqualTo: self.uidUser)
                                        .getDocuments() { (querySnapshot, err) in
                                            if let err = err {
                                                print("Error getting documents: \(err)")
                                            } else {
                                                for document in querySnapshot!.documents {
                                                    print("\(document.documentID) => \(document.data())")
                                                    let data = document.data()
                                                    self.uidPub.firstName = data["firstName"] as! String
                                                }
                                            }
                                    }
                                }
                    }
                })
                {
                    Text("Войти")
                                Image(systemName: "person.crop.circle.fill")
                }
                .alert(isPresented: $alertShown) { () -> Alert in
                    Alert(title: Text(errorLogin),  dismissButton: .default(Text("Ok")))
                }

//                    .sheet(isPresented: $showingDetail) {
//                        DetailView(uidUser: self.$uidPub.uid, firstName: self.$uidPub.firstName)
//                    }
                    .padding(EdgeInsets(top: 20, leading: 80, bottom: 20, trailing: 80))
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.1331678629, green: 0.6027008891, blue: 0.9523112178, alpha: 1)), Color.init(#colorLiteral(red: 0.1176140383, green: 0.8171627522, blue: 0.9488934875, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(3)
                
                NavigationLink(destination:
//                CustomFormRow(questions: questionData)
//                    TagView()
//                    DetailViewDiscNew(showingNew:  self.$showingNew)
                        CustomFormList()
                ){
                    Text("Переход")
                }

        
        }
        }.padding().offset(y: self.formOffset)
        }
                .navigationBarItems(
                trailing: Button("Регистрация",action: {self.showingRegister.toggle() })
                    .accentColor(Color.init(#colorLiteral(red: 0.03138631955, green: 0.5102779865, blue: 0.985108912, alpha: 1))))
                    .sheet(isPresented: $showingRegister) {
                        RegisterView(showingRegister: self.$showingRegister)

                }
        }

    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
