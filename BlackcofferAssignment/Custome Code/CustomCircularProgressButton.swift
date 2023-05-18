//
//  CustomCircularProgressButton.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 22/05/23.
//

import SwiftUI

struct CustomCircularProgressButton: View {
//     @State private var showPopup:Bool = false
    
//    @State private var selectedPrice: Double = 50
    
    @State private var sliderValue: Double = 50
        @State private var isPopoverVisible:Bool = false
    @State private var circleOffset: CGFloat = 0

    var body: some View {
       
        
        
        
        VStack {
                   GeometryReader { geometry in
                       ZStack(alignment: .leading) {
                           Rectangle()
                               .frame(height: 4)
                               .foregroundColor(.gray)
                           
                           Circle()
                               .foregroundColor(.blue)
                               .frame(width: 20, height: 20)
                               .offset(x: circleOffset)
                               .gesture(DragGesture(minimumDistance: 0)
                                           .onChanged { value in
                                               let width = geometry.size.width
                                               let percentage = value.location.x / width
                                               sliderValue = Double(percentage * 100)
                                               circleOffset = value.location.x
                                               isPopoverVisible = true
                                           }
                                           .onEnded { _ in
                                               isPopoverVisible = false
                                           })
                       }
                   }
                   
                   Text("Slider Value: \(Int(sliderValue))")
                       .padding()
//                       .popover(isPresented: $isPopoverVisible, arrowEdge: .bottom)
            
                       .iOSPopover(isPresented: $isPopoverVisible, arrowDriection: .up){
                           Text("\(Int(sliderValue))")
                               .font(.headline)
                               .padding()
                       }
               }
            
 
                 
    }
    
    
}


//VStack {
//            Text("Selected Price: $\(Int(selectedPrice))")
//                .padding()
//
//            Slider(value: $selectedPrice, in: 0...100, step: 1)
//                .padding(.horizontal)
//                .onChange(of: selectedPrice) { _ in
//                    isPopoverVisible = true
//                }
//        }
// .iOSPopover(isPresented: $isPopoverVisible, arrowDriection: .up){
//            VStack {
//                Text("Price: $\(Int(selectedPrice))")
//
//                    .padding()
//            }
//        }



struct CustomCircularProgressButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircularProgressButton()
    }
}

//popup
extension View{
    func iOSPopover<Content : View>(isPresented: Binding<Bool>, arrowDriection:UIPopoverArrowDirection, @ViewBuilder content: @escaping ()-> Content)-> some View {
        self
            .background{
                PopoverController(isPresented: isPresented, arrowDirection: arrowDriection, content: content())
            }
    }
}
//popup helper
struct PopoverController<Content:View>: UIViewControllerRepresentable{
    @Binding var isPresented:Bool
    var arrowDirection: UIPopoverArrowDirection
    var content: Content

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if isPresented{
            let controller = UIHostingController(rootView: content)
            controller.view.backgroundColor = .clear
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.permittedArrowDirections = arrowDirection
            
            controller.presentationController?.delegate = context.coordinator
             
            controller.popoverPresentationController?.sourceView = uiViewController.view
            uiViewController.present(controller, animated:true)
            
        }
    }
    
    class Coordinator:NSObject, UIPopoverPresentationControllerDelegate{
        var parent:PopoverController
        init(parent: PopoverController) {
            self.parent = parent
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
        }
    }
}
