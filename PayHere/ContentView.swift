//
//  ContentView.swift
//  PayHere
//
//  Created by Dinuka Shehan on 2022-02-11.
//

import SwiftUI
import payHereSDK

struct ContentView: View {
    let anotherControllerView = ViewControllerWrapper(controller: UIViewController.init())
    var body: some View {
        ZStack{
            anotherControllerView
            Button(action: {
                self.anotherControllerView.OneTimePaymentRequest()
            }, label: {
                Text("Tap me")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8.0)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewControllerWrapper : UIViewControllerRepresentable, PHViewControllerDelegate {
    let controller: UIViewController?
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        guard let controller = controller else {
            return UIViewController()
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func OneTimePaymentRequest() {
        let initRequest = PHInitialRequest(
            merchantID: "1219797",        // Your Merchant ID
            notifyURL: "",
            firstName: "Saman",
            lastName: "Perera",
            email: "samanp@gmail.com",
            phone: "+9477123456",
            address: "No.1, Galle Road",
            city: "Colombo",
            country: "Sri Lanka",
            orderID: "001",             // Unique ID for your payment transaction
            itemsDescription: "Greeting Card", // Item title or Order/Invoice number
            itemsMap: [],
            currency: .LKR,             // Currency Enum
            amount: 50.00,              // Amount which the customer should pay
            deliveryAddress: "",
            deliveryCity: "",
            deliveryCountry: "",
            custom1: "custom 01",
            custom2: "custom 02")
        
        PHPrecentController.precent(from: controller!, withInitRequest: initRequest, delegate: self)
    }
    
    func onErrorReceived(error: Error) {
        
    }
    
    func onResponseReceived(response: PHResponse<Any>?) {
        if(response?.isSuccess())!{
            guard (response?.getData() as? StatusResponse) != nil else{
                return
            }
            print("Payement Success!")
            //Payment Success
        }else{
            response?.getMessage()
        }
    }
}
