//
//  ViewController.swift
//  DreamLister
//
//  Created by Cody Condon on 2016-09-14.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit
import CoreData


class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    //
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        //generateTestData()
        attemptFetch()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // creating the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        // pass into configure cell function
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    // passing info into configure cell function in custom class
    func configureCell(cell:ItemCell, indexPath: NSIndexPath) {
        let item  = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if there is sections
        if let sections = controller.sections {
            // grab the info out of the section
            let sectionInfo = sections[section]
            //count them and thats the number
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // height of cell
        return 150
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    
    
    func attemptFetch() {
        // what item to fetch
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        // sort these based on time stamp
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        //perform the sort action
        fetchRequest.sortDescriptors = [dateSort]
        
        //creating the controller
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.controller = controller
        
        // go fetch item 
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    //whenever the tableView is about to update, this will start to listen for changes and will handle that for you
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // this is going to be listening for when we make a change, whether its insertion, deletion modification etc.. swtich
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                // when we update, itll go through the configure cell function once again and update results
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = indexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    func generateTestData() {
        let item = Item(context: context)
        item.title = "Macbook Pro"
        item.price = 1800
        item.details = "I cant wait until the september event"
        
        let item2 = Item(context: context)
        item2.title = "Bose Headphones"
        item2.price = 300
        item2.details = "these are awesome headphones"
        
        let item3 = Item(context: context)
        item3.title = "Tesla Model s"
        item3.price = 110000
        item3.details = "What a nice car so beautiful "
        ad.saveContext()
    }
    
    
    


}

