import SwiftUI

struct viewkeyboard: View {
    @State private var isUpperCase = false
       @State private var isSymbolMode = false

    private var selectedColor: Color
    private var foregroundColor: Color = .black
    
    init(selectedColor: Color) {
        self.selectedColor = selectedColor

    }
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
        //add button int bottom left
        VStack {
        Spacer()
        
        HStack {
            Button(action: {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: "delete")
                }) {
                    Text("test")
                        .frame(width: 40, height: 80)
                        .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                        .cornerRadius(5)
                        .font(.system(size: 16, weight: .bold, design: .default))
                          .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }
                Spacer()
            }
            .padding()
        }
           VStack {
        Spacer()
        
        HStack {
                Spacer()
            Button(action: {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: "delete")
                }) {
                    Text("test")
                        .frame(width: 40, height: 80)
                        .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                        .cornerRadius(5)
                        .font(.system(size: 16, weight: .bold, design: .default))
                          .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }
            }
            .padding()
        }

               VStack {
        Spacer()
         Spacer().frame(
                height: 10
            )
        HStack {
            Button(action: {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: "delete")
                }) {
                    Text("test")
                        .frame(width: 30, height: 60)
                        .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                        .cornerRadius(5)
                        .font(.system(size: 16, weight: .bold, design: .default))
                          .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }
                Spacer()
                 Button(action: {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: "delete")
                }) {
                    Text("test")
                        .frame(width: 30, height: 60)
                        .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                        .cornerRadius(5)
                        .font(.system(size: 16, weight: .bold, design: .default))
                          .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }
            }
            .padding()
        Spacer()
        }
        
        VStack(spacing: 5) {
            //text field take what is typed
             TextField("The worst she can do is say no", text: .constant(""))//
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .frame(height: 50)
                    
            //add space between rows of height 5
            Spacer().frame(
                height: 4
            )
            
            ForEach(getRows(), id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(row, id: \.self) { key in
                                    Button(action: {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: self.getKeyOutput(key: key))
                }) {
                    Text(self.getButtonText(key: key))
                        .frame(width: self.getKeyWidth(key: key), height: 25)
                        .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }


                    }
                }
            }
             HStack(spacing: 5) {
                Button(action: {
                    self.isUpperCase.toggle()
                }) {
                    Text(self.isUpperCase ? "abc" : "ABC")
                        .frame(width: 80, height: 25)
                         .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                         .font(.system(size: 16, weight: .bold, design: .default))
                          .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }
                
                Button(action: {
                    self.isSymbolMode.toggle()
                }) {
                    Text(self.isSymbolMode ? "123" : "!@#")
                        .frame(width: 80, height: 25)
                         .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                        .font(.system(size: 16, weight: .bold, design: .default))
                         .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }
                //empty button
                Button(action: {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: "")
                }) {
                    Text("🙂")
                        .frame(width: 80, height: 25)
                        .background(self.selectedColor)
                        .foregroundColor(self.foregroundColor)
                        .cornerRadius(5)
                        .font(.system(size: 16, weight: .bold, design: .default))
                         .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(self.foregroundColor, lineWidth: 2)
                        )
                }
            }
            .padding(.top, 0)
        }
        .padding()
        }.padding(4)
    }
    
    func getKeyWidth(key: String) -> CGFloat {
        switch key {
        case "Space":
            return 160
        case "Return", "Delete":
            return 80
        default:
            return 25
        }
    }

    func getRows() -> [[String]] {
        var keys: [[String]] = [
           //lowercase
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Delete"],
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["z", "x", "c", "v", "b", "n", "m"],
            ["Space", "Return"]
        ]
        
        // Optionally convert to uppercase if needed
        if isUpperCase {
           keys  = [
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Delete"],
                ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
                ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
                ["Z", "X", "C", "V", "B", "N", "M"],
                ["Space", "Return"]
            ]
            return keys

        }
        if isSymbolMode {
            keys = [
                ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "Delete"],
                ["_", "+", "-", "=", "|", "}", "{", "\"", "'", ":"],
                [";", ">", "<", ",", ".", "?", "/", "\\", "[", "]"],
                ["`", "~", "??", "!!", ":)", "<>", "()"],
                ["Space", "Return"]
            ]
            return keys
        } 
        else {
            return keys
        }
    }
    
    func getButtonText(key: String) -> String {
        switch key {
        case "Space":
            return "Space"
        case "Return":
            return "Return"
        case "Delete":
            return "delete"
        default:
            return key
        }
    }
    
    func getKeyOutput(key: String) -> String {
        switch key {
        case "Space":
            return " "
        case "Return":
            return "\n"
        case "Delete":
            return "delete"
        default:
            return key
        }
    }
}

struct viewkeyboard_Previews: PreviewProvider {
    static var previews: some View {
        viewkeyboard(selectedColor: Color.blue)
    }
}
