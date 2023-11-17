//
//  Service.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 9.05.2023.
//

import Foundation

class Service {
    static let shared = Service() //singleton object
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
             
    }
    
    func fetchTopApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchApplePodcasts(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/podcasts/top/50/podcasts.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    
    //helper
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "http://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // declare my generic json fuction here
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        //print("T is type:", T.self)
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            //print(String(data: data!, encoding: .utf8))
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                //print(appGroup.feed.results)
                //success
                //appGroup.feed.results.forEach({print($0.name)})
                completion(objects, nil)
            } catch {
                completion(nil, error)
                // print("Failed to decode:", error)
            }
        }.resume() //this will fire your request
    }
}
    
    // Stack
    
    // Generic is to declare the Type later on
    
    class Stack<T: Decodable> {
        var items = [T]()
        func push(item: T) { items.append(item) }
        func pop() -> T? { return items.last }
    }
    
    /* class Stack<T> {
     var items = [T]()
     func push(item: T) { items.append(item) }
     func pop() -> T? { return items.last }
     } */
    
    import UIKit
    
    func dummyFunc() {
        // let stackOfImages = Stack<UIImage>()
        
        let stackOfStrings = Stack<String>()
        stackOfStrings.push(item: "THIS HAS TO BE A STRING")
        
        let stackOfInts  = Stack<Int>()
        stackOfInts.push(item: 1)
    }

