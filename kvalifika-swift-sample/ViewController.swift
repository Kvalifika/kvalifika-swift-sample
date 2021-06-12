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
            AppID: "26d3f2ee-4f37-4376-8357-c4114b9d2c63",
            AppLogoImageName: "AppLogo",
            DocLogoImageName: "DocLogo",
            CancelImageName: "cancel",
            LanguageLocale:  KvalifikaSDKLocale.GE.rawValue,
            onInitialize: onInitialize,
            onStart: onStart,
            onFinish: onFinish,
            onError: onError
        )
        
    }
    
    
    func onInitialize() {
        print("onInitialize")
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

