//
//  ViewController.swift
//  Task_Assignment
//
//  Created by Manikanta on 06/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let itemListTableEstimatedHeight: CGFloat = 170.0
    var itemTableView: UITableView!
    
    var contentModel: [Content]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ViewControllerUtils().showActivityIndicator(uiView: self.view)
        fetchJSONData()
        
    }
    
    func setupTableView() {
        itemTableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        itemTableView!.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        itemTableView!.dataSource = self
        itemTableView!.delegate = self
        itemTableView.separatorStyle = .none
        itemTableView.allowsSelection = false
        self.view.addSubview(itemTableView!)
    }
    
    func registerNib() {
        itemTableView.register(UINib(nibName: "ItemsListTableViewCell", bundle: nil), forCellReuseIdentifier: "listItemCellIdentifier")
    }
    
    func fetchJSONData() {
        ResponseManager.callItemsList { (success) in
            if !success.isEmpty {
                 self.contentModel = ResponsiveSingleton.shared.responseContentModel
                
                DispatchQueue.main.async {
                    self.title = success
                     self.setupTableView()
                     self.registerNib()
                    ViewControllerUtils().hideActivityIndicator(uiView: self.view)
                }
            }
        }
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return itemListTableEstimatedHeight
    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return itemListTableEstimatedHeight
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentModel!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItemCellIdentifier") as? ItemsListTableViewCell
        cell?.setupItemsinCells(itemsModel: (self.contentModel?[indexPath.row])!)
        return cell!
        
    }
}
