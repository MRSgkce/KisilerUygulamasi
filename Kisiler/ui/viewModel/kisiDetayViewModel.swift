//
//  kisiDetayViewModel.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 11.10.2024.
//

import Foundation

class KisiDetayViewModel{
    var krepo = kisilerDaoRepositry()
    func guncelle(kisi_id:Int, kisi_ad:String,kisi_tel:String){
        krepo.guncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        
        
        
    }
}
