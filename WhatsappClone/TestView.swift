//
//  TestView.swift
//  WhatsappClone
//
//  Created by Selcuk Baki on 25/10/21.
//

import SwiftUI

struct TestView: View {
    
    @State var x = true
    
    
    var body: some View {
        
        
        
       if x  {
        VStack{
            Text("Hello SwiftUI!")
            Button(action: {
                x = false
            }, label: {
                Text("Change the text")
            })

        }
       } else {
        
        VStack{
            Text("Hello World")
            Button(action: {
                x = true
            }, label: {
                Text("Change the text")
            })
        }


       }
        
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
