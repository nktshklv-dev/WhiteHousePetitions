//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by Nikita  on 6/11/22.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var urlString: String
        if navigationController?.tabBarItem.tag == 0{
         urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        }
        else{
            
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
        
            }
           
        }
        showError()
        
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let petition = petitions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController
        vc!.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    func showError(){
        let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed; Please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    

}

