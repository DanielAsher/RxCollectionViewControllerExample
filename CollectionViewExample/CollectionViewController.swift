//
//  CollectionViewController.swift
//  CollectionViewExample
//
//  Created by Daniel Asher on 02/03/2017.
//  Copyright © 2017 LEXI LABS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

private let reuseIdentifier = "GameCell"

class CollectionViewController: UICollectionViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        collectionView!.dataSource = nil
        
        let itemSize = CGSize(width: 200, height: 100)
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = itemSize
        items1.bindTo(collectionView!.rx.items(cellIdentifier: reuseIdentifier, cellType: CollectionViewCell.self)) 
        { (row: Int, game: GameInfo, cell: CollectionViewCell) in 
            cell.gameTitle?.text = "\(game.title)"            
        }
        .addDisposableTo(disposeBag)
        
        collectionView!.rx
            .modelSelected(GameInfo.self)
            .subscribe(onNext:  { game in
                print("Tapped `\(game)`")
            })
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
