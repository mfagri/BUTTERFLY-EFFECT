import UIKit
import SwiftUI
import Security

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    private var selectedColor: UIColor = .white // Default color
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // Load selected color from UserDefaults
        dataload(key: "greeting")
        let loadedData = loadFromKeychain(key: "greeting")
        if let string = loadedData {
            print("The loaded string is: \(string)")
        } else {
            print("No greeting string found in Keychain")
        }
        
        // Initialize viewkeyboard with a selected color binding
        let hostingController = UIHostingController(rootView: viewkeyboard(selectedColor: Color(selectedColor)))
        view.addKeyboardView(hostingController.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = self.selectedColor
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    @objc func handleInputModeList(from sender: Any) {
        // Handle input mode switching here
    }
    
    // MARK: - Keychain Operations
    
    func saveToKeychain(key: String, data: Data) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
            kSecAttrAccessGroup as String: "group.com.BUTTERFLY-EFFECT.BUTTERFLY-EFFECT"
        ]
        
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
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

    func dataload(key: String) -> String? {
        let userDefaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT.BUTTERFLY-EFFECT")
         if let savedString = userDefaults?.string(forKey: key) {
            print("Loaded string \"\(savedString)\" from UserDefaults with key: \(key)")
            return savedString
        } else {
            print("No string data found for key: \(key) in UserDefaults")
            return nil
        }
    
}
    
    
    // Helper method to print all keychain items (for debugging purposes)
    func printAllKeychainItems() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnAttributes as String: true,
            kSecMatchLimit as String: kSecMatchLimitAll
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess, let items = result as? [[String: Any]] {
            for item in items {
                print(item)
            }
        } else {
            print("Error retrieving keychain items: \(status)")
        }
    }
    
    // Other methods and extensions as needed
}

extension UIView {
    func addKeyboardView(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
        subview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        subview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension Color {
    init?(hexString: String) {
        let scanner = Scanner(string: hexString)
        var rgbValue: UInt64 = 0
        
        guard scanner.scanHexInt64(&rgbValue) else {
            return nil
        }
        
        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: Double(r), green: Double(g), blue: Double(b))
    }
}
