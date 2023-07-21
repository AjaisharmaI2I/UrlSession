//
//  ViewController.swift
//  Session
//
//  Created by Ideas2IT on 19/07/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var sessionVM = SessionViewModel()
    var articals: [Article] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "ArticalTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticalTableViewCell")
        
        sessionVM.fetchAPIResponse { status, articals in
            DispatchQueue.main.async {
                if status{
                    if let articals = articals{
                        self.articals = articals
                    }
                    self.tableView.reloadData()
                }else{
                    
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticalTableViewCell", for: indexPath) as! ArticalTableViewCell
        cell.titleLbl.text = articals[indexPath.row].title
        cell.descriptionLbl.text = articals[indexPath.row].description
        
        let url = URL(string: articals[indexPath.row].urlToImage ?? "")
        let processor = DownsamplingImageProcessor(size: cell.artcialImageView.bounds.size)
        cell.artcialImageView?.kf.setImage(with: url)
//        UIImage(systemName: "person")
        return cell
    }
}

