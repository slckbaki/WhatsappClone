//
//  ChatView.swift
//  WhatsappClone
//
//  Created by Selcuk Baki on 27/10/21.
//

import SwiftUI
import Firebase


struct ChatView: View {
    
    let db = Firestore.firestore()
    
    var userToChat : UserModel
    
    @State var messageToSend = ""
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                TextField("Message here..", text: $messageToSend)
                    .padding()
                Button(action: {
                    sendMessagetoFirebase()
                }, label: {
                    Text("Send")
                        .frame(width: 80, height: 40)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
                })
            }
        }
    }
    
    func sendMessagetoFirebase(){
        var ref : DocumentReference? = nil
        
        let myChatDictionary : [String : Any] = ["chatUserFrom" : Auth.auth().currentUser?.uid, "chatUserTo" : userToChat.uidFromFirebase, "date" : generateDate(), "message" : self.messageToSend ]
        ref = self.db.collection("Chats").addDocument(data: myChatDictionary, completion: { error in
            if error != nil {
                
            } else {
                self.messageToSend = ""
            }
        })
        
    }
    
    func generateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM_dd_hh_mm_ss"
        return (formatter.string(from: Date()) as NSString) as String
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userToChat: UserModel(id: 0, name: "James", uidFromFirebase: "1234562"))
    }
}
