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
    @State var address1: String = ""
    @State var address2: String = ""
    @State var address3: String = ""
    @State var kana1: String = ""
    @State var kana2: String = ""
    @State var kana3: String = ""
    
    var body: some View {
        VStack {
            HeaderView(title1: "郵便番号検索",title2: "数字７桁で入力してください")
            
            Spacer()
                
            VStack{
                TextField("（例）9999999", text: $searchZipCode)
                Divider()
            }
            .padding(30)
            Button(action: {
                self.viewModel.fetch($searchZipCode.wrappedValue) { response in
                    self.address1 = response.results[0].address1
                    self.address2 = response.results[0].address2
                    self.address3 = response.results[0].address3
                    self.kana1 = response.results[0].kana1
                    self.kana2 = response.results[0].kana2
                    self.kana3 = response.results[0].kana3
                }
            }, label: {
                Text("検索実行")
            })
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Spacer()
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
