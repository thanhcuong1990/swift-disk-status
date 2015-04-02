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
    
    var diskUsedView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.updateDiskStatus()
    }
    
    // MARK: update disk space status
    func updateDiskStatus() {
        usedLabel!.text = String(format:NSLocalizedString("Used %@", comment: ""), DiskStatus.usedDiskSpace)
        freeLabel!.text = String(format:NSLocalizedString("Free %@", comment: ""), DiskStatus.freeDiskSpace)
        
        var frame:CGRect = self.totalView!.frame
        frame.size.width = CGFloat(Double(DiskStatus.usedDiskSpaceInBytes)/Double(DiskStatus.totalDiskSpaceInBytes)) * frame.size.width
        
        diskUsedView = UIView(frame: frame)
        diskUsedView!.backgroundColor = self.usedLabel.textColor
        self.view!.addSubview(diskUsedView!)
    }

}

