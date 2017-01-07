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
    
    //@IBOutlet weak var window: NSWindow!
    @IBOutlet weak var dorTime: NSMenu!
    var timer = Timer()
    
    let statusItem = NSStatusBar.system().statusItem(withLength: -1)
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Klinger")
        let icon = NSImage(named: "dorunicorn")!
        icon.isTemplate = true
        
        statusItem.image = icon
        
        let menu = NSMenu()
        let menuItemCopy = NSMenuItem(title: "Copy", action: #selector(self.menuClicked), keyEquivalent: "c")
        menu.addItem(menuItemCopy)
        
        let menuItemQuit = NSMenuItem(title: "Quit", action: #selector(AppDelegate.quit(_:)), keyEquivalent: "q")
        menu.addItem(menuItemQuit)
        
        statusItem.menu = menu
        statusItem.length = NSVariableStatusItemLength
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(AppDelegate.getDorTime)), userInfo: nil, repeats: true)
    }
    
    func menuClicked() {
        let pasteBoard = NSPasteboard.general()
        pasteBoard.clearContents()
        pasteBoard.writeObjects(NSArray(object: statusItem.title!) as! [NSPasteboardWriting])
    }
    
    func quit(_ sender:NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    func getDorTime() {
        var napTimeComp = DateComponents()
        napTimeComp.year = 1821
        napTimeComp.month = 5
        napTimeComp.day = 6
        napTimeComp.hour = 3
        napTimeComp.minute = 14
        napTimeComp.second = 15
        
        var grWiChan = DateComponents()
        grWiChan.year = 1893
        grWiChan.month = 4
        grWiChan.day = 1
        grWiChan.hour = 0
        grWiChan.minute = 6
        grWiChan.second = 32
        
        let napCal = Calendar.current.date(from: napTimeComp)!.addingTimeInterval(0)
        let grWiChanCal = Calendar.current.date(from: grWiChan)!.addingTimeInterval(0)
        
        var dorTime = Int(Date().timeIntervalSince(napCal))
        if NSDate().isGreaterThanOrEqual(to: grWiChanCal) {
            dorTime += 392
        }
        let font = NSFont.monospacedDigitSystemFont(ofSize: 14.0, weight: NSFontWeightRegular)
        let attributedString = NSAttributedString(string: String(dorTime.addSpaceSeparator), attributes: [NSFontAttributeName: font])
        statusItem.attributedTitle = attributedString
    }
}
