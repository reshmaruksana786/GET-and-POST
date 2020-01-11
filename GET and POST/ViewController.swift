//
//  ViewController.swift
//  GET and POST
//
//  Created by Syed.Reshma Ruksana on 8/29/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   var URLReqObj:URLRequest!
   var dataTaskObj:URLSessionDataTask!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getActorsName()
        
        getQuotes()
        
        getIndiaDetails()
        
        getPulseDetails()
        
        getAttendanceDetails()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //ACTORS NAMES
    
    func getActorsName()
    {
        URLReqObj = URLRequest(url:URL(string:"https://www.brninfotech.com/tws/Quotes.php")!)
        URLReqObj.httpMethod = "POST"
        
        var dataToSend = "type=actors&quantity=10"
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (Data, ConnectionDetails, err) in
            print("Got Data From Server")
            
            do{
                var convertData = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments)as![String]
                print(convertData)
                
            }
            catch
            {
                print("something went wrong")

            }
        })
        dataTaskObj.resume()
        
    }
    
    //QUOTES
    
    func getQuotes()
    {
        URLReqObj = URLRequest(url:URL(string:"https://www.brninfotech.com/tws/Quotes.php")!)
        URLReqObj.httpMethod = "POST"
        
        var dataToSend = "type=quotes&quantity=10"
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (Data, ConnectionDetails, err) in
            print("Got Data From Server")
            
            do{
                var convertData = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments)as![String]
                print(convertData)
                
            }
            catch
            {
                print("something went wrong")
                
            }
        })
        dataTaskObj.resume()
        
    }
    
    //INDIA DETAILS
    
    func getIndiaDetails()
    {
        URLReqObj = URLRequest(url:URL(string:"https://www.brninfotech.com/tws/IndiaDetails.php?type=states&quantity=30")!)
        
        URLReqObj.httpMethod = "GET"
        
       // var dataToSend = "type=states/cities&quantity=10"
       // URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
       dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (Data, ConnectionDetails, err) in
            print("Got Data From Server")
            
            do{
                var convertData = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments)as![String]
                print(convertData)
                
            }
            catch
            {
                print("something went wrong")
                
            }
        })
        dataTaskObj.resume()
        
    }
    
    //PULSE DETAILS
    
    func getPulseDetails()
    {
        URLReqObj = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        
        URLReqObj.httpMethod = "POST"
        
        var dataToSend = "registeredEmail=reshmasmile468@gmail.com&registeredPassword=ruksi468&funcName=verifyLogin"
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (Data, ConnectionDetails, err) in
            print("Got Data From Server")
            
            do{
                var convertData = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String,Any>
                print(convertData)
                
            }
            catch
            {
                print("something went wrong")
                
            }
        })
        dataTaskObj.resume()
        
    }
    
    //ATTENDANCE DETAILS
    
    func getAttendanceDetails()
    {
        URLReqObj = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
        
        URLReqObj.httpMethod = "POST"
        
        var dataToSend = "funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (Data, ConnectionDetails, err) in
            print("Got Data From Server")
            
            do{
                var convertData = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.allowFragments)as! Array<Any>
                print(convertData)
                
            }
            catch
            {
                print("something went wrong")
                
            }
        })
        dataTaskObj.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

