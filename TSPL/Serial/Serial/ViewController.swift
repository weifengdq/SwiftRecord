//
//  ViewController.swift
//  Serial
//
//  Created by 刘尊 on 2017/7/4.
//  Copyright © 2017年 刘尊. All rights reserved.
//

//import Cocoa
//
//class ViewController: NSViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override var representedObject: Any? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }
//
//
//}

import Cocoa

class ViewController: NSViewController, ORSSerialPortDelegate, NSUserNotificationCenterDelegate {
    
    let serialPortManager = ORSSerialPortManager.shared()
    let availableBaudRates = [300, 1200, 2400, 4800, 9600, 14400, 19200, 28800, 38400, 57600, 115200, 230400, 460800]
    var shouldAddLineEnding = false
    
    var serialPort: ORSSerialPort? {
        didSet {
            oldValue?.close()
            oldValue?.delegate = nil
            serialPort?.delegate = self
        }
    }
    
    @IBOutlet weak var sendTextField: NSTextField!
    @IBOutlet weak var receiveDataTextView: NSScrollView!
    @IBOutlet weak var openCloseButton: NSButton!
    
    
//    override init() {
//        super.init(coder:)
//        let nc = NotificationCenter.default
//        nc.addObserver(self, selector: #selector(serialPortsWereConnected(_:)), name: NSNotification.Name.ORSSerialPortsWereConnected, object: nil)
//        nc.addObserver(self, selector: #selector(serialPortsWereDisconnected(_:)), name: NSNotification.Name.ORSSerialPortsWereDisconnected, object: nil)
//        NSUserNotificationCenter.default.delegate = self
//    }
    
//    init(style: NSViewController, reuseIdentifier: String?) {
//        super.init(nibName: style, bundle: reuseIdentifier)
//        self.setup()
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setup()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    
    convenience init() {
        self.init()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(serialPortsWereConnected(_:)), name: NSNotification.Name.ORSSerialPortsWereConnected, object: nil)
        nc.addObserver(self, selector: #selector(serialPortsWereDisconnected(_:)), name: NSNotification.Name.ORSSerialPortsWereDisconnected, object: nil)
        
        NSUserNotificationCenter.default.delegate = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func send(_ sender: Any) {
        var string = self.sendTextField.stringValue
        if !string.hasSuffix("\n") {
            string += "\n"
        }
        if let data = string.data(using: String.Encoding.utf8) {
            self.serialPort?.send(data)
        }
    }
    
    
//    let serialPort = ORSSerialPort(path: "/dev/cu.KeySerial1")
//    serialPort.baudRate = 4800
//    serialPort.open()
//    serialPort.sendData(someData) // someData is an NSData object
//    serialPort.close() // Later, when you're done with the port
    
    
    @IBAction func openClosePort(_ sender: Any) {
        if let port = self.serialPort {
//            port = ORSSerialPort(path: "/dev/tty.SLAB_USBtoUART")!
//            port.baudRate = 115200
            
            if (port.isOpen) {
                port.close()
            } else {
                port.open()
                let textView: NSTextView = self.receiveDataTextView.documentView as! NSTextView
                textView.textStorage?.mutableString.setString("")
            }
            
        }
    }
    
    
    //
    //    @IBOutlet weak var sendTextField: NSTextField!
    //    @IBOutlet var receivedDataTextView: NSTextView!
    //    @IBOutlet weak var openCloseButton: NSButton!
    //    @IBOutlet weak var lineEndingPopUpButton: NSPopUpButton!
    //    var lineEndingString: String {
    //        let map = [0: "\r", 1: "\n", 2: "\r\n"]
    //        if let result = map[self.lineEndingPopUpButton.selectedTag()] {
    //            return result
    //        } else {
    //            return "\n"
    //        }
    //    }
    //
    
    
    
    //
    //    // MARK: - Actions
    //
    //    @IBAction func send(_: AnyObject) {
    //        var string = self.sendTextField.stringValue
    //        if self.shouldAddLineEnding && !string.hasSuffix("\n") {
    //            string += self.lineEndingString
    //        }
    //        if let data = string.data(using: String.Encoding.utf8) {
    //            self.serialPort?.send(data)
    //        }
    //    }
    //
    //    @IBAction func openOrClosePort(_ sender: AnyObject) {
    //        if let port = self.serialPort {
    //            if (port.isOpen) {
    //                port.close()
    //            } else {
    //                port.open()
    //                self.receivedDataTextView.textStorage?.mutableString.setString("");
    //            }
    //        }
    //    }
    //
    
    
    
    // MARK: - ORSSerialPortDelegate
    
    func serialPortWasOpened(_ serialPort: ORSSerialPort) {
        self.openCloseButton.title = "Close"
    }
    
    func serialPortWasClosed(_ serialPort: ORSSerialPort) {
        self.openCloseButton.title = "Open"
    }
    
    func serialPort(_ serialPort: ORSSerialPort, didReceive data: Data) {
        if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
            let textView: NSTextView = self.receiveDataTextView.documentView as! NSTextView
            textView.textStorage?.mutableString.append(string as String)
            self.receiveDataTextView.needsDisplay = true
        }
    }
    
    func serialPortWasRemovedFromSystem(_ serialPort: ORSSerialPort) {
        self.serialPort = nil
        self.openCloseButton.title = "Open"
    }
    
    func serialPort(_ serialPort: ORSSerialPort, didEncounterError error: Error) {
        print("SerialPort \(serialPort) encountered an error: \(error)")
    }
    
    // MARK: - NSUserNotifcationCenterDelegate
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, didDeliver notification: NSUserNotification) {
        let popTime = DispatchTime.now() + Double(Int64(3.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: popTime) { () -> Void in
            center.removeDeliveredNotification(notification)
        }
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    
    // MARK: - Notifications
    
    func serialPortsWereConnected(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let connectedPorts = userInfo[ORSConnectedSerialPortsKey] as! [ORSSerialPort]
            print("Ports were connected: \(connectedPorts)")
            self.postUserNotificationForConnectedPorts(connectedPorts)
        }
    }
    
    func serialPortsWereDisconnected(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let disconnectedPorts: [ORSSerialPort] = userInfo[ORSDisconnectedSerialPortsKey] as! [ORSSerialPort]
            print("Ports were disconnected: \(disconnectedPorts)")
            self.postUserNotificationForDisconnectedPorts(disconnectedPorts)
        }
    }
    
    func postUserNotificationForConnectedPorts(_ connectedPorts: [ORSSerialPort]) {
        let unc = NSUserNotificationCenter.default
        for port in connectedPorts {
            let userNote = NSUserNotification()
            userNote.title = NSLocalizedString("Serial Port Connected", comment: "Serial Port Connected")
            userNote.informativeText = "Serial Port \(port.name) was connected to your Mac."
            userNote.soundName = nil;
            unc.deliver(userNote)
        }
    }
    
    func postUserNotificationForDisconnectedPorts(_ disconnectedPorts: [ORSSerialPort]) {
        let unc = NSUserNotificationCenter.default
        for port in disconnectedPorts {
            let userNote = NSUserNotification()
            userNote.title = NSLocalizedString("Serial Port Disconnected", comment: "Serial Port Disconnected")
            userNote.informativeText = "Serial Port \(port.name) was disconnected from your Mac."
            userNote.soundName = nil;
            unc.deliver(userNote)
        }
    }
}
