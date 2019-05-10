//
//  ViewController.swift
//  LiveWallpapers
//
//  Created by Mahdi Boukhris on 09/05/2019.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var mCollectionView: UICollectionView!
	
	var categoryArray = [Category]()
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categoryArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	
		let main = UIStoryboard(name: "Main", bundle: nil)
		let vc = main.instantiateViewController(withIdentifier: "DetailCategoryViewController") as! DetailCategoryViewController
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		
		let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoryCollectionViewCell
		
		let category = categoryArray[indexPath.row]
		
		if let image = category.image {
			cell.mImageView.image = UIImage(named: image)
		}
		
		if let title = category.title {
			cell.mTitleLabel.text = title
		}

		return cell
	}
	
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		categoryArray.append(Category(title: "anime", image: "anime1"))
		categoryArray.append(Category(title: "Animal", image: "animal1"))
		categoryArray.append(Category(title: "Birds", image: "birds1"))
		categoryArray.append(Category(title: "Games", image: "game1"))
		categoryArray.append(Category(title: "Winter", image: "winter1"))
		
		
	}
	
	
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
			return 0
		}
	
	
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
			return 0
		}


}





struct Category {
	
	var title:String?
	var image:String?
	
	
}
