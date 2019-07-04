//
//  CollectionViewController.swift
//  d03
//
//  Created by Danyil ZBOROVKYI on 6/28/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    var imageList = Images()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CollectionViewCell
        let queue = DispatchQueue.global(qos: DispatchQoS.background.qosClass)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = URL(string: self.imageList.images[indexPath.row].url)
        queue.async {
            if url != nil {
                let data = try? Data(contentsOf: url!)
                if data == nil {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Error", message: "Cannot acces to \(url!)", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        cell.loading.stopAnimating()
                    }
                } else {
                    DispatchQueue.main.async {
                        if cell.loading.isAnimating {
                            UIApplication.shared.isNetworkActivityIndicatorVisible = true
                        }
                        
                        cell.loading.stopAnimating()
                        cell.imageView.image = UIImage(data: data!)
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    }
                }
            }
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ViewController
        let cell = sender! as! CollectionViewCell
        
        if let cellImage = cell.imageView.image {
            viewController.image = cellImage
        } else {
            let alertController = UIAlertController(title: "Error", message: "Cannot acces to this image", preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }

}








