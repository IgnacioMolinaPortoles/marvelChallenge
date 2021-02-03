//
//  AuthViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 30/01/2021.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        emailTextField.layer.cornerRadius = 12
        passwordInput.layer.cornerRadius = 12
        logInButton.layer.cornerRadius = 12
        signUpButton.layer.cornerRadius = 12
        
        super.viewDidLoad()
        
        title = "Bienvenido a MarvelChallenge!"
        emailTextField.text = "ludmila@gmail.com"
        passwordInput.text = "123456"
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email = emailTextField.text , let password = passwordInput.text{
            
            if(password.count < 6 ){
                let alertController = UIAlertController(title: "Error", message: "La contrasena debe tener mas de 6 caracteres" , preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            } else {
            
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let result = result, error == nil {

                        UserDefaultsHelper.Shared.saveValue(value: result.user.email!, key:UserDefaultsKeys.email)
                        
                        NavigatorHelper.sharedInstance.goHome()

                        
                    }else{
                        let alertController = UIAlertController(title: "Error", message: "Se ha producido un error resgistrando el usuario" , preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                
                }
            }
        }
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
    
       if let email = emailTextField.text , let password = passwordInput.text {
        
        if(password.count < 6 ){
            let alertController = UIAlertController(title: "Error", message: "La contrasena debe tener mas de 6 caracteres" , preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        } else {
        
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil {
                    UserDefaultsHelper.Shared.saveValue(value: result.user.email!, key:UserDefaultsKeys.email)
                    
                    NavigatorHelper.sharedInstance.goHome()
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error resgistrando el usuario" , preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    }
            
                }
            }
        }
    }

}
    

