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
    let db: FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniurl = URL(fileURLWithPath:hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniurl.path)
    }
    
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
       
        //kisileriListesi.onNext(kisilerListesi)
        
        db?.open()
        var liste = [Kisiler]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while rs.next(){
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id"))!
                                   , kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
            kisileriListesi.onNext(liste)
        }catch {
            print(error.localizedDescription)
            
        }


        db?.close()
    }
    
    
    
}
