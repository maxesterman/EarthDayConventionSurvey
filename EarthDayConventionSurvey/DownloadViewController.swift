//
//  DownloadViewController.swift
//  EarthDayConventionSurvey
//
//  Created by Max Sterman on 4/16/17.
//  Copyright © 2017 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class DownloadViewController: UIViewController {
    
    var ourViewers: [AnyObject]?
    let mathExperience: [Int:String]=[1:"Pre-Algebra", 2:"Algebra", 3:"Pre-Calc", 4:"Calc", 5:"More"]

    
    //this is the managedObjectContext from Eric Chown
    let newManagedObjectContext: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext
    
    @IBAction func downloadingViewers(_ sender: UIButton) {
        
        //http://www.justindoan.com/tutorials/2016/9/9/creating-and-exporting-a-csv-file-in-swift
        let ourFile="EarthDayData.txt"
        let ourPath=URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(ourFile)
        let ourData=exportingString()
        do{
            try ourData.write(to: ourPath, atomically: true, encoding: String.Encoding.utf8)
        } catch{
            print("Failed to create file")
            print("\(error)")
        }
        
        let ourViewController=UIActivityViewController(activityItems: [ourPath], applicationActivities: [])
        ourViewController.popoverPresentationController?.sourceView = self.view
        present(ourViewController, animated: true, completion: nil)
    }
    

    var number=0
    
    //function to get all the Users who haven't been matched or rejected (just simply rejected)
    //and put them in an array
    fileprivate func getAllTheObjects() {
        if let thisContext = newManagedObjectContext{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Viewer")
                let newUsers = try? thisContext.fetch(request)
                ourViewers=newUsers as! [AnyObject]
        }
    }
    
    

    func exportingString() -> String{
        getAllTheObjects()
        var lectureLength: Int?
        var lectureSatNumber: Int?
        var lectureViewingExperienceNumber: Int?
        var comments:String?
        var activities:String?
        var gender: String?
        
        
        var export: String = NSLocalizedString("interesting, challenging, math level, most liked, activity improvement, gender \n", comment: "")
        let sameExport=export
        export=""
        export+=sameExport
       // if (ourViewers != nil) && (ourViewers?.enumerate() != nil){
        print("Lets Go")
        var i=0
        if (ourViewers != nil){
            
            for viewer in ourViewers!{
                //if index < ourViewers!.count-1{
                    if let thisViewer = viewer as? Viewer{
                        i += 1
                        print(i)
                        lectureLength = thisViewer.value(forKey: "lectureLength") as? Int
                        lectureViewingExperienceNumber = thisViewer.value(forKey: "lectureViewingExperienceNumber") as? Int
                        lectureSatNumber = thisViewer.value(forKey: "lectureSatNumber") as? Int
                        comments = thisViewer.value(forKey: "comments") as? String
                        activities = thisViewer.value(forKey: "activities") as? String
                        gender = thisViewer.value(forKey: "gender") as? String
                        
                        var amountOfMath=""
                        
                        if let mathLevel=lectureLength{
                            amountOfMath=mathExperience[mathLevel]!
                        }
                        else{
                            amountOfMath="None"
                            
                        }
                        let viewingExperienceComment="\(lectureViewingExperienceNumber!)" ?? "None"
                        let satComment = "\(lectureSatNumber!)" ?? "None"
                        let commentsComments = comments ?? "None"
                        let activitiesComments = activities ?? "None"
                        let genderComments = gender ?? "None"
                        
                        if (commentsComments != "curling4everGoPistolPete") && (commentsComments != "hi"){
                            export += satComment + "," + viewingExperienceComment + "," + amountOfMath + "," + commentsComments + "," + activitiesComments + "," + genderComments + "\n"
                            print("this is the comment")
                            print(amountOfMath)
                        }
                        else{
                            print("didn't go through")
                        }
                        
                        print("currentExport")
                        print(export)
                        //print("currentIndex")
                        //print(index)
                        
                    //}
                }
            }
        }
        
        print(export)
        return export
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
