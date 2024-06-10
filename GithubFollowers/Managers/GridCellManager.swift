//
//  GridCellManager.swift
//  GithubFollowers
//
//  Created by Ivan on 21.05.2024.
//

import UIKit

class GridCellManager: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var userNameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "GHFollowerUserPhoto")
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubViews(views: [
            collectionView,
            userNameLabel
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: userNameLabel.topAnchor),
            
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
}


//```swift
//extension PictureGridCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // Number of pictures
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath)
//        // Configure cell with picture and name
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // Size for each item in the grid
//    }
//}
//```
//
//### Step 3: Implement `UITableViewDataSource` and `UITableViewDelegate`
//
//Finally, implement the `UITableViewDataSource` and `UITableViewDelegate` methods in your view controller to populate the `UITableView` with the custom cells.
//
//```swift
//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Number of rows
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureGridCell", for: indexPath) as PictureGridCell
//        // Configure cell with data
//        return cell
//    }
//}
//```
//
//Make sure to register your custom cell with the `UITableView` in the `viewDidLoad` method of your view controller:
//
//```swift
//tableView.register(PictureGridCell.self, forCellReuseIdentifier: "PictureGridCell")
//```
//
//This approach allows you to create a grid of pictures within each cell of a vertically scrolling `UITableView`, achieving the desired layout programmatically without using storyboards.
