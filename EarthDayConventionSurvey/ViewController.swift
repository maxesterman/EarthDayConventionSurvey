//
//  ViewController.swift
//  EarthDayConventionSurvey
//
//  Created by Max Sterman on 4/10/17.
//  Copyright © 2017 Max Sterman. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var viewerObject: NSManagedObject?
    
    var objectContext: NSManagedObjectContext?
    
    
    @IBAction func lectureSatisfaction(_ sender: UISegmentedControl) {
        if let ourViewer = viewerObject as? Viewer{
            switch sender.selectedSegmentIndex {
                case 0:
                    ourViewer.setValue(1, forKey: "lectureSatNumber")

            
                case 1:
                    ourViewer.setValue(2, forKey: "lectureSatNumber")


                case 2:
                    ourViewer.setValue(3, forKey: "lectureSatNumber")
                case 3:
                    ourViewer.setValue(4, forKey: "lectureSatNumber")
                case 4:
                    ourViewer.setValue(5, forKey: "lectureSatNumber")

            
            
            default:
                break
        }
        }
        
    }

    @IBAction func viewingExperience(_ sender: UISegmentedControl) {
        if let ourViewer = viewerObject as? Viewer{
            switch sender.selectedSegmentIndex {
                case 0:
                    ourViewer.setValue(1, forKey: "lectureViewingExperienceNumber")
                    print(Int(ourViewer.lectureViewingExperienceNumber!))
            
                case 1:
                    ourViewer.setValue(2, forKey: "lectureViewingExperienceNumber")
                    print(Int(ourViewer.lectureViewingExperienceNumber!))
            
                case 2:
                    ourViewer.setValue(3, forKey: "lectureViewingExperienceNumber")
                    print(Int(ourViewer.lectureViewingExperienceNumber!))

                case 3:
                    ourViewer.setValue(4, forKey: "lectureViewingExperienceNumber")
                    print(Int(ourViewer.lectureViewingExperienceNumber!))

                case 4:
                    ourViewer.setValue(5, forKey: "lectureViewingExperienceNumber")
                    print(Int(ourViewer.lectureViewingExperienceNumber!))

            
            
            
                default:
                    break
            }
        }
        
    }
    
    
    @IBAction func sceneExperience(_ sender: UISegmentedControl) {
        if let ourViewer = viewerObject as? Viewer{
            switch sender.selectedSegmentIndex {
            case 0:
                ourViewer.setValue(1, forKey: "lectureLength")
                print(Int(ourViewer.lectureLength!))

            
            case 1:
                ourViewer.setValue(2, forKey: "lectureLength")
                print(Int(ourViewer.lectureLength!))

            
            case 2:
                ourViewer.setValue(3, forKey: "lectureLength")
                print(Int(ourViewer.lectureLength!))

            case 3:
                ourViewer.setValue(4, forKey: "lectureLength")
                print(Int(ourViewer.lectureLength!))

            case 4:
                ourViewer.setValue(5, forKey: "lectureLength")
                print(Int(ourViewer.lectureLength!))

            
            
            
            default:
                break
            }
        }
    }
    

    @IBOutlet weak var peoplesComments: UITextView!
    
    var thisCommentsText=""
    
    var commentsText: String{
        get{
            return peoplesComments.text!
        }
        set{
            thisCommentsText=newValue
        }
    }
    
    
    @IBOutlet weak var activities: UITextView!
    
    
    var thisActivitiesText=""
    
    var activitiesText: String{
        get{
            return activities.text!
        }
        set{
            thisActivitiesText=newValue
        }
    }
    
    @IBOutlet weak var gender: UITextView!
    
    var thisGenderText=""
    
    var genderText: String{
        get{
            return gender.text!
        }
        set{
            thisGenderText=newValue
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Submit"){
            
            if let thisViewer=viewerObject as? Viewer{

                if(commentsText != "Comments" && commentsText != ""){
                    thisViewer.setValue(commentsText, forKey: "comments")
                }
                else{
                    thisViewer.setValue("None", forKey: "comments")
                }

                if(activitiesText != "Comments" && activitiesText != ""){
                    thisViewer.setValue(activitiesText, forKey: "activities")
                }
                else{
                    thisViewer.setValue("None", forKey: "activities")
                }
                
                if(genderText != "Comments" && genderText != ""){
                    thisViewer.setValue(genderText, forKey: "gender")
                }
                else{
                    thisViewer.setValue("None", forKey: "gender")
                }
                
                do {
                    try self.objectContext?.save()
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                print(commentsText)
            }
            //sends over the user to the main view controller
            //if let mainMenu=segue.destinationViewController as? ThankYouViewController{
              //  print("hello")
            //}
        }
        
    }

    
/*    {
        if let ourViewer = viewerObject as? Viewer{
            ourViewer.setValue(self.peoplesComments,forKey: "comments")
        }
    }
  */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

