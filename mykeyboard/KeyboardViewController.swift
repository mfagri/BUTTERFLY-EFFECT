//
//  KeyboardViewController.swift
//  mykeyboard
//
//  Created by Marouane Fagri on 7/1/24.
//

import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    private var selectedColor: UIColor = .white // Default color
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // Load selected color from UserDefaults
        let loadedString = loadString(forKey: "greeting")
        if let string = loadedString {
        print("The loaded string is: \(string)")
        } else {
        print("No greeting string found in UserDefaults")
        }
        ////////////////////////////////
        
        // Initialize viewkeyboard with a selected color binding
        let hostingController = UIHostingController(rootView: viewkeyboard(selectedColor: Color(selectedColor)))
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
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            // Change text color based on the selectedColor
            textColor = self.selectedColor
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    // MARK: - UserDefaults handling
    
    func loadString(forKey key: String) -> String? {
        // Retrieve the string associated with the key
        let savedString = UserDefaults.standard.string(forKey: key)
        
        // Check if a value exists for the key
        if let savedString = savedString {
            print("Loaded string \"\(savedString)\" from UserDefaults with key: \(key)")
            return savedString
        } else {
            print("No string data found for key: \(key) in UserDefaults")
            return nil
        }
        }
    
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
    // Extension to convert Hex string to Color
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