//
//  KisiKayit.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 23.09.2024.
//

import UIKit

class KisiKayit: UIViewController {
    
    @IBOutlet weak var tfKisiAD: UITextField!
    
    @IBOutlet weak var tfKisiTel: UITextField!
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func butonKayit(_ sender: Any) {
        if let ka = tfKisiAD.text, let kt = tfKisiTel.text{
            viewModel.kaydet(kisi_ad: ka, kisi_tel: kt)
        }
        
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
