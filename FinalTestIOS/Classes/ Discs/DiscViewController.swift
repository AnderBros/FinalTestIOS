//
//  DiscViewController.swift
//  FinalTestIOS
//
//  Created by user171789 on 7/5/20.
//  Copyright © 2020 user171789. All rights reserved.
//

import UIKit

class DiscViewController: UIViewController {

    @IBOutlet weak var tlbDisc: UITableView!
    
    var arrayDisc = [Disc]()
    var lastSearchText = ""
    
    func createDeleteOption(indexPath: IndexPath) -> UIContextualAction {
        
        let option = UIContextualAction(style: .destructive, title: "Eliminar") { (_, _, _) in
            
            let objDD = self.arrayDisc[indexPath.row]
            self.arrayDisc.remove(at: indexPath.row)
            DiscBL.delete(objDD)
            self.tlbDisc.deleteRows(at: [indexPath], with: .automatic)
            
        }
        return option
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.arrayDisc = DiscBL.listAll()
        self.tlbDisc.reloadData()
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? BrandDetailViewController {
            controller.objBrand = sender as? Brand
        }
    }*/

}

extension DiscViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDisc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DiscTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DiscTableViewCell
        cell.objDisc = self.arrayDisc[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objDD = self.arrayDisc[indexPath.row]
        self.performSegue(withIdentifier: "DiscDetailViewController", sender: objDD)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = self.createDeleteOption(indexPath: indexPath)
        //let web = self.createWebOption(indexPath: indexPath)
        
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        return configuration
    }
}


