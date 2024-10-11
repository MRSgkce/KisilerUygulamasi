//
//  kisilerdaorepository.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 11.10.2024.
//
import Foundation
import RxSwift


class kisilerDaoRepositry {
    
    var kisileriListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        
        print("kisi kaydet: \(kisi_ad) \(kisi_tel)")
        
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String,kisi_tel:String){
        
        print("kisi kaydet: \(kisi_ad) \(kisi_tel)  \(kisi_id)")
        
    }
    
    func sil(kisi_id:Int){
       print("kişisil: \(kisi_id)")
        kisileriyukle()
    }
    
    func ara(aramakelimesi : String){
        print("kişi ara: \(aramakelimesi) ")
    }
    
    func kisileriyukle(){
        print("kisileri yukle")
        var kisilerListesi=[Kisiler]()
        let k1 = Kisiler(kisi_id:1, kisi_ad:"Mürşide",  kisi_tel: "12345")
        let k3 = Kisiler(kisi_id: 2, kisi_ad: "mustafa", kisi_tel: "345768")
        kisilerListesi.append(k1)
        kisilerListesi.append(k3)
        kisileriListesi.onNext(kisilerListesi)
    }
    
}
