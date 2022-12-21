//
//  ContentView.swift
//  calculator
//
//  Created by Alexander Suprun on 28.08.2022.
//

import SwiftUI

// MARK: - SJDJ

enum CalcButton : String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case addition = "+"
    case subtruction = "-"
    case division = "/"
    case multiplication = "*"
    case percent = "%"
    case clear = "C"
    case negative = "+/-"
    case decimal = "."
    case equal = "="
}

func  ButtonColor(_ button: CalcButton) -> Color {
    switch button {
    case .division, .multiplication, .subtruction, .addition, .equal:
        return Color.orange
    case .clear, .negative, .percent :
        return Color.gray
    default :
        return Color.gray.opacity(0.5)
    }
}

func TextButtonColor(_ button:CalcButton) -> Color {
    switch button {
    case .clear,.negative,.percent :
        return Color.black
    default :
        return Color.white
    }
}

struct ContentView: View {
    @State var value = "0"
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .division],
        [.seven, .eight, .nine, .multiplication],
        [.four, .five, .six, .subtruction],
        [.one, .two, .three, .addition],
        [.zero, .decimal, .equal]
    ]
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                // Display
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                }.padding()
                // Our buuttons
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing : 12){
                        ForEach(row, id: \.self) { item in
                            Button(action:{
                                self.PressedEquals(button: item)
                            },label : {
                                Text(item.rawValue)
                                    .font(.system(size: 40))
                                    .frame(width: self.ButtonWidth(item: item), height: self.ButtonHeight())
                                    .background(ButtonColor(item))
                                    .foregroundColor(TextButtonColor(item))
                                    .cornerRadius(self.ButtonWidth(item:item)/2)
                                
                                
                            })}
                    }
                    .padding(.bottom,3)
                }
            }
            
        }
        
    }
    func PressedEquals(button : CalcButton)  {
        do {
            switch button {
            case .equal :
                let result =  try calculate(self.value)
                if result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.value = "\(Int(result))"
                } else {
                    self.value = String(result)
                }
            case .clear :
                self.value.removeAll()
                self.value = "0"
            default :
                let number = button.rawValue
                if self.value == "0"
                {
                    value=number
                }
                else {
                    self.value = "\(self.value)\(number)"
                }
            }
        } catch let Error {
            self.value = ""
        }
    }
    
    func ButtonWidth( item : CalcButton) ->CGFloat{
        if item == .zero {
            return (UIScreen.main.bounds.width - (5*7))/2
        }
        return (UIScreen.main.bounds.width - (5*12))/4
    }
    func ButtonHeight() -> CGFloat{
        return (UIScreen.main.bounds.width - (5*12))/4
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
