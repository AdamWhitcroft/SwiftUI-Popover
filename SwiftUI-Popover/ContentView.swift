//
//  ContentView.swift
//  SwiftUI-Popover
//
//  Created by Adam Whitcroft on 2022-09-27.
//

import SwiftUI

struct ContentView: View {
    /*
     State for our popover
    */
    @State private var popoverVisisble = false
    
    var body: some View {
        NavigationView {
            Button {
                /*
                 I've slowed the animation down so you can see the effect.
                 Remove `.speed(0.9)` when you no longer want the slow version.
                 
                 `withAnimation` here is super important, which type of animation
                 you end up using is up to you. I wanted a nice bounce effect, so
                 went with `interpolatingSpring`.
                */
                withAnimation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.9)) {
                    popoverVisisble.toggle()
                }
            } label: {
                Text("Open overlay")
            }
            .navigationTitle("Overlay demo")
        }
        .overlay {
            ZStack {
                /*
                 Here's the fun stuff. I split the popover out into
                 2 individual components:
                 
                 PopoverBG()
                 
                 PopoverCard()
                 
                 The reason for this is it gives you finer grain control over how your
                 popover is presented. You could totally put these into a single view,
                 but I specifically wanted a background that faded in, and a card that
                 popped up.
                */
                if popoverVisisble {
                    /*
                     Here's the background (the area that dims the screen).
                     
                     See how we've applied a simple transition to the opacity?
                     The setting of a Z-Index here is also crucial for this to
                     work correctly.
                    */
                    PopoverBG(
                        isPresented: $popoverVisisble
                    )
                    .transition(.opacity)
                    .zIndex(0)
                    
                    /*
                     And here's the popover itself (the card).
                     
                     See how we're using a different transition here? Our
                     card will fade in and pop up from the bottom edge
                     of the screen.
                    */
                    PopoverCard(
                        isPresented: $popoverVisisble
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(1)
                }
            }
        }
    }
}
