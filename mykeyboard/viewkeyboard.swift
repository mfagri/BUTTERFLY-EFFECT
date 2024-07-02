import SwiftUI

struct viewkeyboard: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            ForEach(0..<4) { row in
                HStack {
                    ForEach(0..<10) { column in
                        let key = getKey(row: row, column: column)
                        if !key.isEmpty {
                            Button(action: {
                                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addkey"), object: key)
                            }) {
                                Text(key)
                                    .frame(width: 30, height: 30)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
            }
            Button(action: {
                showAlert.toggle()
            }) {
                Text("Show Dialog")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Dialog"), message: Text("This is a dialog"), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }
    
    func getKey(row: Int, column: Int) -> String {
        let keys = [
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
            ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
            ["A", "S", "D", "F", "G", "H", "J", "K", "L", ""],
            ["Z", "X", "C", "V", "B", "N", "M", "Space", "Return", ""]
        ]
        return keys[row][column]
    }
}

struct viewkeyboard_Previews: PreviewProvider {
    static var previews: some View {
        viewkeyboard()
    }
}
