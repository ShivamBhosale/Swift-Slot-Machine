//
//  ContentView.swift
//  Slot Machine
//
//  Created by Shivam Bhosale on 08/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var credits = 1000
    private var symbols = ["apple","star","cherry"]
    @State private var numbers = [0,2,1]
    private var betAmount = 5
    
    var body: some View {
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(red: 57/255, green: 62/255, blue: 70/255)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle().foregroundColor(Color(red: 255/255, green: 211/255, blue: 105/255)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).rotationEffect(Angle(degrees: 65)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                HStack{
                    Image(systemName: "wand.and.stars").foregroundColor(.red)
                    
                    Text("Slot Machine").bold().foregroundColor(.red)
                    
                    Image(systemName: "wand.and.stars").foregroundColor(.red)
                }.scaleEffect(2)
                
                Spacer()
                // credits Counter
                Text("Credits: " + String(credits)).foregroundColor(.black)
                    .padding(.all,10)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(20)
                
                Spacer()
                
                HStack{
                Spacer()
                     
                    Image(symbols[numbers[0]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Image(symbols[numbers[1]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Image(symbols[numbers[2]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    Spacer()
                    
                    
                }
                Spacer()
                //BUTTON
                Button(action: {
                    // Change Images
                    self.numbers[0] = Int.random(in: 0...symbols.count-1)
                    self.numbers[1] = Int.random(in: 0...symbols.count-1)
                    self.numbers[2] = Int.random(in: 0...symbols.count-1)
                    
                    //Check Winning
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]
                    {
                        self.credits += self.betAmount * 10
                    }
                    else {
                        self.credits -= self.betAmount
                    }
                }, label: {
                    Text("Spin").bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing],30) .background(Color.red).cornerRadius(20)
                })
                
                Spacer()
                
            }
            
            
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
