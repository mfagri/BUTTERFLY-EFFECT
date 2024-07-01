import SwiftUI
import KeyboardKit

class KeyboardViewController: KeyboardInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the KeyboardKit context
        let context = KeyboardContext(controller: self)
        
        // Create the custom keyboard view and inject the context
        let contentView = CustomKeyboardView().environmentObject(context)
        let hostingController = UIHostingController(rootView: contentView)
        
        // Add the hosting controller as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up constraints for the hosting controller's view
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
}
