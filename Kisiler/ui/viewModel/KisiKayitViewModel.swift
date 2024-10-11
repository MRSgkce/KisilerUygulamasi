//
//  KisiKayitViewModel.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 11.10.2024.
//

import Foundation

class KisiKayitViewModel {
    
    var krepo = kisilerDaoRepositry()
    func kaydet(kisi_ad:String,kisi_tel:String){
        krepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        
        
    }
}
