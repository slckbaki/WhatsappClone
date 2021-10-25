//
//  ContentView.swift
//  WhatsappClone
//
//  Created by Selcuk Baki on 16/10/21.
//

import SwiftUI
import Firebase

struct AuthView: View {
    
    let db = Firestore.firestore()
    
    @ObservedObject var userStore = UserStore()
    
    @State var userEmail = ""
    @State var userPassword = ""
    @State var userName = ""
    @State var showAuthView = true
    
    var body: some View {
        
        NavigationView{
            if showAuthView {
                VStack {
                    Image("tourvidi").resizable().frame(width: 250, height: 250)
                    VStack{
                        TextField("Username" , text: $userName)
                            .padding()
                        TextField("User E-mail", text: $userEmail)
                            .padding()
                        TextField("Password", text: $userPassword)
                            .padding()
                    }
                    Spacer()
                    HStack{
                        Button(action: {
                            
                            Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
                                if error != nil {
                                    print(error?.localizedDescription)
                                    
                                } else {
                                    showAuthView = false
                                }
                            }
                            
                        }, label: {
                            Text("Sign In")
                        }).padding(40)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Circle())
                        
                        Spacer(minLength: 50)
                        
                        Button(action: {
                            Auth.auth().createUser(withEmail: userEmail, password: userPassword) { success, error in
                                if error != nil {
                                    print(error?.localizedDescription ?? "HATA")
                                } else {
                                    //User Created
                                    //Database
                                    var ref : DocumentReference? = nil
                                    let myUserDictionary : [String : Any] = ["username" : userName, "useremail" : userEmail, "userID" : success?.user.uid]
                                    
                                    ref = self.db.collection("Users").addDocument(data: myUserDictionary, completion: { error in
                                        if error != nil {
                                            
                                        }
                                    })
                                    showAuthView = false
                                }
                            }
                            
                        }, label: {
                            Text("Sign Up")
                        }).padding(40)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Circle())
                    }
                    Spacer()
                }
                //AUTHVIEW ENDS
            } else {
                
                // User View
                NavigationView {
                    List(userStore.userArray) { user in
                        HStack {
                            Text(user.name)
                            
                        }
                    }
                }
            }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthView(showAuthView : true )
            AuthView(showAuthView : false )
        }
    }
}
