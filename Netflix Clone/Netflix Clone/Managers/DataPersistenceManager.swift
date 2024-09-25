//
//  DataPersistenceManager.swift
//  Netflix Clone
//
//  Created by constantine Walker on 25.09.24.
//

import UIKit
import CoreData

class DataPersistenceManager {
    
    
    enum DatabaseError: Error {
        case failedToSaveData, failedToFetch, failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitle(with model: Title, completion: @escaping (Result<Void,DatabaseError>) -> ()){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        item.id = Int64(model.id)
        item.original_title = model.original_title
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.vote_count = Int64(model.vote_count)
        item.release_date = model.release_date
        item.vote_average = model.vote_average
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print("DEBUG: could not save item in code - \(error.localizedDescription)")
            completion(.failure(.failedToSaveData))
        }
        
    }
    
    func fetchingTitlesFromCore(completion: @escaping (Result<[TitleItem], DatabaseError>) -> ()) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<TitleItem>
        
        request = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(.failedToFetch))
        }
    }
    
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, DatabaseError>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(.failedToDeleteData))
        }
        
    }
}
