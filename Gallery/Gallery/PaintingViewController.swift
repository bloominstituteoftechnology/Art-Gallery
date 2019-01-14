//
//  ViewController.swift
//  Gallery
//
//  Created by Nelson Gonzalez on 1/14/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController {
    
    let paintingModel = PaintingModel()
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        var i : Int = 1
        while(i <= 12){
           
            paintingModel.paintings.append(Painting(image: UIImage(named: "Image\(i)"), isLiked: false))
            i+=1
        }
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

}

extension PaintingViewController: UITableViewDelegate, UITableViewDataSource, PaintingTableViewCellDelegate {
    
    
    func tappedLikeButton(on cell: PaintingTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let painting = paintingModel.paintings[indexPath.row]
        
        paintingModel.toggleIsLiked(for: painting)
        
        tableView.reloadRows(at: [indexPath], with: .none)
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingModel.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "galleryCell", for: indexPath)
        
       guard let galleryCell = cell  as? PaintingTableViewCell else { return cell }
        
        let gallery = paintingModel.paintings[indexPath.row]
        
        
        galleryCell.painting = gallery
        galleryCell.delegate = self
        return galleryCell
    }
    
    
}
