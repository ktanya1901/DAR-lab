//
//  ViewController.swift
//  HW-instagram-tables
//
//  Created by Tatyana Korotkova on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        //print(sender.tag)
        if (postsData[sender.tag].liked == false) {
            sender.setImage(UIImage(named:"liked"), for: .normal)
            postsData[sender.tag].liked = true
        }
        else if (postsData[sender.tag].liked == true) {
            sender.setImage( UIImage(named:"notliked"), for: .normal)
            postsData[sender.tag].liked = false
        }
    }
    var storiesData: [Story] = [Story(storyImage: "avatar1", storyLabel: "login1"), Story(storyImage: "avatar2", storyLabel: "login2"), Story(storyImage: "avatar3", storyLabel: "login3"), Story(storyImage: "avatar4", storyLabel: "login4"), Story(storyImage: "avatar5", storyLabel: "login5"), Story(storyImage: "avatar6", storyLabel: "login6"), Story(storyImage: "avatar7", storyLabel: "login7")]
    
    var postsData: [Post] = [
        Post(login: "login1", userLogo: "male", userPost: "wood", liked: false),
        Post(login: "login2", userLogo: "female", userPost: "sunflower", liked: true),
        Post(login: "login3", userLogo: "male", userPost: "lake", liked: true),
        Post(login: "login4", userLogo: "female", userPost: "water", liked: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Instagram"
        // Do any additional setup after loading the view.t
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! InstagramStoriesCell
        cell.storiesCellView.image = UIImage(named: storiesData[indexPath.row].storyImage)
        cell.storiesLabel.text = storiesData[indexPath.row].storyLabel
        cell.storiesLabel.font = UIFont.boldSystemFont(ofSize: 12)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 134, height: 156)
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! InstagramPostCell
        let row = indexPath.row
        cell.avatarLabel.text = postsData[row].login
        cell.avatarLabel.font = UIFont.boldSystemFont(ofSize: 12)
        cell.avatarImageView.image = UIImage(named: postsData[row].userLogo)
        cell.postImageView.image = UIImage(named: postsData[row].userPost)
        cell.commentButton.setImage(UIImage(named: "comment"), for: .normal)
        cell.likeButton.tag = indexPath.row
        cell.sendButton.setImage(UIImage(named: "send"), for: .normal)
        if(postsData[row].liked == true){
            cell.likeButton.setImage(UIImage(named: "liked"), for: .normal)
        }
        else{
            cell.likeButton.setImage(UIImage(named: "notliked"), for: .normal)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height*0.55
    }
    
    
}

