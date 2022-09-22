//
//  OrganizationsMenuViewController.swift
//  MapMarket
//
//  Created by Julie Hess on 9/22/22.
//

import UIKit
import UIKit


class OrganizationsMenuViewController: UIViewController  {

    var foundOrganizations: [Organizations] = []
    var unfoundOrganizations: [Organizations] = []
    
    
    
    
    
    /*@IBAction func mapFromOrganizationPage(_ sender: UIButton) {
        OrganizationsMenuViewController = OrganizationsMenuViewController
        self.OrganizationsMenuViewController.dismiss(animated: true)
    }*/
    //self.dismiss(animated: true, completion: nil)
   
    //self.dismiss(animated: true, completion: nil)
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foundOrganizations = getAllFoundOrganizations()
        unfoundOrganizations = getAllUnfoundOrganizations()
        
        print("Organizations Found: \(foundOrganizations)")
        print("Unfound Organizations: \(unfoundOrganizations)")
        
        // Do any additional setup after loading the view.
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
