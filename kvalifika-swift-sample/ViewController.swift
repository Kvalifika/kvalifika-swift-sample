//
//  ViewController.swift
//  kvalifika-swift-sample
//
//  Created by Levan Gurbeleishvili on 5/24/21.
//

import UIKit
import Kvalifika

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize SDK
        KvalifikaSDK.initialize(
            AppID: "YOUR APP ID",
            Locale: KvalifikaSDKLocale.GE.rawValue,
            Logo: "AppLogo",
            DocumentIcon: "DocLogo",
            CancelIcon: "cancel",
            ActiveFlashIcon: "",
            InactiveFlashIcon: "",
            onInitialize: onInitialize,
            onStart: onStart,
            onFinish: onFinish,
            onError: onError,
            Development: true
        )
    }

    func onInitialize() {
        print("onInitialize")
        KvalifikaSDK.startSession(onViewController: self)
    }
    
    func onStart(sessionId: String) {
        print(sessionId, "started")
    }
    
    func onFinish(sessionId: String) {
        print(sessionId, "onFinish")
    }
    
    func onError(error: KvalifikaSDKError) {
        print(error)
    }
    
    @IBAction func onStartButtonAction(_ sender: Any) {
        let _ = KvalifikaSDK.startSession(onViewController: self)
    }
}
