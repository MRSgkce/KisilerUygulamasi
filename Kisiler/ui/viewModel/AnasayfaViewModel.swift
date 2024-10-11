//
//  AnasayfaViewModel.swift
//  Kisiler
//
//  Created by Mürşide Gökçe on 11.10.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    var krepo = kisilerDaoRepositry()
    
    var kisileriListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init(){
        kisileriListesi=krepo.kisileriListesi
        kisileriiyukle()
    }
    
    func kisisil(kisi_id:Int){
        krepo.sil(kisi_id: kisi_id)
    }
    func ara (ara_kriter:String){
        krepo.ara(aramakelimesi: ara_kriter)
    }
    
    func kisileriiyukle(){
        krepo.kisileriyukle()
    }
}
