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
    private let keyboardView = viewkeyboard()
    
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

        
        view.addKeyboardView(UIHostingController(rootView: keyboardView).view)
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "addkey"),
            object: nil,
            queue: nil,
            using: 
            {
                notification in 
                if let key = notification.object as? String {
                    self.textDocumentProxy.insertText(key)
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
            //here is the change to the original code to make the text red
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
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
