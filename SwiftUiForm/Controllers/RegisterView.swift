//
//  RegisterView.swift
//  SwiftUiForm
//
//  Created by Вадим Куйда on 22.03.2020.
//  Copyright © 2020 Вадим Куйда. All rights reserved.
//

import SwiftUI
import Firebase





struct RegisterView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var mail: String = ""
    @State var pass: String = ""
    @State private var showingAlert = false
    @State var errorRegister: String = " "
    @Binding var showingRegister: Bool
    @State private var alertShown = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>




    
    enum AuthResult {
        case success
        case failure(Error)
    }
    
    


    
    func register(name: String?, pass: String?, completion: @escaping (AuthResult) -> Void){
        
        guard Validators.isFilled(firstName: firstName,
                                  mail: mail,
                                  pass: pass) else {
                                    completion(.failure(AuthError.notFilled))
                                    return
        }
        guard Validators.isSimpleEmail(mail) else {
                                    completion(.failure(AuthError.invalidEmail))
                                    return
        }
        
        Auth.auth().createUser(withEmail: self.mail, password: self.pass) { (result, error) in
            guard let _ = result else {
                completion(.failure(error!))
                return
            }
            let db = Firestore.firestore()
            db.collection("users").addDocument(data: [
                "firstName": self.firstName,
                "email":self.mail,
                "uid":result!.user.uid
            ]) { (error) in
                if error != nil {
                    completion(.failure(AuthError.serverError))
                }
                print(result!.user.uid)
                completion(.success)
            }
            
        }
    }
    
    var body: some View {
         NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.1185091361, green: 0.1185343638, blue: 0.1819397807, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack{
                    VStack(alignment: .leading){
                        Text("E-mail")
                            .font(.callout)
                            .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                        HStack {
                          Image(systemName: "envelope").foregroundColor(.gray)
                          TextField("", text: $mail)
                          }
                        .padding()
                        .foregroundColor(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }
                    VStack(alignment: .leading){
                        Text("Имя")
                            .font(.callout)
                            .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                        HStack {
                          Image(systemName: "person").foregroundColor(.gray)
                            TextField("", text: $firstName)
                            
                          }
                        .padding()
                        .foregroundColor(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    
                    } //VStack
                    VStack(alignment: .leading){
                        Text("Пароль")
                            .font(.callout)
                            .foregroundColor(Color.init(#colorLiteral(red: 0.4676678777, green: 0.8382721543, blue: 0.9352027774, alpha: 1)))
                        HStack {
                          Image(systemName: "lock").foregroundColor(.gray)
                         SecureField("", text: $pass)
                            if self.mail != "" && self.firstName != "" && self.pass != "" {
                                Button(action: {
                                    self.register(name: self.mail, pass: self.pass) { (result) in
                                        switch result {
                                            
                                        case .success:
                                             
                                             self.errorRegister = "Успешная регистрация"
//                                             self.alertShown.toggle()
                                             self.presentationMode.wrappedValue.dismiss()
//                                             self.showingRegister.toggle()
                                        case .failure(let error):
                                            
                                             self.errorRegister = error.localizedDescription
                                              Database.database().reference().child("News").setValue(88)
                                                self.alertShown.toggle()
                                        }
                                    }
                                    })
                                    { Image(systemName: "chevron.right.circle").foregroundColor(.green)}
                                .alert(isPresented: $alertShown) { () -> Alert in
                                    Alert(title: Text("Ошибка"), message: Text(errorRegister),   dismissButton: .default(Text("Ok")))
                                }
                            }
                          }
                        .padding()
                        .foregroundColor(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))

                    } //VStack
                    
//                    Text(errorRegister)
//                            .font(.callout)
//                            .foregroundColor(Color.init(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
//                        .padding()
                }.padding().offset(y: -200) //ZStack
                
            }

        }
        
    }
}


//#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(showingRegister: .constant(true))
    }
}
//#endif


