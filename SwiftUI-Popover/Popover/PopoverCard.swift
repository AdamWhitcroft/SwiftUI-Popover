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
             
             FAIR WARNING
             
             This card will scale to the content
             inside it (yay), but it has NO concept of adapting
             if it's taller than your device.
             
             I built mine this way, because my popovers would
             always be pretty small, so I didn't have to worry
             about it.
             
             Your mileage may vary.
            */
            VStack(spacing: 16) {
                Text("Here's the popover!")
                
                Button {
                    /*
                     I've slowed the animation down so you can see the effect.
                     Remove `.speed(0.9)` when you no longer want the slow version.
                    */
                    withAnimation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.9)) {
                        isPresented = false
                    }
                } label: {
                    Text("Close")
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
