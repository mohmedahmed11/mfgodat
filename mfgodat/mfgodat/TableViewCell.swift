//
//  TableViewCell.swift
//  mfgodat
//
//  Created by iMac on 2018/12/16.
//  Copyright © 2018 numberOne. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    var mainImageView : UIImageView  = {
        var imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var title : UILabel = {
        var titleLable = UILabel(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLable
    }()
    
    var dateLabel : UILabel = {
        var dateLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return dateLabel
    }()
    
    var locationLabel : UILabel = {
        var locationLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return locationLabel
    }()
    
   
    
    
    var foundView : UIView = {
        var foundView = UIView()
        foundView.translatesAutoresizingMaskIntoConstraints = false
        
        return foundView
    }()
    
    var foundViewImage : UIImageView = {
        var foundViewImage = UIImageView()
        foundViewImage.translatesAutoresizingMaskIntoConstraints = false
        return foundViewImage
    }()
    
    var foundTitle : UILabel = {
        var foundTitle = UILabel(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        foundTitle.translatesAutoresizingMaskIntoConstraints = false
        
        return foundTitle
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // setup image layout to table view cell
        self.addSubview(mainImageView)
        self.addSubview(title)
        self.addSubview(dateLabel)
        self.addSubview(locationLabel)
        self.addSubview(foundView)
        foundView.addSubview(foundViewImage)
        foundView.addSubview(foundTitle)

        
        mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        
        title.rightAnchor.constraint(equalTo: mainImageView.leftAnchor, constant: -10).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        title.font = .systemFont(ofSize: 14)
       
        dateLabel.rightAnchor.constraint(equalTo: mainImageView.leftAnchor, constant: -10).isActive = true
        dateLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    
        locationLabel.rightAnchor.constraint(equalTo: mainImageView.leftAnchor, constant: -10).isActive = true
        locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        locationLabel.font = .systemFont(ofSize: 12)
        locationLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        
        foundView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        foundView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        foundView.leftAnchor.constraint(equalTo: self.leftAnchor ,constant: 10) .isActive = true
        foundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30) .isActive = true
        foundView.layer.cornerRadius = 4
        
        
        foundViewImage.widthAnchor.constraint(equalTo: foundView.widthAnchor, multiplier: 0.3).isActive = true
        foundViewImage.heightAnchor.constraint(equalTo: foundView.heightAnchor, multiplier: 0.9).isActive = true
        foundViewImage.leftAnchor.constraint(equalTo: foundView.leftAnchor ,constant: 5) .isActive = true
        foundViewImage.topAnchor.constraint(equalTo: foundView.topAnchor, constant: 1) .isActive = true
     
        
        foundTitle.heightAnchor.constraint(equalTo: foundView.heightAnchor, multiplier: 0.9).isActive = true
        foundTitle.rightAnchor.constraint(equalTo: foundView.rightAnchor ,constant: -5) .isActive = true
        foundTitle.topAnchor.constraint(equalTo: foundView.topAnchor, constant: 1) .isActive = true
        foundTitle.font = .systemFont(ofSize: 12)
        foundTitle.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
