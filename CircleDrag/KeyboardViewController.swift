//
//  KeyboardViewController.swift
//  CircleDrag
//
//  Created by Франчук Андрей on 16.05.2020.
//  Copyright © 2020 Франчук Андрей. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    var swiftUIConteiner: UIViewController?
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge{
        print("request edges for keyboard")
        return [.bottom]
    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        //  child.setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
//        print("create children for keyboard")
//
//    }
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("set edges for keyboard")
        setNeedsUpdateOfScreenEdgesDeferringSystemGestures() // better to call it here
    }

    override var childForScreenEdgesDeferringSystemGestures: UIViewController? {
        print("show children for keyboard")
        return self.swiftUIConteiner
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("creates SwiftUI View")
        let swiftUIView = SwiftUIContainer()
        let child = MyController(rootView: swiftUIView)
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.swiftUIConteiner = child as UIViewController

        view.addSubview(child.view)
        addChild(child)
        setNeedsUpdateOfScreenEdgesDeferringSystemGestures() 
//        // Perform custom UI setup here
//        self.nextKeyboardButton = UIButton(type: .system)
//
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//
//        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
//
//        self.view.addSubview(self.nextKeyboardButton)
//
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
      //  self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
