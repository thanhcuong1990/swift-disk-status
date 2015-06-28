//
//  DiskStatus.swift
//  DiskStatus
//
//  Created by Cuong Lam on 3/29/15.
//  Copyright (c) 2015 BE Studio. All rights reserved.
//
import UIKit

class DiskStatus {
    
    //MARK: Formatter MB only
    class func MBFormatter(bytes: Int64) -> String {
        var formatter = NSByteCountFormatter()
        formatter.allowedUnits = NSByteCountFormatterUnits.UseMB
        formatter.countStyle = NSByteCountFormatterCountStyle.Decimal
        formatter.includesUnit = false
        return formatter.stringFromByteCount(bytes) as String
    }
    
    
    //MARK: Get String Value
    class var totalDiskSpace:String {
        get {
            return NSByteCountFormatter.stringFromByteCount(totalDiskSpaceInBytes, countStyle: NSByteCountFormatterCountStyle.Binary)
        }
    }
    
    class var freeDiskSpace:String {
        get {
            return NSByteCountFormatter.stringFromByteCount(freeDiskSpaceInBytes, countStyle: NSByteCountFormatterCountStyle.Binary)
        }
    }
    
    class var usedDiskSpace:String {
        get {
            return NSByteCountFormatter.stringFromByteCount(usedDiskSpaceInBytes, countStyle: NSByteCountFormatterCountStyle.Binary)
        }
    }
    
    
    //MARK: Get raw value
    class var totalDiskSpaceInBytes:Int64 {
        get {
            let systemAttributes = NSFileManager.defaultManager().attributesOfFileSystemForPath(NSHomeDirectory() as String, error: nil)
            let space = (systemAttributes?[NSFileSystemSize] as? NSNumber)?.longLongValue
            return space!
        }
    }
    
    class var freeDiskSpaceInBytes:Int64 {
        get {
            let systemAttributes = NSFileManager.defaultManager().attributesOfFileSystemForPath(NSHomeDirectory() as String, error: nil)
            let freeSpace = (systemAttributes?[NSFileSystemFreeSize] as? NSNumber)?.longLongValue
            return freeSpace!
        }
    }
    
    class var usedDiskSpaceInBytes:Int64 {
        get {
            let usedSpace = totalDiskSpaceInBytes - freeDiskSpaceInBytes
            return usedSpace
        }
    }
    
}
