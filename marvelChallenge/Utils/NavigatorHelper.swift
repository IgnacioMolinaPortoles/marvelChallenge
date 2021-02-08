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
    
    
    func goToInfoViewController(originVc:UIViewController, characterInfo: _Character) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
        
        let destinationVC = (storyBoard.instantiateViewController(withIdentifier: "CharacterInfoViewController") as? CharacterInfoViewController)!
        //destinationVC.modalPresentationStyle = .overCurrentContext
        
        destinationVC.Character = characterInfo
        originVc.navigationController?.pushViewController(destinationVC, animated: true)

        //originVc.present(destinationVC, animated: true, completion: nil)

    }
    
    func openEventDetailModal(originVc:UIViewController, event: Event) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Home", bundle:nil)
        
        let destinationVC = (storyBoard.instantiateViewController(withIdentifier: "EventDetailViewController") as? EventDetailViewController)!
        destinationVC.modalPresentationStyle = .overCurrentContext
        
        destinationVC.setup(event)

        originVc.present(destinationVC, animated: true, completion: nil)

    }
    
}
