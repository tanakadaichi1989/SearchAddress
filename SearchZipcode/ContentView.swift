//
//  ContentView.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ZipcodeViewModel
    @State var searchZipCode: String = ""
    
    var body: some View {
        VStack {
            Text("郵便番号検索")
                .padding()
            VStack{
                TextField("郵便番号", text: $searchZipCode)
                Divider()
            }
            .padding(30)
            Button(action: {
                print("DEBUG: button pushed")
                self.viewModel.fetch($searchZipCode.wrappedValue) { result in
                    print(result)
                }
            }, label: {
                Text("検索実行")
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
