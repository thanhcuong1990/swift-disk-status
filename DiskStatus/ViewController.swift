//
//  ViewController.swift
//  DiskStatus
//
//  Created by Cuong Lam on 3/29/15.
//  Copyright (c) 2015 BE Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalView: UIView!
    @IBOutlet var usedLabel: UILabel!
    @IBOutlet var freeLabel: UILabel!
    
    var diskUsedView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.updateDiskStatus()
    }
    
    // MARK: update disk space status
    func updateDiskStatus() {
        usedLabel.text = String(format:NSLocalizedString("Used %@", comment: ""), DiskStatus.usedDiskSpace)
        freeLabel.text = String(format:NSLocalizedString("Free %@", comment: ""), DiskStatus.freeDiskSpace)
        
        let width = CGFloat(Double(DiskStatus.usedDiskSpaceInBytes)/Double(DiskStatus.totalDiskSpaceInBytes)) * self.totalView.bounds.width
        
        diskUsedView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.totalView.bounds.height))
        diskUsedView!.backgroundColor = self.usedLabel.textColor
        self.totalView.addSubview(diskUsedView!)
    }

}
