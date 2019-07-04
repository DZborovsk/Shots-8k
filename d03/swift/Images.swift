//
//  Images.swift
//  d03
//
//  Created by Danyil ZBOROVKYI on 6/28/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import Foundation

class Images {
    var images: [Image] = []
    
    init() {
        let image1 = Image()
        let image2 = Image()
        let image3 = Image()
        let image4 = Image()
        
        image1.url = "https://hdqwalls.com/wallpapers/godzilla-king-of-the-monsters-8k-m7.jpg"
        image2.url = "https://images.alphacoders.com/848/848559.jpg"
        image3.url = "https://hdqwalls.com/download/snow-mountains-landscape-panamoric-clouds-8k-k9-7680x4320.jpg"
        image4.url = "https://c4.wallpaperflare.com/wallpaper/11/4/890/clouds-8k-arizona-rocks-wallpaper-486c4e7227a6e4f0d4b5710f84f6cd87.jpg"
        
        images.append(image1)
        images.append(image2)
        images.append(image3)
        images.append(image4)
    }
    
    
    
}
