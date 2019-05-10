//
//  DetailCategoryViewController.swift
//  LiveWallpapers
//
//  Created by Mahdi Boukhris on 09/05/2019.
//  Copyright © 2019 salaheddine. All rights reserved.
//

import UIKit
import FSPagerView
class DetailCategoryViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate  {
	
	
	
	
	func numberOfItems(in pagerView: FSPagerView) -> Int {
		return categoryArray.count
	}
	
	func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
		
		let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "DetailCategoryViewControllerCell", at: index) as! DetailCategoryViewControllerCell
		let category = categoryArray[index]
		
		if let image = category.image {
			cell.mImageView.image = UIImage(named: image)
		}
		
		return cell
	}
	
	
	
	var pagerView:FSPagerView!
	var categoryArray = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		

		let width = UIScreen.main.bounds.width
		let height = UIScreen.main.bounds.height
		
		
		
		// Create a pager view
		pagerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: width, height: height))
		pagerView.dataSource = self
		pagerView.delegate = self
		pagerView.transformer = FSPagerViewTransformer(type: .overlap)
		pagerView.isInfinite = true
		
		let H = height - height * 0.3
		pagerView.itemSize = CGSize(width: width - 32, height: H)
		
		pagerView.register(UINib(nibName: "DetailCategoryViewControllerCell", bundle: nil), forCellWithReuseIdentifier: "DetailCategoryViewControllerCell")
		self.view.addSubview(pagerView)
		
		
		categoryArray.append(Category(title: "anime", image: "anime1"))
		categoryArray.append(Category(title: "Animal", image: "animal1"))
		categoryArray.append(Category(title: "Birds", image: "birds1"))
		categoryArray.append(Category(title: "Games", image: "game1"))
		categoryArray.append(Category(title: "Winter", image: "winter1"))
		
		
    }
    

   

}



