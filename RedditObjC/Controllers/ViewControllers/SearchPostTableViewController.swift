//
//  SearchPostTableViewController.swift
//  RedditObjC
//
//  Created by Tatiana Bondarenko on 7/14/22.
//

import UIKit

class SearchPostTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var posts: [Post] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let post = posts[indexPath.row]
        
        cell.post = post

        return cell
    }
}

extension SearchPostTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        PostController.sharedInstance()?.searchForPosts(withSearchTerm: searchTerm) { (posts, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let posts = posts else { return }
            self.posts = posts
        }
    }
}
