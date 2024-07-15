import SwiftUI

struct ViewKeyboard: View {
    @State private var isUpperCase = false
    @State private var isSymbolMode = false
    @State private var isSymbolMode2 = false

    private var selectedColor: Color
    private var backgroundColor: Color = .white
    private var foregroundColor: Color = .black
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    private var screenHeight: CGFloat = UIScreen.main.bounds.height

    @State private var showingAlert = false
    
    init(selectedColor: Color , backgroundColor: Color = .white, foregroundColor: Color = .black) {
        self.selectedColor = selectedColor
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        ZStack {
            Image("bg1")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth, height: .infinity)
            
            VStack(spacing: 5) {
                // TextField to take what is typed
                TextField("The worst she can do is say no", text: .constant("")) // Binding to a constant string just for display
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .frame(height: 50)
                    
                Spacer().frame(height: 5)
                ForEach(getRows(), id: \.self) { row in
                    HStack(spacing: 5) {
                        ForEach(row, id: \.self) { key in
                            Button(action: {
                                handleKeyPress(key: key)
                            }) {
                                getKeyView(for: key)
                                    .frame(width: getKeyWidth(key: key), height: 45)
                                    .background(selectedColor.opacity(0.5))
                                    .foregroundColor(foregroundColor)
                                    .cornerRadius(5)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                            }
                        }
                    }
                }
                
                Spacer().frame(height: 5)
            }
            .frame(width: screenWidth, height: .infinity)
        }
        .frame(width: screenWidth, height: .infinity)
    }
    
    func getKeyWidth(key: String) -> CGFloat {
        switch key {
        case "Space":
            return 80
        case "Return", "Delete":
            return 34
        default:
            return screenWidth / 12
        }
    }

    func getRows() -> [[String]] {
        var keys: [[String]] = [
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["en", "z", "x", "c", "v", "b", "n", "m", "Delete"],
            ["123", "emoji", ",", "Space", ".", "Return"]
        ]
        
        if isUpperCase {
            keys = [
                ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
                ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
                ["en", "Z", "X", "C", "V", "B", "N", "M", "Delete"],
                ["123", "emoji", ",", "Space", ".", "Return"]
            ]
        } else if isSymbolMode {
            keys = [
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
                ["@", "#", "$", "&", "_", "-", "(", ")", "=", "%"],
                ["\"", "*", "'", ":", "/", "!", "?", "+", "Delete"],
                ["{&=", "abc", "emoji", ",", "Space", ".", "Return"]
            ]
        } else if isSymbolMode2 {
            keys = [
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
                ["[", "]", "{", "}", "<", ">", "^", "∑", "⇒"],
                ["`", ";", "÷", "\\", "|", "/", "×", "≠", "Delete"],
                ["123", "abc", "emoji", ",", "Space", ".", "Return"]
            ]
        }
        
        return keys
    }
    
    func getKeyView(for key: String) -> some View {
        switch getButtonText(key: key) {
        case "delete":
            return AnyView(Image(systemName: "delete.left"))
        case "space":
            return AnyView(Image(systemName: "space"))
        case "return":
            return AnyView(Image(systemName: "return"))
        case "abc":
            if isSymbolMode || isSymbolMode2 {
                return AnyView(Image(systemName: "character"))
            } else {
                return AnyView(Image(systemName: "arrowshape.up.fill"))
            }
            // return AnyView(Image(systemName: "arrowshape.up.fill"))
        case "123":
            return AnyView(Image(systemName: "number"))
        case "emoji":
            return AnyView(Image(systemName: "smiley"))
        case "{&=":
            return AnyView(Text("{&="))
        default:
            return AnyView(Text(getButtonText(key: key)))
        }
    }
    
    func handleKeyPress(key: String) {
        switch key {
        case "{&=":
            if isSymbolMode == true {
                isSymbolMode = false
                isSymbolMode2 = true
            }
            else  {
                isSymbolMode2 = false
                isSymbolMode = true
            }
        case "en":
            isUpperCase.toggle()
        case "123":
            if isSymbolMode {
                isSymbolMode.toggle()
                isSymbolMode2 = false
            } else {
                isSymbolMode.toggle()
                isUpperCase = false
            }
        case "abc":
            isUpperCase.toggle()
            isSymbolMode = false
            isSymbolMode2 = false
        default:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: getKeyOutput(key: key))
        }
    }
    
    func getButtonText(key: String) -> String {
        switch key {
        case "Space":
            return "space"
        case "Return":
            return "return"
        case "Delete":
            return "delete"
        case "en":
            return "abc"
        case "123":
            return "123"
        case "emoji":
            return "emoji"
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

struct ViewKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ViewKeyboard(selectedColor: Color.blue)
    }
}
