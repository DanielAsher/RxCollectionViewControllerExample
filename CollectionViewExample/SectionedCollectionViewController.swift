//
//  SectionedCollectionViewController.swift
//  CollectionViewExample
//
//  Created by Daniel Asher on 02/03/2017.
//  Copyright © 2017 LEXI LABS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

private let reuseIdentifier = "GameCell"

struct GameSection {
    var header: String
    var items: [Item]
}
extension GameSection : SectionModelType {
    typealias Item = GameInfo
    
    var identity: String {
        return header
    }
    
    init(original: GameSection, items: [Item]) {
        self = original
        self.items = items
    }
}

class SectionedCollectionViewController: UICollectionViewController {

    var disposeBag = DisposeBag()
   
    var dataSource: RxCollectionViewSectionedReloadDataSource<GameSection>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        collectionView!.dataSource = nil

        let dataSource = RxCollectionViewSectionedReloadDataSource<GameSection>()
 
        dataSource.configureCell = { ds, cv, ip, game in
            let cell = cv.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: ip) as! CollectionViewCell
            cell.gameTitle?.text = "\(game.title)"
            return cell
        }
        
        dataSource.supplementaryViewFactory = { (ds ,cv, kind, ip) in
            let section = cv.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Section", for: ip) as! GameHeaderCollectionReusableView
            
            section.headerTitle!.text = "\(ds[ip.section].header)"
            
            return section
        }        
        let sections = [
            GameSection(header: "First section", items: games1),
            GameSection(header: "Second section", items: games2)
        ]
        
        Observable.just(sections)
            .bindTo(collectionView!.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//    
//        // Configure the cell
//    
//        return cell
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
