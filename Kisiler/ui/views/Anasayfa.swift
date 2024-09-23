//
//  ViewController.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 23.09.2024.
//

import UIKit

class Anasayfa: UIViewController,UISearchBarDelegate {

    
    @IBOutlet weak var seacrhBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seacrhBar.delegate = self
        
        
    }
    
    
    @IBAction func detay(_ sender: Any) {
        let kisi = Kisiler(kisi_id:1, kisi_ad: "merve",kisi_tel: "0876534")
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let kisi = sender as? Kisiler{
                let gidicel = segue.destination as! KisiDetay
                gidicel.kisi = kisi
                
            }
            
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("kişi arama: \(searchText)")
    }
    
}

