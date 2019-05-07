//
//  ViewController.swift
//  BookListApp
//
//  Created by Steve JobsOne on 2/15/19.
//  Copyright © 2019 MobioApp Limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var bookList = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.makeAPICallForBooks()
        self.getBookList()
    }
    
    func getBookList() {
        let book1 = Book(name:"SAM EN JULIA", author:"HET MUIZENHUIS", cover:"image1.jpg", info:"Details information here")
        let book2 = Book(name:"CABARET", author:"HET LACHENDEBOEK", cover:"image2.jpg", info:"Details information here")
        let book3 = Book(name:"GESCHREVEN PORTRETTEN", author:"BOCKENWEEK", cover:"image3.jpg", info:"Details information here")
        let book4 = Book(name:"The GOOD THiEF’s GUIDE to AMSTERDAM", author:"CHRiS EWAN", cover:"image4.jpg", info:"Details information here")
        let book5 = Book(name:"SPEAK DUTCH", author:"VINCENT NOOT", cover:"image5.jpg", info:"Details information here")
        
        self.bookList = [book1, book2, book3, book4, book5]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! TableViewCell
        
        let book = self.bookList[indexPath.row]
        cell.coverView.image = UIImage(named:book.cover!)
        cell.bookName.text = book.name!
        cell.authorName.text = book.author!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetails", sender: indexPath)
    }
    
    func makeAPICallForBooks() {
        if(Reachability.isConnectedToNetwork()) {
            //let apiLink1 = "https://www.booknomads.com/en/dev"
            let apiLink2 = "https://app.swaggerhub.com/apis/BookNomads/book_by_isbn/1.0.0"
            let url = NSURL(string: apiLink2)
            let request = NSURLRequest(url: url! as URL)
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
                guard error == nil else {return}
                guard let data = data else {return}
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] {
                        print(json)
                    }
                } catch let error {
                    print("error : \(error.localizedDescription)")
                }
            });
            // do whatever you need with the task e.g. run
            task.resume()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? IndexPath {
            print(indexPath.row)
            if segue.identifier == "ShowDetails" {
                let detailsViewController:DetailsViewController = segue.destination as! DetailsViewController
                let book = self.bookList[indexPath.row]
                detailsViewController.book = book
            }
        }
    }
}

