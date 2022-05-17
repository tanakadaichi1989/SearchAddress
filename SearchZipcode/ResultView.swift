//
//  ResultView.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var address1: String
    var address2: String
    var address3: String
    
    var body: some View {
        VStack {
            HeaderView(title1: "検索結果")
            Spacer()
            HStack {
                ForEach([address1,address2,address3],id: \.self){ address in
                    Text(address)
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.heavy)
                }
            }
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("閉じる")
                    .fontWeight(.black)
            })
            .buttonStyle(.bordered)
            Spacer()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(address1: "東京都", address2: "千代田区", address3: "千代田")
    }
}
