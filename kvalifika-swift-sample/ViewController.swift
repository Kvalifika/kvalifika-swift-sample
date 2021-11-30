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
            AppID: "74b81cfd-1cbe-49a3-80f3-8d6780d52c77",
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
            Development: false
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
