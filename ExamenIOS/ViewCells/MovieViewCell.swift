//
//  MovieViewCellTableViewCell.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class MovieViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!

    func render(movie: Movie) {
        nameLabel.text = movie.Title
        yearLabel.text = movie.Year
        avatarImageView.loadFrom(url: movie.Poster)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.roundCorners(radius: 8)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
