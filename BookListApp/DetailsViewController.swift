//
//  DetailsViewController.swift
//  BookListApp
//
//  Created by Steve JobsOne on 2/15/19.
//  Copyright © 2019 MobioApp Limited. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var book: Book?
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var detailsInfo: UITextView!
    @IBOutlet weak var coverView: UIImageView!
    
    @IBAction func crossbtnListener(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.bookName.text = self.book!.name
        self.authorName.text = self.book!.author
        self.detailsInfo.text = self.book!.deatailsInfo
        self.coverView.image = UIImage(named:self.book!.cover!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
}
