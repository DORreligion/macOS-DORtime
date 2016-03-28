//
//  AppDelegate.swift
//  DORtime
//
//  Created by Lukas Schramm on 04.10.15.
//  Copyright © 2015 Lukas Schramm. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var dorTime: NSMenu!
    var timer = NSTimer()
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "dorunicorn")!
        icon.template = true
        
        statusItem.image = icon
        statusItem.menu = dorTime
        statusItem.length = NSVariableStatusItemLength
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: (#selector(AppDelegate.getDorTime)), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func menuClicked(sender: NSMenuItem) {
        let pasteBoard = NSPasteboard.generalPasteboard()
        pasteBoard.clearContents()
        pasteBoard.writeObjects(NSArray(object: statusItem.title!) as! [NSPasteboardWriting])
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        exit(0)
    }
    
    func getDorTime() {
        let napTimeComp = NSDateComponents()
        napTimeComp.year = 1821
        napTimeComp.month = 5
        napTimeComp.day = 6
        napTimeComp.hour = 3
        napTimeComp.minute = 14
        napTimeComp.second = 15
        
        let grWiChan = NSDateComponents()
        grWiChan.year = 1893
        grWiChan.month = 4
        grWiChan.day = 1
        grWiChan.hour = 0
        grWiChan.minute = 6
        grWiChan.second = 32
        
        let napCal = NSCalendar.currentCalendar().dateFromComponents(napTimeComp)!.dateByAddingTimeInterval(0)
        let grWiChanCal = NSCalendar.currentCalendar().dateFromComponents(grWiChan)!.dateByAddingTimeInterval(0)
        
        var dorTime = Int(NSDate().timeIntervalSinceDate(napCal))
        if NSDate().isGreaterThanOrEqualTo(grWiChanCal) {
            dorTime += 392
        }
        let font = NSFont.monospacedDigitSystemFontOfSize(14.0, weight: NSFontWeightRegular)
        let attributedString = NSAttributedString(string: String(dorTime.addSpaceSeparator), attributes: [NSFontAttributeName: font])
        statusItem.attributedTitle = attributedString
    }
    
}