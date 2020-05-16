//
//  SwiftUIContainer.swift
//  KeyboardEdges
//
//  Created by Франчук Андрей on 16.05.2020.
//  Copyright © 2020 Франчук Андрей. All rights reserved.
//

import SwiftUI

struct SwiftUIContainer: View{
    @State var dragLocation: CGPoint = .zero
    var body: some View{
        GeometryReader{geometry in
            VStack{
                Circle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                    .position(self.dragLocation)
                    .gesture(DragGesture().onChanged(){value in
                        self.dragLocation = value.location
                    }
                )
            }
            .background(Color.green)
            .onAppear(){
                self.dragLocation = CGPoint(x: geometry.size.width / 2, y: 0)
                print("swiftUI view did appear and its size is \(geometry.size.debugDescription)")
            }
        }
    }
}

class MyController<Content: View>: UIHostingController<Content>{
    open override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge{
        print("request edges for conteiner")
        return [.bottom]
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("set edges for conteiner")
        setNeedsUpdateOfScreenEdgesDeferringSystemGestures() // better to call it here
    }
}


struct SwiftUIContainer_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIContainer()
    }
}
