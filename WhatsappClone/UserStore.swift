//
//  UserStore.swift
//  WhatsappClone
//
//  Created by Selcuk Baki on 25/10/21.
//

import Foundation
import SwiftUI
import Firebase
import Combine


class UserStore : ObservableObject {
    
    let db = Firestore.firestore()
    var userArray : [UserModel] = []
    
    var objectWillChange = PassthroughSubject<Array<Any>, Never>()
    
    init() {
        db.collection("Users").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)

            } else {
                self.userArray.removeAll(keepingCapacity: false)
                for document in snapshot!.documents {
                    if let userUIDfromFirebase = document.get("userID") as? String {
                        if let userName = document.get("username") as? String {
                            let currentIndex = self.userArray.last?.id
                            
                            let createdUser = UserModel(id: (currentIndex ?? -1) + 1, name: userName, uidFromFirebase: userUIDfromFirebase)
                            self.userArray.append(createdUser)
                        }
                    }
                }
                self.objectWillChange.send(self.userArray)
            }
        }
    }
}


