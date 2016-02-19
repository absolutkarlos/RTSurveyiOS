//
//  principalTableViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/9/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class principalTableViewController: UITableViewController {

    @IBOutlet var tabla: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if (g.ud.stringForKey("Token") == nil)
        {
            let login = self.storyboard!.instantiateViewControllerWithIdentifier("login") as! loginViewController
            self.presentViewController(login, animated: true, completion: nil)
            //self.navigationController?.pushViewController(login, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celdaPrincipal", forIndexPath: indexPath) as! celdasPrincipalTableViewCell
        
       
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Me seleccionarion",indexPath.row)
        // Start segue with index of cell clicked
        performSegueWithIdentifier("bloqueDetalle", sender: self)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "bloqueDetalle" {
            print("preparando segue")
            // get a reference to the second view controller
            //let secondViewController = segue.destinationViewController as! detalleSlideViewController
            
            // set a variable in the second view controller with the data to pass
            //secondViewController.receivedCellIndex = chosenCellIndex
        }
    }

 
}
