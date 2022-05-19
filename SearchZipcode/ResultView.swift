//
//  ResultView.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/15.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var tappedCopyButton: Bool = false
    @State private var showToast: Bool = false

    var zipcode: String
    var address1: String
    var address2: String
    var address3: String
    
    var body: some View {
        VStack {
            HeaderView(title1: "検索結果")
                .padding(.bottom)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    zipcodeLabel
                    result
                }
                .padding(.bottom,20)
                copyResultButton
                closeResultViewButton
            }
            Spacer()
        }
        .toast(isPresented: showToast) {
            ToastView(imageSystemName: "checkmark.circle", text: "コピーしました")
        }
    }
}

extension ResultView {
    private var zipcodeLabel: some View {
        Text(String.shape(zipcode: zipcode))
            .font(.title)
            .foregroundColor(Color(.systemGray))
            .fontWeight(.semibold)
            .padding(.bottom)
    }
    
    private var result: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach([address1,address2,address3],id: \.self){ address in
                    Text(address)
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                }
            }
        }
    }
    
    private var copyResultButton: some View {
        Button {
            UIPasteboard.general.string = setAddress()
            tappedCopyButton.toggle()
            withAnimation {
                showToast.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                tappedCopyButton.toggle()
                showToast.toggle()
            }
        } label: {
            HStack {
                Image(systemName: "doc.on.doc")
                Text("住所をコピー")
                    .fontWeight(.bold)
            }
        }
        .buttonStyle(.borderedProminent)
        .accessibility(identifier: "buttonCopyResult")
    }
    
    private var closeResultViewButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("この画面を閉じる")
                .fontWeight(.bold)
        })
        .buttonStyle(.bordered)
        .accessibility(identifier: "buttonCloseResultView")
    }
    
    func setAddress() -> String {
        self.address3 == "" ? "\(self.address1) \(self.address2)" : "\(self.address1) \(self.address2) \(self.address3)"
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
