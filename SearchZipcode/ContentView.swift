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
    
    @State private var showResultView = false
    @State private var showAlert = false
    @State private var showProgressView = false
    
    var body: some View {
        ZStack {
            if showProgressView { ProgressView() }
            
            VStack {
                HeaderView(title1: "郵便番号から住所を検索",title2: "数字７桁で入力してください")
                Spacer()
                VStack{
                    TextField("（例）9999999", text: $searchZipCode)
                    Divider()
                }
                .padding(30)
                Button {
                    self.showProgressView.toggle()
                    self.setResultData()
                } label: {
                    Text("検索実行")
                }
                .buttonStyle(.borderedProminent)
                .fullScreenCover(isPresented: $showResultView) {
                    ResultView(address1: address1, address2: address2, address3: address3)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("エラー"), message: Text("住所を取得できませんでした"))
                }
                .disabled(!canSarchButtonPush())
                Spacer()
                Spacer()
            }
        }
    }
    
    private func canSarchButtonPush() -> Bool {
        return isTextFieldEntered() && isLengthSeven()
    }
    
    private func isTextFieldEntered() -> Bool {
        return $searchZipCode.wrappedValue.description != ""
    }
    
    private func isLengthSeven() -> Bool {
        return $searchZipCode.wrappedValue.count == 7
    }
    
    private func setResultData() {
        self.viewModel.fetch($searchZipCode.wrappedValue) { response,error in
            
            if let error = error {
                self.showProgressView.toggle()
                self.showAlert.toggle()
            }
            
            guard let response = response else { return }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.address1 = response.results[0].address1
                self.address2 = response.results[0].address2
                self.address3 = response.results[0].address3
                self.kana1 = response.results[0].kana1
                self.kana2 = response.results[0].kana2
                self.kana3 = response.results[0].kana3

                self.showProgressView.toggle()
                self.showResultView.toggle()
            }
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
