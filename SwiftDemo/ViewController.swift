//
//  ViewController.swift
//  SwiftDemo
//
//  Created by sunchao on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {

    let lineSpacing: CGFloat = 1.0
    let lnteritemSpacing: CGFloat = 1.0
    let columns: Int = 3
    let titleList = ["日付", "名前", "記事"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUserView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateUserView()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        
        if let label = cell.viewWithTag(10086) as? UILabel {
            switch index / self.columns {
            case 0:
                label.text = self.titleList[index]
            default:
                label.text = String(indexPath.item + 1)
            }
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = Int(UIScreen.main.bounds.width)
        let spacingCount = self.columns - 1
        let spacingWidth = Int(self.lineSpacing)
        let remaining = CGFloat(screenWidth - spacingCount * spacingWidth)
        
        let index = indexPath.item + 1
        switch index % self.columns {
        case 0:
            return CGSize(width: remaining * 0.5 , height: 50)
        case 1:
            return CGSize(width: remaining * 0.2 , height: 50)
        case 2:
            return CGSize(width: remaining * 0.3 , height: 50)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.lnteritemSpacing
    }
}

private extension ViewController {
    
    func loadUserView() {
        // nothing to do
    }
    
    func updateUserView() {
        // nothing to do
    }
}
