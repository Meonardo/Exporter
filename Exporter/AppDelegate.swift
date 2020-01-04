//
//  AppDelegate.swift
//  Exporter
//
//  Created by Meonardo on 2020/1/2.
//  Copyright © 2020 Meonardo. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	var window: NSWindow!


	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
		// Add `@Environment(\.managedObjectContext)` in the views that will need the context.
		let contentView = WindowView()

		// Create the window and set the content view. 
		window = NSWindow(
		    contentRect: NSRect(x: 0, y: 0, width: 480, height: 320),
			styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView, .borderless],
		    backing: .buffered, defer: false)
		window.center()
		window.setFrameAutosaveName("Main Window")
		window.titleVisibility = .hidden
		window.titlebarAppearsTransparent = true
		window.backgroundColor = .windowBackgroundColor
		window.isOpaque = false
		window.contentView = NSHostingView(rootView: contentView)
		window.makeKeyAndOrderFront(nil)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	// MARK: - Data Saving and Undo support

	@IBAction func saveAction(_ sender: AnyObject?) {
		
	}
	
	func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
	    return .terminateNow
	}
}

