//
//  DetailViewController.swift
//  BountyList
//
//  Created by 민성홍 on 2021/03/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewMode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimation() {
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation() {
        UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.6,
                               initialSpringVelocity: 2,
                               options: .allowUserInteraction,
                               animations: {
                                self.nameLabel.transform = CGAffineTransform.identity
                                self.nameLabel.alpha = 1
                               }, completion: nil)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                               usingSpringWithDamping: 0.6,
                               initialSpringVelocity: 2,
                               options: .allowUserInteraction,
                               animations: {
                                self.bountyLabel.transform = CGAffineTransform.identity
                                self.bountyLabel.alpha = 1
                               }, completion: nil)
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewMode {
    var bountyInfo : BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
