//
//  XSTestListViewController.swift
//  SuperDemo-Swift
//
//  Created by SUN on 2024/1/13.
//

import UIKit

class XSTestListViewController: XSListViewController<TestUser, XSTestListViewModel, XSTestListTableViewCell> {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0))
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
