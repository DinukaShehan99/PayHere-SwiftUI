//
//  SwiftUIToast.swift
//  PayHere
//
//  Created by Dinuka Shehan on 2022-02-11.
//

import SwiftUI
import ToastUI

struct SwiftUIToast: View {
    @State private var presentingToast: Bool = false
    var body: some View {
        Button {
          presentingToast = true
        } label: {
          Text("Tap me")
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8.0)
        }
        .toast(isPresented: $presentingToast, dismissAfter: 2.0) {
          print("Toast dismissed")
        } content: {
          ToastView("Please Loggin with \nUser Account")
            .toastViewStyle(WarningToastViewStyle())
        }
    }
}

struct SwiftUIToast_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToast()
    }
}
