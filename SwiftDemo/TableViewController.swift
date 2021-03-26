//
//  TableViewController.swift
//  SwiftDemo
//
//  Created by sunchao on 2021/3/26.
//

import UIKit

class TableViewController: UITableViewController {

    var dataList = ["大連市", "だいれん-し/ダーリェン-し、中国語: 大连市、英語: Dalian / Dairen City、旧名:ダルニー市、英語: Dalniy City", "中華人民共和国遼寧省の南部に位置し、中国五つの「計画単列都市」の一つで、15個の「副省級都市」の一つである。中国東北地方随一の港口・工業・観光都市であるのみならず、中国政府指定の東北アジア国際航運センターかつ、東北アジアの有数の国際金融・交通・物流センターである。"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadUserView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateUserView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        if let label = cell.viewWithTag(10086) as? UILabel {
            label.text = self.dataList[index]
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.dataList.remove(at: indexPath.row)
            tableView.endUpdates()
        }
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let data = self.dataList.remove(at: fromIndexPath.row)
        self.dataList.insert(data, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

private extension TableViewController {
    
    func loadUserView() {
        self.clearsSelectionOnViewWillAppear = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.tableHeaderView = UIView()
        self.tableView.tableFooterView = UIView()
    }
    
    func updateUserView() {
        // nothing to do
    }
}
