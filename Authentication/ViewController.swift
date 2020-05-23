//
//  ViewController.swift
//  Authentication
//
//  Created by Suh Fangmbeng on 5/22/20.
//  Copyright © 2020 Suh Fangmbeng. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let context = LAContext()
        var error: NSError?
        
        // .deviceOwnerAuthenticationWithBiometrics is used for Touch ID/Face ID and Password
        // .deviceOwnerAuthentication is used for Touch ID/Face ID and Passcode
        
        // Touch ID is supported on all iOS devices below iPhone 10 (X)
        // Face ID is supported on all iPhone 10 and newer and the iPad Pro and newer versions
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            
            
            // if authentication method or policy is set
            // ...
            
            print("This device can run an authentication policy")
            
            if #available(iOS 11.0, *) {
                
                
                if context.biometryType == .faceID {
                    print("Face ID was used")
                }
                
                
                if context.biometryType == .touchID {
                   print("This device is a Touch ID supported device")
               }
                
            } else {

                print("this device can not check for biometryType")
                
            }
            
           
            
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Touch ID is required to open this app") { (success, error) in
                
                if success {
                    
                    // the authentication was successful
                    print("The authentication was successful")
                    
                } else {
                    
                    // the authentication was not successful
                    print("The authentication was not successful")
                }
                
                
                
                if error != nil {
                    
                    // an error occurred while authenticating
                    guard let err = error else { return }
                    
                    print("an error occurred while authenticating the user:", err.localizedDescription)
                    
                }
            }
            
        } else {
            print("This device has not been set for the specified authentication policy")
        }
    }


}

