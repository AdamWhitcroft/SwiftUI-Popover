//
//  PopoverCard.swift
//  SwiftUI-Popover
//
//  Created by Adam Whitcroft on 2022-09-27.
//

import SwiftUI

struct PopoverCard: View {
    /*
     Our binding to the `popoverVisisble` state
    */
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            /*
             This spacer makes sure our popover
             sits at the bottom of the screen.
            */
            Spacer()
            
            /*
             Here's the actual popover card.
            */
            VStack(spacing: 16) {
                Text("Here's the popover!")
                
                Button {
                    withAnimation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.9)) {
                        isPresented = false
                    }
                } label: {
                    Text("Close popover")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding()
        }
    }
}
