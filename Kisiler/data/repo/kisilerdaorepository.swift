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
        
        print("kisileri yukle")
       
        //kisileriListesi.onNext(kisilerListesi)
        
        db?.open()
        
        
        do{
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
            
            
        }catch {
            print(error.localizedDescription)
            
        }


        db?.close()
    }
    
    
    
        
    
    
    func guncelle(kisi_id:Int, kisi_ad:String,kisi_tel:String){
        
        print("kisi kaydet: \(kisi_ad) \(kisi_tel)  \(kisi_id)")
        
        db?.open()
        
        
        do{
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ? ", values: [kisi_ad,kisi_tel,kisi_id])
            
            
        }catch {
            print(error.localizedDescription)
            
        }


        db?.close()
        
    }
    
    func sil(kisi_id:Int){
        
       print("kişisil: \(kisi_id)")
        
        db?.open()
        
        
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ? ", values: [kisi_id])
            kisileriyukle()
            
            
        }catch {
            print(error.localizedDescription)
            
        }


        db?.close()
        
    }
        
    
    
    
    
    
    func ara(aramakelimesi : String){
        print("kişi ara: \(aramakelimesi) ")
        
        db?.open()
        var liste = [Kisiler]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad LIKE '%\(aramakelimesi)%' ", values: nil)
            
            while rs.next(){
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id"))!
                                   , kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
            kisileriListesi.onNext(liste)//tetikleme
        }catch {
            print(error.localizedDescription)
            
        }


        db?.close()
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
