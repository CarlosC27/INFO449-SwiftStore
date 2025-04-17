//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String {
        get
    }
    func price() -> Int
}

class Item: SKU {
    let name: String
    private let priceEach: Int
    
    init(name: String, priceEach: Int){
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int{
        return priceEach
    }
}

class Receipt {
    private var scannedItems: [SKU] = []

    func add(_ item: SKU){
        scannedItems.append(item)
    }
    
    func subtotal() -> Int{
        return scannedItems.reduce(0) {$0 + $1.price()}
    }
    
    func output() -> String{
        var recieptText = "Receipt:\n"
        for item in scannedItems {
            let dollars = Double(item.price()) / 100
            recieptText += "\(item.name): $\(String(format: "%.2f", dollars))\n"
        }
        recieptText += "------------------\n"
        recieptText += "TOTAL: $\(String(format: "%.2f", Double(subtotal()) / 100))"
        return recieptText
    }
    
    func clear(){
        scannedItems.removeAll()
    }
    
    func total() -> Int{
        return subtotal()
    }
}

class Register {
    private var receipt: Receipt
    
    init(){
        self.receipt = Receipt()
    }
    
    func scan(_ item: SKU){
        receipt.add(item)
    }
    
    func subtotal() -> Int{
        return receipt.subtotal()
    }
    
    func total() -> Receipt{
        let currentReceipt = receipt
        self.receipt = Receipt()
        return currentReceipt
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

