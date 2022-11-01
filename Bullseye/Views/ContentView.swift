//
//  ContentView.swift
//  Bullseye
//
//  Created by Lucivaldo Queiroz on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsvisible: Bool = false
    @State private var sliderValue : Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    VStack {
                        Text("🎯🎯🎯\nCOLOQUE O BULLSEYE O MAIS PRÓXIMO QUE PUDER")
                            .bold()
                            .kerning(2.0)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4.0)
                            .font(.footnote)
                            .padding()
                        Text(String(game.target))
                            .kerning(-1.0)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    HStack {
                        Text("1")
                            .bold()
                        Slider(value: self.$sliderValue, in: 1.0...100.0)
                        Text("100")
                            .bold()
                    }
                }
                Button(action: {
                    print("Hello, SwiftUI!")
                    self.alertIsvisible = true
                }) {
                    Text("Hit me")
                }
                 /*.alert(isPresented: $alertIsvisible, content: {
                    return Alert(title: Text("Hello There!"), message: Text("This is my first pop-up"), dismissButton: .default(Text("Awesome")))
                }) */
                
            //MARK: - IOS 15 - Alerta
                .alert(isPresented: $alertIsvisible) {
                    let roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello There!"), message: Text("The slider`s value is \(roundedValue).\n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Sair")))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .extraExtraLarge)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
