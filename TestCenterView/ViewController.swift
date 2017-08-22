//
//  ViewController.swift
//  TestCenterView
//
//  Created by truongtvd on 8/22/17.
//  Copyright © 2017 truongtvd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        return cell
    }
    
    func checkVisibilityOf(_ cell: CustomCell, in aScrollView: UIScrollView) {
        let cellRect: CGRect = aScrollView.convert(cell.frame, to: aScrollView.superview)

        if aScrollView.frame.contains(cellRect) {
            cell.notifyCompletelyVisible()
        }
        else {
            cell.notifyNotCompletelyVisible()
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let cells: [CustomCell] = tableView.visibleCells as! [CustomCell]
        let cellCount: Int = cells.count
        if cellCount == 0 {
            return
        }
        // Check the visibility of the first cell
        checkVisibilityOf(cells.first!, in: scrollView)
        if cellCount == 1 {
            return
        }
        // Check the visibility of the last cell
        checkVisibilityOf(cells.last!, in: scrollView)
        if cellCount == 2 {
            return
        }
        // All of the rest of the cells are visible: Loop through the 2nd through n-1 cells

        for i in 1..<cellCount - 1 {
            cells[i].notifyCompletelyVisible()
            
        }

        
    }
}

