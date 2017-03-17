//
//  BlueTouchViewController.swift
//  LoadResouse
//
//  Created by zhugy on 2017/3/15.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

import UIKit
import CoreBluetooth


class BlueTouchViewController: UIViewController {

    let searchBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.setTitle("搜索", for: .normal)
        btn.frame = CGRect(x: 50, y: 70, width: 70, height: 35)
        btn.backgroundColor = UIColor.red
        return btn
    }()
    
    let wrightBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("写数据", for: .normal)
        btn.frame = CGRect(x: 200, y: 70, width: 70, height: 35)
        return btn
    }()

    let textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 450 + 200, width: UIScreen.main.bounds.size.width, height: 400))
        textView.backgroundColor = UIColor.white
        textView.textColor = UIColor.red
        return textView
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.white
        view.frame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 450)
        view.tableFooterView = UIView()
        view.separatorStyle = .singleLine
        return view
    }()
    var items: [CBPeripheral] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var center: CBCentralManager!
    var peripheral: CBPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        searchBlueTouch()
        // Do any additional setup after loading the view.
    }
    private func setView() {
        view.addSubview(searchBtn)
        view.addSubview(wrightBtn)
        view.addSubview(tableView)
        view.addSubview(textView)
        tableView.delegate = self
        tableView.dataSource = self
        wrightBtn.addTarget(self, action: #selector(BlueTouchViewController.wrightAction), for: .touchUpInside)
        searchBtn.addTarget(self, action: #selector(BlueTouchViewController.searchBlueTouch), for: .touchUpInside)
    }
    
    @objc func wrightAction() {
//        peripheral.writeValue(<#T##data: Data##Data#>, for: <#T##CBCharacteristic#>, type: <#T##CBCharacteristicWriteType#>)
    }
    
    @objc func searchBlueTouch() {
        print("addClick")
        center = CBCentralManager(delegate: self, queue: nil, options: nil)
        items.removeAll()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "蓝牙"
        view.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if #available(iOS 9.0, *) {
            if center.isScanning == true {
                center.stopScan()
            }
        } else {
            // Fallback on earlier versions
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension BlueTouchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: - 手动链接设备
        let peripheral = items[indexPath.row]
        center.connect(peripheral, options: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 30))
        titleLabel.text = "周边可连接设备"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        return titleLabel
    }
    
    private func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "周边可连接设备"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}

extension BlueTouchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
}

extension BlueTouchViewController: CBCentralManagerDelegate {
    
    //MARK: - 扫描前的准备
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("DidUpdateState")
        switch central.state {
        case .poweredOff:
            print("蓝牙关闭")
        case .poweredOn:
            print("蓝牙一打开")
            center.scanForPeripherals(withServices: nil, options: nil)
        
        default:
            print("异常")
        }
    }
    //MARK: - 扫描到的设备
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("didDiscover")
        if let _ = peripheral.name {
            items.append(peripheral)
        }
    }
    
    //MARK: - 链接成功
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("didConnect")
        
        if peripheral.state == .connected {
            center.stopScan()
            self.peripheral = peripheral
            self.peripheral.delegate = self
            self.peripheral.discoverServices(nil)
            let text: String = "name \(peripheral.name) \n \(peripheral.services)"
            
            textView.text = text
            
            print("已连接")
        } else if peripheral.state == .connecting {
            print("连接中。。。。")
        } else if peripheral.state == .disconnected {
            print("断开连接")
        }
    }
    //MARK: - 链接失败
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("didFailToConnect")
        print(error?.localizedDescription ?? "连接失败")
    }
}

extension BlueTouchViewController: CBPeripheralDelegate {
    func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        print("peripheralDidUpdateName")
    }
    
    //MARK: - 扫描到的服务
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("didDiscoverServices")
        
        if error != nil {
            print(peripheral.name! + error!.localizedDescription)
            return
        }
        
        print("name: -> serivers: -- \(peripheral.name!) -> \(peripheral.services)")
        
        guard let services = peripheral.services else {
            return
        }
        
        for service in services {
            print( service)
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        print("didReadRSSI")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        print("didModifyServices")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor descriptor: CBDescriptor, error: Error?) {
        print("didWriteValueFor")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        print("didUpdateValueFor")
        
    }
    
    //MARK: - 扫描到的服务特征
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("didDiscoverCharacteristicsFor")
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        guard let characteristics = service.characteristics else {
            return
        }
        
        for characteristic in characteristics {
            print(characteristic)
            
//            peripheral.readValue(for: characteristic)
            //MARK: - 订阅特征通知
            peripheral.setNotifyValue(true, for: characteristic)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverIncludedServicesFor service: CBService, error: Error?) {
        print("didDiscoverIncludedServicesFor")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        print("didWriteValueFor")
    }
    
    //MARK: - 订阅的特征改变调用方法
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        print("didUpdateValueFor")
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        if characteristic.uuid.uuidString == "FF06" { //步数
            let stpesDate = characteristic.value!
            let stper = String.init(data: stpesDate, encoding: String.Encoding.utf16)
            
            print("步数：" + stper!)
            
        } else if characteristic.uuid.uuidString == "FF0C" {//电量
            let stpesDate = characteristic.value!
            let stper = String.init(data: stpesDate, encoding: String.Encoding.utf16)
            
            print("电量：" + stper!)
        } else if characteristic.uuid.uuidString == "2A06" { //震动
            peripheral.readValue(for: characteristic)
        } else if characteristic.uuid.uuidString == "FF01" { //设备
            let stpesDate = characteristic.value!
            let stper = String.init(data: stpesDate, encoding: String.Encoding.utf16)
            
            print("设备：" + stper!)
        }
        
        
    }
    //MARK: - 扫描到特征
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        print("didDiscoverDescriptorsFor")
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        if characteristic.uuid.uuidString == "FF06" { //步数
            peripheral.readValue(for: characteristic)
        } else if characteristic.uuid.uuidString == "FF0C" {//电量
            peripheral.readValue(for: characteristic)
        } else if characteristic.uuid.uuidString == "2A06" { //震动
            peripheral.readValue(for: characteristic)
        } else if characteristic.uuid.uuidString == "FF01" { //设备
            peripheral.readValue(for: characteristic)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        print("didUpdateNotificationStateFor")
        if error != nil {
            print(error?.localizedDescription ?? "Error")
            return
        }
        if characteristic.uuid.uuidString == "FF06" { //步数
            peripheral.readValue(for: characteristic)
        } else if characteristic.uuid.uuidString == "FF0C" {//电量
            peripheral.readValue(for: characteristic)
        } else if characteristic.uuid.uuidString == "2A06" { //震动
            peripheral.readValue(for: characteristic)
        } else if characteristic.uuid.uuidString == "FF01" { //设备
            peripheral.readValue(for: characteristic)
        }
        
    }

}
