//
//  sklep_restApp.swift
//  sklep-rest
//
//  Created by kprzystalski on 18/01/2021.
//

import SwiftUI
import CoreData

@main
struct sklep_restApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        loadFromAPI()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

extension sklep_restApp {
    
    func loadFromAPI() {
        let context = persistenceController.container.viewContext
        let serverURL = "https://2ee0-195-82-45-217.eu.ngrok.io"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let KUrl = URL(string: serverURL+"/Kategoria.json")
        let KRequest = URLRequest(url: KUrl!)
        
        let kategoriaEntity = NSEntityDescription.entity(forEntityName: "Kategoria", in: context)
        
        let KTask = session.dataTask(with: KRequest, completionHandler: { (data, response, error) in
            
            guard error == nil else {
                print("Houston mamy problem")
                return
            }
            
            guard data != nil else {
                print("Nie ma danych")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let object = json as? [String:Any] {
                    print(object)
                } else if let object = json as? [Any] {
                    for item in object as! [Dictionary<String, AnyObject>] {
                        let title = item["title"] as! String
                        let server_id = item["id"] as! String
                        
                        let kategoria = NSManagedObject(entity: kategoriaEntity!, insertInto: context)
                        
                        kategoria.setValue(title, forKey: "title")
                        kategoria.setValue(server_id, forKey: "server_id")
                        
                        print("Dodano kategorię: \(title) o id: \(server_id)")
                    }
                    try context.save()
                } else {
                    print("Błędny JSON")
                }
                
            } catch {
                print("Problem z pobraniem odpowiedzi")
                return
            }
        })
        KTask.resume()
        
        let PUrl = URL(string: serverURL+"/Produkt.json")
        let PRequest = URLRequest(url: PUrl!)
        
        let produktEntity = NSEntityDescription.entity(forEntityName: "Produkt", in: context)
        
        let PTask = session.dataTask(with: PRequest, completionHandler: { (data, response, error) in
            
            guard error == nil else {
                print("Houston mamy problem")
                return
            }
            
            guard data != nil else {
                print("Nie ma danych")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let object = json as? [String:Any] {
                    print(object)
                } else if let object = json as? [Any] {
                    for item in object as! [Dictionary<String, AnyObject>] {
                        let desc = item["desc"] as! String
                        let image_url = item["image_url"] as! String
                        let quantity = item["quantity"] as! Int16
                        let title = item["title"] as! String
                        
                        let produkt = NSManagedObject(entity: produktEntity!, insertInto: context)
                        
                        produkt.setValue(desc, forKey: "desc")
                        produkt.setValue(image_url, forKey: "image_url")
                        produkt.setValue(quantity, forKey: "quantity")
                        produkt.setValue(title, forKey: "title")
                        
                    }
                    try context.save()
                } else {
                    print("Błędny JSON")
                }
                
            } catch {
                print("Problem z pobraniem odpowiedzi")
                return
            }
        })
        PTask.resume()
    }
}
