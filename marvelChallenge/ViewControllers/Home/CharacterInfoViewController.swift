//
//  CharacterInfoViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 03/02/2021.
//

import UIKit

class CharacterInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissVC))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    

    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
