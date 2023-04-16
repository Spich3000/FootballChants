//
//  TeamTableViewCell.swift
//  FootballChants
//
//  Created by Дмитрий Спичаков on 13.04.2023.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    static let cellId = "TeamTableViewCell"

    // MARK: - UI
    
    // Create view container
    private lazy var container: UIView = {
      let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    // Kinda HStack, Vstack in one
    private lazy var contentStackView : UIStackView = {
        let stackVwv = UIStackView()
        stackVwv.translatesAutoresizingMaskIntoConstraints = false
        stackVwv.spacing = 4
        stackVwv.axis = .vertical
        return stackVwv
    }()
    
    private lazy var badgeImgVw: UIImageView = {
       let imgVw = UIImageView()
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        imgVw.contentMode = .scaleAspectFit
        return imgVw
    }()
    
    private lazy var playbackBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        return btn
    }()
    
    private lazy var nameLbl: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var foundedLbl: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var jobLbl: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 10, weight: .light)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var infoLbl: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 20, weight: .medium)
        lbl.textColor = .white
        return lbl
    }()
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        container.layer.cornerRadius = 10
    }
    
    func configure() {
        container.backgroundColor = TeamType.arsenal.background
        
        badgeImgVw.image = TeamType.arsenal.badge
        
        playbackBtn.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)), for: .normal)
        
        nameLbl.text = "Arsenal"
        foundedLbl.text = "1800"
        jobLbl.text = "Current manager: Mikel Artera"
        infoLbl.text = "djhfvzkjfvakdjfvbalkjfvbafhjvbashfvafvbav"
        
        self.contentView.addSubview(container) // Added container View into the content view
        
        container.addSubview(contentStackView) // Added stack view into container
        container.addSubview(badgeImgVw)
        container.addSubview(playbackBtn)
        
        // Added labels into stack view
        contentStackView.addArrangedSubview(nameLbl)
        contentStackView.addArrangedSubview(foundedLbl)
        contentStackView.addArrangedSubview(jobLbl)
        contentStackView.addArrangedSubview(infoLbl)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            badgeImgVw.heightAnchor.constraint(equalToConstant: 50),
            badgeImgVw.widthAnchor.constraint(equalToConstant: 50),
            badgeImgVw.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImgVw.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            
            contentStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: badgeImgVw.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playbackBtn.leadingAnchor, constant: -8),
            
            playbackBtn.heightAnchor.constraint(equalToConstant: 40),
            playbackBtn.widthAnchor.constraint(equalToConstant: 40),
            playbackBtn.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8),
            playbackBtn.centerYAnchor.constraint(equalTo: container.centerYAnchor)

        ])

    }
    
}
