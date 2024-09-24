//
//  ViewController.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieList: [Movie] = []
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup SearchBar
        let search = UISearchController(searchResultsController: nil)//SearchBarViewController()
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        // Do any additional setup after loading the view.
        //Setup TableView
        tableView.dataSource = self

        searchMovies("Mat")
        configureRefreshControl()
    }
    // MARK: TableView Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieViewCell
        
        let movie = movieList[indexPath.row]
        
        cell.render(movie: movie)
        
        return cell
    }
    // MARK: Pull to refresh
    
    func configureRefreshControl(){
        // Add the
        tableView.refreshControl = UIRefreshControl()
        tableView?.refreshControl?.addTarget(self, action: #selector(handleredfreshController), for: .valueChanged)
    }
    
    @objc func handleredfreshController(){
        searchMovies("a")
    }
    
    
    // MARK: SearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("He pulsado Buscar")
        searchMovies(searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("He pulsado Cancelar")
        searchMovies("a")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("He escrito \(searchText)")
        
        if(searchText.isEmpty){
            searchMovies("a")
        }
        
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            let viewController = segue.destination as! DetailViewController

            let indexPath = tableView.indexPathForSelectedRow!

            viewController.movie = movieList[indexPath.row]

            tableView.deselectRow(at: indexPath, animated: false)
        }
    }

    // MARK: Business Logic
    func searchMovies(_ query:String){
        print("Buscando Pelicula")

        Task {
            let results = try? await MovieProvider.findMoviesByName(query)
            if let results = results{
                print(results.count)
                self.movieList = results
            }else{
                print("LIsta de Peliculas Vacia")
                self.movieList = []
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                // Dismiss the refreshControl
                self.tableView.refreshControl?.endRefreshing()
            }
        }
        
    }
}
