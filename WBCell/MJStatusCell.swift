//
//  MJStatusCell.swift
//  WBCell
//
//  Created by 张天龙 on 2022/12/2.
//

import UIKit

let statusMargin: CGFloat = 10

class MJStatusCell: UITableViewCell {
    
    lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 13.0)
        return nameLabel
    }()
    
    lazy var sourceLabel: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.font = UIFont.systemFont(ofSize: 13.0)
        return sourceLabel
    }()
    
    lazy var vipImageView: UIImageView = {
        let vipImageView = UIImageView()
        vipImageView.translatesAutoresizingMaskIntoConstraints = false
        return vipImageView
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.numberOfLines = 0
        return contentLabel
    }()
    
    lazy var picView: UIImageView = {
        let picView = UIImageView()
        picView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        picView.translatesAutoresizingMaskIntoConstraints = false
        return picView
    }()
    
    var status: MJStatus? {
        didSet {
            
            guard let status = status else {
                return
            }
            
            if let icon = status.icon {
                iconView.image = UIImage(named:icon )
            }else{
                iconView.image = nil
            }
            
            if let vip = status.vip {
                if vip == 1 {
                    nameLabel.textColor = UIColor.orange
                    vipImageView.isHidden = false
                    vipImageView.image = UIImage(named: "vip")
                }else{
                    nameLabel.textColor = UIColor.black
                    vipImageView.isHidden = true
                }
            }else{
                nameLabel.textColor = UIColor.black
                vipImageView.isHidden = true
            }
            nameLabel.text = status.name
            sourceLabel.text = "来自iPhone"
            contentLabel.text = status.text
            if let picture = status.picture {
                picView.isHidden = false
                picView.image = UIImage(named: picture)
            }else{
                picView.isHidden = true
                picView.image = nil
                
            }
            
            if status.cellHeight == 0 {
                layoutIfNeeded()
                if status.picture != nil {
                    status.cellHeight = picView.frame.maxY + statusMargin
                }else{
                    status.cellHeight = contentLabel.frame.maxY + statusMargin
                }
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        selectionStyle = .none
        contentView.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:statusMargin ),
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: statusMargin),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: statusMargin),
            nameLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor)
        ])
        
        contentView.addSubview(sourceLabel)
        NSLayoutConstraint.activate([
            sourceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            sourceLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor)
        ])
        
        contentView.addSubview(vipImageView)
        NSLayoutConstraint.activate([
            vipImageView.leadingAnchor.constraint(equalTo: sourceLabel.trailingAnchor, constant: statusMargin),
            vipImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -statusMargin),
            vipImageView.widthAnchor.constraint(equalToConstant: 15),
            vipImageView.heightAnchor.constraint(equalToConstant: 15),
            vipImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor)
        ])
        
        contentView.addSubview(contentLabel)
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: statusMargin),
            contentLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: statusMargin),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -statusMargin)
            
        ])
        
        contentView.addSubview(picView)
        
        NSLayoutConstraint.activate([
            picView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: statusMargin),
            picView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: statusMargin),
            picView.widthAnchor.constraint(equalToConstant: 90),
            picView.heightAnchor.constraint(equalToConstant: 90),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
