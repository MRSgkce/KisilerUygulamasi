//
//  ViewController.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 23.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    
    @IBOutlet weak var seacrhBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seacrhBar.delegate = self
        let k1 = Kisiler(kisi_id:1, kisi_ad:"Mürşide",  kisi_tel: "12345")
        let k3 = Kisiler(kisi_id: 2, kisi_ad: "mustafa", kisi_tel: "345768")
        kisilerListesi.append(k1)
        kisilerListesi.append(k3)
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        //kisilerTableView.reloadData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("anasayfa göründü")
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let kisi = sender as? Kisiler{
                let gidicel = segue.destination as! KisiDetay
                gidicel.kisi = kisi
                
            }
            
        }
    }
    
    
    
}

extension Anasayfa: UISearchBarDelegate {//sınıfı genişlettik
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("kişi arama: \(searchText)")
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        let hucre=tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! kisilerHucre
        
        hucre.labelKisi.text=kisi.kisi_ad
        hucre.labelTel.text=kisi.kisi_tel
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let sil = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction, sourceView, bool) in
            let kisi = self.kisilerListesi[indexPath.row]
            let alert = UIAlertController(title: "Kişi Silme", message: "\(kisi.kisi_ad!) Kişi Silinsin mi?", preferredStyle: .alert)
            
            let iptal = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptal)
            
            let sil = UIAlertAction(title: "Sil", style: .destructive) { (action) in
                print("kişi sil : \(kisi.kisi_id!)")
                
            }
            alert.addAction(sil)
            self.present(alert,animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [sil])
    }
        
    }
        
        
        
    
    

