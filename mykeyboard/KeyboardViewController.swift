import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    private var selectedColor: UIColor = .white // Default color
    private let userDefaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT")
    
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
        
        
        //        loadString(forKey: "greeting")
        let keyboardtheme : Theme = loadTheme()
        let selectedColor: Color = keyboardtheme.selectedColor
        let backgroundColor: Color = keyboardtheme.backgroundColor
        let foregroundColor: Color = keyboardtheme.foregroundColor
        let backgroundImage: String = keyboardtheme.backgroundImage
        let isHaveImage: Bool = keyboardtheme.isHaveImage
        let bottunColor: Color = keyboardtheme.buttonColor
        let buttonTextColor: Color = keyboardtheme.buttonTextColor
        let buttoncurner: CGFloat = keyboardtheme.buttonCorner
        let keyboardWidth: CGFloat = UIScreen.main.bounds.width
        let isInthemes: Bool = true
        // Initialize viewkeyboard with a selected color binding
        let hostingController = UIHostingController(rootView: ViewKeyboard(
            selectedColor: selectedColor,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            backgroundImage: backgroundImage,
            IshaveImage: isHaveImage,
            bottunColor: bottunColor,
            buttonTextColor: buttonTextColor,
            buttoncurner: buttoncurner,
            keyboardWidth: keyboardWidth,
            isInthemes: isInthemes,
            imageData: Data()
        ))
        view.addKeyboardView(hostingController.view)
        
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "addkey"),
            object: nil,
            queue: nil,
            using: { notification in
                if let key = notification.object as? String {
                    if key == "delete" {
                        self.textDocumentProxy.deleteBackward()
                    } else {
                        self.textDocumentProxy.insertText(key)
                    }
                }
            }
        )
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
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
    
    // MARK: - UserDefaults handling
    
    //     func loadString(forKey key: String) {
    //         let defaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT")
    //         let greeting = defaults?.string(forKey: "userID")
    //         print("string iiis  \(greeting)")
    //
    //    }
    
    //to get theme
    func loadTheme() -> Theme {
        let defaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT")
        if let savedThemeData = defaults?.data(forKey: "selectedTheme"),
           let savedTheme = try? JSONDecoder().decode(Theme.self, from: savedThemeData) {
            return savedTheme
        }
        let themey : Theme = Theme(selectedColor: Color(hex: "#FFFFFF"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#000000"), backgroundImage: "bg1", isHaveImage: true, buttonColor: Color(hex: "#0000FF"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 20, isInThemes: false,imageData: Data())
        return themey
    }
    
    
    
    // func loadString(forKey key: String) -> String? {
    //     if let savedString = userDefaults?.string(forKey: key) {
    //         print("Loaded string \"\(savedString)\" from UserDefaults with key: \(key)")
    //         return savedString
    //     } else {
    //         print("No string data found for key: \(key) in UserDefaults")
    //         return nil
    //     }
    // }
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
