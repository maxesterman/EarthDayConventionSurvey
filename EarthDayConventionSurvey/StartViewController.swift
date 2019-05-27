//
//  StartViewController.swift
//  EarthDayConventionSurvey
//
//  Created by Max Sterman on 4/11/17.
//  Copyright © 2017 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class StartViewController: UIViewController {

    

     
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     
        if(segue.identifier == "Starting Survey"){
            managedObjectContext?.perform(){
     
            //creates a new user
            let viewer = NSEntityDescription.insertNewObject(forEntityName: "Viewer", into: self.managedObjectContext!)
     
     
            //sets the values for the user
            viewer.setValue("curling4everGoPistolPete", forKey: "comments")
            viewer.setValue("curling4everGoPistolPete", forKey: "activities")
            viewer.setValue("curling4everGoPistolPete", forKey: "gender")
            viewer.setValue(1, forKey: "lectureLength")
            viewer.setValue(1, forKey: "lectureSatNumber")
            viewer.setValue(1, forKey: "lectureViewingExperienceNumber")
                
                


     
            if let survey=segue.destination as? ViewController{
                survey.viewerObject=viewer
                survey.objectContext=self.managedObjectContext
            }

            }
        }
    }
 


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
