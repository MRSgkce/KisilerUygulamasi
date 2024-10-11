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

        veritabanikopyala()
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
    
    func veritabanikopyala(){//ezbere bişi kopyalama için veri tabanından
        let bundleyolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakyer = URL(fileURLWithPath:hedefYol).appendingPathComponent("rehber.sqlite")
        let fileManager=FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakyer.path)
        {
            print("zaten veritabanı var")
        }else{
                do{
                    try fileManager.copyItem(atPath: bundleyolu!, toPath: kopyalanacakyer.path)
                }catch{
                    
                }
            }
        
    }
}
