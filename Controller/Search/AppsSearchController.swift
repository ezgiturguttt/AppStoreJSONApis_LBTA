//
//  AppsSearchController.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 27.04.2023.
//

import UIKit
import SDWebImage

class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellId = "id1234"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel : UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return  label
    }()
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appId = String(appResults[indexPath.item].trackId)
        let appDetailController = AppDetailController(appId: appId)
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        setupSearchBar()
       // fetchITunesApps()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        //searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    //1-Popular our cells with our iTunes api data
    //2-Extract this function fetchITunesApps() outside of this controller file.
    var timer : Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
                if let err = err {
                    print("Failed to fetch apps:", err)
                    return
                }
                self.appResults = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchITunesApps() {
        Service.shared.fetchApps(searchTerm: "twitter") { (res, err) in
            
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            self.appResults = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    // we need to get back our search results somehow.
    //use a completion block
    
    /* let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
     guard let url = URL(string: urlString) else {return}
     
     //fetch data from internet
     URLSession.shared.dataTask(with: url) { (data, resp, err) in
     if let err = err {
     print("Failed to fetch apps:", err)
     return
     }
     //success
     //print(data)
     //print(String(data:data!, encoding: .utf8))
     
     guard let data = data else {return}
     
     do{
     let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
     //searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
     self.appResults = searchResult.results
     DispatchQueue.main.async {
     self.collectionView.reloadData()
     }
     
     } catch let jsonErr {
     print("Failed to decode json:", jsonErr)
     }
     } .resume() //fires off the request */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        //cell.nameLabel.text = "HERE IS MY APP NAME"
        cell.appResult = appResults[indexPath.item]
        return cell
    }
}

