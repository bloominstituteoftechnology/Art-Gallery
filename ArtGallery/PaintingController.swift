//
//  PaintingController.swift
//  ArtGallery
//
//  Created by Dillon McElhinney on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingController {
    private(set) var paintings: [Painting] = []
    
    init() {
        loadPaintingsFromAssets()
    }
    
    func loadPaintingsFromAssets() {
        for i in 1...12 {
            let string = "Image\(i)"
            guard let image = UIImage(named: string) else { return }
            let painting = Painting(image: image)
            paintings.append(painting)
        }
    }
    
    func toggleIsLiked(for painting: Painting) {
        guard let index = paintings.index(of: painting) else { return }
        paintings[index].isLiked = !paintings[index].isLiked
    }
}
