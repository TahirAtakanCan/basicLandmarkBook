//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Tahir Atakan Can on 16.10.2023.
//

import UIKit

                                        // table view kullanmak istiyorsak bu iki protokolü kullanmak zorundayız.
class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        landmarkNames.append("istanbul")
        landmarkNames.append("roma")
        landmarkNames.append("barcelona")
        landmarkNames.append("pekin")
        landmarkNames.append("london")
        
        
        
        
        landmarkImages.append(UIImage(named: "istanbul.jpg")!)
        landmarkImages.append(UIImage(named: "roma.jpg")!)
        landmarkImages.append(UIImage(named: "barcelona.jpg")!)
        landmarkImages.append(UIImage(named: "pekin")!)
        landmarkImages.append(UIImage(named: "london")!)
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return landmarkNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "Test" -> bu kod yerine ekstra şu 3 satır da yazılabilir
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    // !!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            //tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    

}

