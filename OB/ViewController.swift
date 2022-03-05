//
//  ViewController.swift
//  OB
//
//  Created by Omar Buendía on 3/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user    = [User]()
    var post    = [Post]()
    var brewery = [Brewery]()
    var movies   = [Movie]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        //fetchUser()
        //fetchPost()
        fetchMovies()
        // Do any additional setup after loading the view.
    }
    
    func setupDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func fetchMovies() {
        
        URLSession.shared.getRequest(url: APIEndpoints.movies, decoding: Raw.self) { [weak self] result in
            switch result {
            case .success(let raw):
                self?.movies = raw.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case  .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func fetchBreweries() {
        
        URLSession.shared.getRequest(url: APIEndpoints.breweries, decoding: [Brewery].self) { [weak self] result in
            switch result {
            case .success(let brewery):
                self?.brewery = brewery
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case  .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    func fetchPost() {
        
        URLSession.shared.getRequest(url: APIEndpoints.posts, decoding: [Post].self) { [weak self] result in
            switch result {
            case .success(let post):
                self?.post = post
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case  .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func fetchUser() {
        
        URLSession.shared.getRequest(url: APIEndpoints.users, decoding: [User].self) {[weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case  .failure(let error):
                print(error)
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate,
                          UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //Movies
        cell.textLabel?.text = "\(movies[indexPath.row].original_title)"
        cell.detailTextLabel?.text = "\(movies[indexPath.row].vote_average)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSeque", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.movie = movies[(tableView.indexPathForSelectedRow?.row)!]
            
        }
    }
}
