//
//  CompDetailsVC.swift
//  Sportily
//
//  Created by Romin Dhameliya on 25/07/19.
//  Copyright © 2019 Romin Dhameliya. All rights reserved.
//

import UIKit

class CompDetailsVC: UIViewController,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrView: UIScrollView!
    @IBOutlet weak var roundCollectionView: UICollectionView!
    @IBOutlet weak var leaderboardTblView: UITableView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var screenTitleLbl: UILabel!
    @IBOutlet weak var detailsLbl: ExpandableLabel!
    
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerviewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    
    var statusHeight = UIApplication.shared.statusBarFrame.size.height//Statusbar height
    let scrollTopEdgeInsets:CGFloat = 200//scrollView Top insets size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrView.delegate = self
        scrView.layer.cornerRadius = 25
        scrView.layer.masksToBounds = true
        scrView.contentInset = UIEdgeInsets(top: scrollTopEdgeInsets, left: 0, bottom: 0, right: 0)
        
        roundCollectionView.delegate = self
        roundCollectionView.dataSource = self
        
        leaderboardTblView.delegate = self
        leaderboardTblView.dataSource = self
        
        //Set Expandable Lable
        let numberofline = 2
        detailsLbl.shouldCollapse = true
        detailsLbl.setLessLinkWith(lessLink: "View Less", attributes: [.foregroundColor:UIColor(red: 66/255, green: 67/255, blue: 106/255, alpha: 1)], position: nil)
        detailsLbl.textReplacementType = ExpandableLabel.TextReplacementType.character
        detailsLbl.numberOfLines =  UIScreen.main.bounds.height >= 768 ? numberofline * 2 : numberofline
        detailsLbl.collapsed = true
        detailsLbl.text = "The 2019 AFL season starts on Thursday 21st of March with the tradition richmond versus carlton blockbuster. The season will run from Round 1 starting this week through 23 weeks of exciting football concluding on Saturday"
        
        //set headerview height
        headerviewHeightConstraint.constant = headerviewHeightConstraint.constant + statusHeight + 44
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tblHeightConstraint.constant = self.leaderboardTblView.contentSize.height
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let minHeight:CGFloat = 50
        let maxHeight:CGFloat = 250+minHeight
        let yPos = scrView.contentOffset.y
        let newHeaderViewHeight = (maxHeight - yPos)-(maxHeight-minHeight)
        let tempNewHeaderViewHeight = (maxHeight - yPos)-(maxHeight-minHeight)
        let titleValue = newHeaderViewHeight-minHeight
        
        //set screen title alpha value
        if(titleValue > 0){
            let finalValue = titleValue*100/scrollTopEdgeInsets
            let alphaValue = finalValue/100
            screenTitleLbl.alpha = 1-alphaValue
        }
        
        //manage header height constraint
        if (newHeaderViewHeight > maxHeight) {
            headerviewHeightConstraint.constant = (max(tempNewHeaderViewHeight, maxHeight)+(minHeight/2))+statusHeight
        } else {
            headerviewHeightConstraint.constant = (max(newHeaderViewHeight, minHeight)+(minHeight/2))+statusHeight
        }
    }
    
    
    // MARK: - CollectionView Data Set
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundCollectionCell", for: indexPath) as! RoundCollectionCell
        return cell
    }
    
    // MARK: - TableView Data Set
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTblCell", for: indexPath) as! LeaderboardTblCell
        return cell
    }
    
     // MARK: - ExpandableLabel
    func willExpandLabel(_ label: ExpandableLabel) {
        
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        
    }
    func shouldCollapseLabel(_ label: ExpandableLabel) -> Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

class RoundCollectionCell:UICollectionViewCell
{
    
}

class LeaderboardTblCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = 5
    }
}
