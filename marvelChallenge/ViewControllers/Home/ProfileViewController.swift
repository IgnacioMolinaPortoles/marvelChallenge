//
//  ProfileViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 02/02/2021.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        logOutButton.layer.cornerRadius = 12
        emailLabel.layer.cornerRadius = 12
        super.viewDidLoad()
        
        logOutButton.setTitle("Logout", for: .normal)
        emailLabel.text = (UserDefaultsHelper.Shared.getValue(key:UserDefaultsKeys.email)! as! String)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButtonAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            
            UserDefaultsHelper.Shared.removeValue(key: UserDefaultsKeys.email)
            
            NavigatorHelper.sharedInstance.goToLogin()
        } catch {
            let alertController = UIAlertController(title: "Error", message: "La contrasena debe tener mas de 6 caracteres" , preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
