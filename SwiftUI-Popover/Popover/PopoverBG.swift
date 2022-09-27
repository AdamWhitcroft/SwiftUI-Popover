//
//  PopoverBG.swift
//  SwiftUI-Popover
//
//  Created by Adam Whitcroft on 2022-09-27.
//

import SwiftUI

struct PopoverBG: View {
    /*
     Our binding to the `popoverVisisble` state
    */
    @Binding var isPresented: Bool
    
    var body: some View {
        Color.black.opacity(0.6)
            .ignoresSafeArea(.all)
            /*
             Important for a good feeling popover, when
             user taps the dimmed background, the popover
             should close.
            */
            .onTapGesture {
                /*
                 I've slowed the animation down so you can see the effect.
                 Remove `.speed(0.9)` when you no longer want the slow version.
                */
                withAnimation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.9)) {
                    isPresented = false
                }
            }
    }
}
