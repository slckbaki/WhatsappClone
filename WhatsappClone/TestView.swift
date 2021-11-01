//
//  TestView.swift
//  WhatsappClone
//
//  Created by Selcuk Baki on 25/10/21.
//

import SwiftUI

struct SecondNavView: View {
    let item: String

    var body: some View {
        ZStack {
            Color.red
            Text(item)
        }
        .navigationBarTitle("asdasdasd")
    }
}

struct FirstNavView: View {
    let listItems = ["One", "Two", "Three"]

    var body: some View {
        NavigationView {
            List(listItems, id: \.self) { item in
                NavigationLink(destination: SecondNavView(item: item)) {
                    Text(item).font(.headline)
                }
            }
            .navigationBarTitle("sdasdasada")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        SecondNavView(item: "Selcuk")
        FirstNavView()
    }
}
