//
//  ViewController.swift
//  FBLogin
//
//  Created by wu yuhsaing on 2018/8/9.
//  Copyright © 2018年 Sam. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {

    @IBOutlet weak var FBlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let btnFBlogin = FBSDKLoginButton()
        btnFBlogin.readPermissions = ["public_profile","email"]
        btnFBlogin.delegate = self
        btnFBlogin.center = self.view.center
        self.view.addSubview(btnFBlogin)

        if FBSDKAccessToken.current() != nil{
            self.FBlabel.text = "Login in"
            
        }else{
            self.FBlabel.text = "not logged in"
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{

        self.FBlabel.text = error.localizedDescription
        }else if result.isCancelled{
            self.FBlabel.text = "User cancelled log in"
        }else{
            self.FBlabel.text = "User Logged in"
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        self.FBlabel.text = "User logged out"
    }








}

