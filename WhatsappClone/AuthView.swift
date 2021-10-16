//
//  ContentView.swift
//  WhatsappClone
//
//  Created by Selcuk Baki on 16/10/21.
//

import SwiftUI
import Firebase

struct AuthView: View {
    
    @State var userEmail = ""
    @State var userPassword = ""
    @State var userName = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack{
                TextField("Username", text: $userName)
                    .padding()
                TextField("User E-mail", text: $userEmail)
                    .padding()
                TextField("Password", text: $userPassword)
                    .padding()

            }
            Spacer()

                
            
            
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Sign In")
                }).padding(40)
                .foregroundColor(.white)
                .background(Color.red)
                .clipShape(Circle())
                
                Spacer(minLength: 50)
                
                Button(action: {
                    
                }, label: {
                    Text("Sign Up")
                }).padding(40)
                .foregroundColor(.white)
                .background(Color.red)
                .clipShape(Circle())

            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
