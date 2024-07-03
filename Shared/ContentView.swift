import SwiftUI
import Security

@available(OSX 11.0, *)
struct ContentView: View {
    @State private var selectedColor = Color.blue // Default color
    
    // Key for UserDefaults
    private let selectedColorKey = "selectedColorKey"
    private let userDefaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT.BUTTERFLY-EFFECT")
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Change the color of the clavier")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24)
                    .padding()
                //button
                Button(action: {//
                     
                    let loadedString = loadFromKeychain(key: "greeting")
                    if let string = loadedString {
                        print("The loaded string is: \(string)")
                    } else {
                        print("No greeting string found in UserDefaults")
                    }
                    let string = loadString(forKey: "greeting")
                }) {
                    Text("Red")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(24)
                        .padding()
                }
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(0..<5) { index in
                            Button(action: {
                                // print("Selected color: \(index)")
                                // let myString = "Hello, world!"
                                // saveString(myString, forKey: "greeting")
                                let myString = "Hello, world!"
                                let saveSuccessful = saveToKeychain(key: "greeting", data: myString.data(using: .utf8)!)
                                if saveSuccessful {
                                    print("Data saved successfully")
                                } else {
                                    print("Data save failed")
                                }
                                saveString(myString, forKey: "greeting")

                            }) {
                                Rectangle()
                                    .fill(Color(hue: Double(index) / 5, saturation: 1, brightness: 1))
                                    .frame(width: geometry.size.width, height: 80)
                                    .cornerRadius(24)
                            }
                        }
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
    
    func saveString(_ value: String, forKey key: String) {
        userDefaults?.set(value, forKey: key)
        print("Saved string \"\(value)\" to UserDefaults with key: \(key)")
    }
    
    func loadString(forKey key: String) -> String? {
        if let savedString = userDefaults?.string(forKey: key) {
            print("Loaded string \"\(savedString)\" from UserDefaults with key: \(key)")
            return savedString
        } else {
            print("No string data found for key: \(key) in UserDefaults")
            return nil
        }
    }

    //
    func saveToKeychain(key: String, data: Data) -> Bool {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key,
        kSecValueData as String: data,
        kSecAttrAccessGroup as String: "group.com.BUTTERFLY-EFFECT.BUTTERFLY-EFFECT"
    ]

    // Delete any existing item
    SecItemDelete(query as CFDictionary)

    // Add the new item
    let status = SecItemAdd(query as CFDictionary, nil)
    
    if status != errSecSuccess {
        print("Error saving to Keychain: \(status)")
    } else {
        print("Data saved successfully")
    }
    return status == errSecSuccess
}

   func loadFromKeychain(key: String) -> Data? {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key,
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecAttrAccessGroup as String: "group.com.BUTTERFLY-EFFECT.BUTTERFLY-EFFECT"
    ]

    var dataTypeRef: AnyObject? = nil
    let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
    
    if status == errSecSuccess {
        return dataTypeRef as? Data
    } else {
        print("Error loading from Keychain: \(status)")
        return nil
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

