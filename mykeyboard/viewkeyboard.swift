import SwiftUI

struct viewkeyboard: View {
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 4) {
            ForEach(getRows(), id: \.self) { row in
                HStack(spacing: 4) {
                    ForEach(row, id: \.self) { key in
                        Button(action: {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: getKeyOutput(key: key))
                        }) {
                            Text(key)
                                .frame(width: getKeyWidth(key: key), height: 40)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func getKeyWidth(key: String) -> CGFloat {
        switch key {
        case "Space":
            return 160
        case "Return":
            return 80
        case "Delete":
            return 80
        default:
            return 35
        }
    }

    func getRows() -> [[String]] {
        return [
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Delete"],
            ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
            ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
            ["Z", "X", "C", "V", "B", "N", "M"],
            ["Space", "Return"]
        ]
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
        viewkeyboard()
    }
}
