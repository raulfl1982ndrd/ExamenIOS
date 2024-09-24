//
//  DetailViewController.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    var movie: Movie? = nil
    var movieimdbID: MovieResponseimdbID? = nil
    var imdbID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let movie = movie{
           // searchMoviebyimdbID(imdbID: movie.imdbID)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 /*
    func searchMoviebyimdbID(imdbID : String){
        Task {
            let results = try? await MovieProvider.findMovieByimdbID(imdbID)
            if let results = results{
                //print(results.count)
                self.movieimdbID = results
            }else{
                print("LIsta de Peliculas Vacia")
                self.movieimdbID = nil
            }
            /*
            DispatchQueue.main.async {
                self.tableView.reloadData()
                // Dismiss the refreshControl
                self.tableView.refreshControl?.endRefreshing()
            }*/
        }
        

        
    }*/
}
