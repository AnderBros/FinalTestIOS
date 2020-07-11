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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    registerNotifications()
}

override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    scrollView.contentInset.bottom = 0
}

private func registerNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
}

@objc private func keyboardWillShow(notification: NSNotification){
    guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
}

@objc private func keyboardWillHide(notification: NSNotification){
    scrollView.contentInset.bottom = 0
}
    
    /*
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {
        return
        }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollView.contentOffset = CGPoint(x:0, y:keyboardFrame.size.height)
        
    }
    
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        scrollView.contentOffset = .zero
    }*/
    
    @IBAction func clickBtnAddDisc(_ sender: Any) {
            
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
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)*/
    }

}
