//
//  AddDiscViewController.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/8/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import UIKit

class AddDiscViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNameArtist: UITextField!
    @IBOutlet weak var txtGenre: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtUrlImage: UITextField!
        
    @IBAction func clickBtnAddBrand(_ sender: Any) {
            
        let name = self.txtName.text
        let nameArtist = self.txtNameArtist.text
        let genre = self.txtGenre.text
        let year = self.txtYear.text
        let description = self.txtDescription.text
        let urlImage = self.txtUrlImage.text
        
        DiscBL.create(artist: nameArtist, description: description, state: 0, genre: genre, name: name, urlImage: urlImage, year: year, success: { (objDisc) in
            print("Se guardo correctamente")
            self.navigationController?.popViewController(animated: true)
                
        }) { (errorMessage) in
             
            self.showAlert(withTitle: "Error", withMessage: errorMessage, withAcceptButton: "Aceptar", withCompletion: nil)
                
    //            let alertAction = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
    //
    //            let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
    //            alertController.addAction(alertAction)
    //
    //            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
