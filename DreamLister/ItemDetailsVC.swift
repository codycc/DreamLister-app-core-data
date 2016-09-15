//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Cody Condon on 2016-09-15.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Getting rid of the title beside back arrow on the navigation bar when on item details view
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        
        let store = Store (context: context)
        store.name = "Best Buy"
        let store1 = Store (context: context)
        store1.name = "Tesla DealerShip"
        let store2 = Store (context: context)
        store2.name = "Electronics Store"
        let store3 = Store (context: context)
        store3.name = "Target"
        let store4 = Store (context: context)
        store4.name = "Amazon"
        let store5 = Store (context: context)
        store5.name = "K mart"
        
        ad.saveContext()
        getStores()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name 
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //update when selected
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            // handle the error
        }
    }
    
   
}
