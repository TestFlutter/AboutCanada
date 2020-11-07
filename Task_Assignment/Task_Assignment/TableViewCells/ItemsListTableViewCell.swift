//
//  ItemsListTableViewCell.swift
//  Task_Assignment
//
//  Created by Manikanta on 07/11/20.
//

import UIKit

class ItemsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleName: UILabel! {
        didSet {
            titleName.backgroundColor = .clear
            titleName.font = UIFont.boldSystemFont(ofSize: 18)
        }
    }
    
    @IBOutlet weak var descriptionName: UILabel! {
        didSet {
            descriptionName.backgroundColor = .clear
            descriptionName.textColor = .gray
        }
    }
    
    @IBOutlet weak var bannerImageView: UIImageView! {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupItemsinCells(itemsModel: Content) {
        titleName.text = itemsModel.title
        descriptionName.text = itemsModel.description
        
        if itemsModel.imageHref != nil {
            do {
                let imageUrl1 = URL(string: itemsModel.imageHref!)!
                let imageData1 = try Data(contentsOf: imageUrl1)
                let firstImage = UIImage(data: imageData1)
                bannerImageView.image = firstImage
            } catch let parsingError {
                print("Error", parsingError)
            }
     
        } else {
            bannerImageView.image = UIImage(named: "Canada_Maple")
        }
    }
    
}
