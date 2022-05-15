//
//  ResultView.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import SwiftUI

struct ResultView: View {
    let address1: String
    let address2: String
    let address3: String
    
    var body: some View {
        VStack {
            HeaderView(title1: "検索結果")
            Spacer()
            HStack {
                ForEach([address1,address2,address3],id: \.self){ address in
                    Text(address)
                        .font(.title)
                        .foregroundColor(.secondary)
                        .fontWeight(.bold)
                }
            }
            Spacer()
            Button(action: {
                print("⭐️ DEBUG: Result View Button was pushed")
            }, label: {
                Text("閉じる")
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
