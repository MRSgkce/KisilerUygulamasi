//
//  KisiDetay.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 23.09.2024.
//

import UIKit

class KisiDetay: UIViewController {
    var viewModel = KisiDetayViewModel()

    @IBOutlet weak var kisiAd: UITextField!
    @IBOutlet weak var kisiTel: UITextField!
    var kisi:Kisiler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let  k = kisi {
            kisiAd.text = k.kisi_ad
            kisiTel.text = k.kisi_tel
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func butonGuncelle(_ sender: Any) {
        if let ka=kisiAd.text, let kt=kisiTel.text,let k=kisi{
            viewModel.guncelle(kisi_id: k.kisi_id!, kisi_ad: ka, kisi_tel: kt)
            
        }

    }
    
    
    
    
    
    

}
