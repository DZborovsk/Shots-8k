//
//  ViewController.swift
//  d03
//
//  Created by Danyil ZBOROVKYI on 6/28/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var image: UIImage = UIImage()
    var imageView: UIImageView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: image)
        scrollView.addSubview(imageView!)
        scrollView.contentSize = (imageView?.frame.size)!
        scrollView.maximumZoomScale = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setZoom() {
        var minZoom = min(self.view.bounds.size.width / imageView!.bounds.size.width, self.view.bounds.size.height / imageView!.bounds.size.height);

        if minZoom > 1.0 {
            minZoom = 1.0
        }
        scrollView.minimumZoomScale = minZoom;
        scrollView.zoomScale = minZoom;
    }

    override func viewWillLayoutSubviews() {
        setZoom()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
