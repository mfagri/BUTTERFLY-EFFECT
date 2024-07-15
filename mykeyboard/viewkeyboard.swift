import SwiftUI

struct viewkeyboard: View {
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
        // let screenSize: CGRect = UIScreen.main.bounds
        // let screenWidth = screenSize.width
        // let screenHeight = screenSize.height
    }
    var body: some View {

              ZStack {
        Image("bg1")
            .resizable()
            .scaledToFill()
            .frame(width: screenWidth, height: .infinity)
            
        VStack(spacing: 5) {
            //text field take what is typed
             TextField("The worst she can do is say no", text: .constant(""))//
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .frame(height: 50)
                    
            //add space between rows of height 5
            Spacer().frame(
                height: 5
            )
            ForEach(getRows(), id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(row, id: \.self) { key in
            //    GeometryReader { g in
                                Button(action: {
                                    // if self.getButtonText(key: key) == "abc" && self.isSymbolMode {
                                    //         self.isSymbolMode != self.isSymbolMode
                                    //         self.isUpperCase = false
                                    // }
                                    if key == "{&=" {
                                        self.isSymbolMode = false
                                        self.isSymbolMode2.toggle()
                                    }
                                    else if key == "en" {
                                        self.isUpperCase.toggle()
                                    }
                                    else if key == "123" {
                                        if self.isSymbolMode {
                                            self.isSymbolMode.toggle()
                                        }
                                        else {
                                            self.isSymbolMode.toggle()
                                            self.isUpperCase = false
                                        }
                                    }
                                    else if key == "abc" {
                                        self.isUpperCase.toggle()
                                        self.isSymbolMode.toggle()
                                        self.isSymbolMode2.toggle()
                                    }
                                    else {
                                        // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: self.getKeyOutput(key: key))
                                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: self.getKeyOutput(key: key))
                                    }
                                }) {
                                    if self.getButtonText(key: key) == "delete" || self.getButtonText(key: key) == "return" || self.getButtonText(key: key) == "space" || self.getButtonText(key: key) == "abc" || self.getButtonText(key: key) == "123" || self.getButtonText(key: key) == "emoji"
                                    {
                                        if self.getButtonText(key: key) == "abc" && self.isSymbolMode {
                                                                                   Text("abc")
                                        .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor)
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                        else if self.getButtonText(key: key) == "delete" {
                                            Image(systemName: "delete.left")
                                               .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor)
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                        else if self.getButtonText(key: key) == "space" {
                                            Image(systemName: "space")
                                                                                         .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor)
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                        else if self.getButtonText(key: key) == "abc" {
                                            Image(systemName: "arrowshape.up.fill")
                                                                                         .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor)
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                        else if self.getButtonText(key: key) == "123" {
                                            Image(systemName: "number")
                                                                                         .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor)
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                        else if self.getButtonText(key: key) == "emoji" {
                                            Image(systemName: "smiley")
                                                                                         .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor)
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                        else {
                                            Image(systemName: "return")
                                                                                         .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor)
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        }
                                    }
                                    else{

                                        Text(self.getButtonText(key: key))
                                        .frame(width: self.getKeyWidth(key: key), height: 45)
                                        .background(self.selectedColor.opacity(0.5))
                                        .foregroundColor(self.foregroundColor)
                                        .cornerRadius(5)
                                        .font(.system(size: 16, weight: .bold, design: .default))
                                        // .overlay(
                                        //     RoundedRectangle(cornerRadius: 5)
                                        //         .stroke(self.foregroundColor, lineWidth: 2)
                                        // )
                                    }
                                    
                                    
                                // }.frame(width: self.getKeyWidth(key: key, geometry: g), height: 45)
                            }
                            

                    }
                }
            }
            Spacer().frame(
                height: 5
            )
            }
              .frame(width: screenWidth, height: .infinity)
        
      }  .frame(width: screenWidth, height: .infinity)
    }
    
    func getKeyWidth(key: String) -> CGFloat {

        switch key {
        case "Space":
            return 80
        case "return", "delete":
            return 34
        default:
            return self.screenWidth / 12
        }
    }

    func getRows() -> [[String]] {
        var keys: [[String]] = [
           //lowercase
            // ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Delete"],
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["en","z", "x", "c", "v", "b", "n", "m","Delete"],
            ["123","emoji",",","Space","." ,"Return"]
        ]
        
        // Optionally convert to uppercase if needed
        if isUpperCase {
           keys  = [
                // ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Delete"],
                ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
                ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
                ["en","Z", "X", "C", "V", "B", "N", "M","Delete"],
                ["123","emoji",",","Space","." ,"Return"]
            ]
            return keys

        }
        if isSymbolMode {
            keys = [
                ["1","2","3","4","5","6","7","8","9","0"],
                [ "@", "#", "$","&", "_", "-","(", ")","=","%"],
                ["\"", "*", "\'", ":", "/", "!","?","+","Delete"],
                ["{&=","abc","emoji",",","Space","." ,"Return"]
            ]
            return keys
        }
        else if isSymbolMode2{
            keys = [
                ["1","2","3","4","5","6","7","8","9","0"],
                [ "[", "]", "{","}", "<", ">","^", "∑","⇒"],
                ["`", ";", "÷", "\\", "|", "/","×","≠","Delete"],
                ["123","abc","emoji",",","Space","." ,"Return"]
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

struct viewkeyboard_Previews: PreviewProvider {
    static var previews: some View {
        viewkeyboard(selectedColor: Color.blue)
    }
}
