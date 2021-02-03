//
//  NavigatorHelper.swift
//  marvelChallenge
//
//  Created by Maxi Cassola on 02/02/2021.
//

import Foundation
import UIKit

class NavigatorHelper {
    static let sharedInstance = NavigatorHelper()
    
    func goHome() {
        if let window = UIApplication.shared.keyWindow {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
            
            let destinationVC = (storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController)!
           // destinationVC.email = email
            
            let nav = UINavigationController(rootViewController: destinationVC)
            window.rootViewController = nav
        }
    }
    
    func goToLogin() {
        if let window = UIApplication.shared.keyWindow {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
            
            let destinationVC = (storyBoard.instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController)!
           // destinationVC.email = email
            
            let nav = UINavigationController(rootViewController: destinationVC)
            window.rootViewController = nav
        }
    }
    
    
    func goToInfoViewController(originVc:UIViewController) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
        
        let destinationVC = (storyBoard.instantiateViewController(withIdentifier: "CharacterInfoViewController") as? CharacterInfoViewController)!
      //  destinationVC.modalPresentationStyle = .overCurrentContext
        
//        originVc.navigationController?.pushViewController(destinationVC, animated: true)

        originVc.present(destinationVC, animated: true, completion: nil)

    }
}
