//
//  HeaderView.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import SwiftUI

struct HeaderView: View {
    var title1: String
    var title2: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text(title1)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            if title2 != "" {
                Text(title2)
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBlue))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title1: "郵便番号から住所を検索", title2: "数字７桁で入力してください")
    }
}
