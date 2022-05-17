//
//  ResultView.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var zipcode: String
    var address1: String
    var address2: String
    var address3: String
    
    var body: some View {
        VStack {
            HeaderView(title1: "検索結果")
            Spacer()
            VStack(alignment: .leading) {
                Text(String.shape(zipcode: zipcode))
                    .font(.title)
                    .foregroundColor(Color(.systemGray))
                    .fontWeight(.semibold)
                    .padding(.bottom)
                HStack {
                    ForEach([address1,address2,address3],id: \.self){ address in
                        Text(address)
                            .font(.title)
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                    }
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
        ResultView(zipcode: "1000000",address1: "東京都", address2: "千代田区", address3: "千代田")
    }
}

extension String {
    static func shape(zipcode: String) -> String {
        let first3digits = String(zipcode.prefix(3))
        let last4digits = String(zipcode.suffix(4))
        return "〒\(first3digits)-\(last4digits)"
    }
}
