//
//  ToastView.swift
//  SearchZipcode
//
//  Created by 田中大地 on 2022/05/19.
//

import SwiftUI

struct ToastView: View {
    let imageSystemName: String
    let text: String
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: imageSystemName)
                    .foregroundStyle(.white, .white)
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.leading,10)
                Text(text)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
            }
            .background(Color(UIColor.secondaryLabel))
            .clipShape(Capsule())
            .padding(.bottom)
        }
        .frame(width: 170)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .padding()
    }
}

struct ToastModifier: ViewModifier {
    
    var isPresented: Bool
    let toast: ToastView

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                toast
            }
        }
    }
}

extension View {
    func toast(isPresented: Bool, content: @escaping () -> ToastView) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, toast: content()))
    }
}



struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(imageSystemName: "checkmark.circle", text: "コピーしました")
    }
}
