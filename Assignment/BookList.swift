
//Assignmenent IOS OOP

import Foundation

class BookList{

    var allBooks=[Book]()
    
    var counter = 0
    
    func refreshModel(){
        
        var request = URLRequest(url: URL(string: "https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?api-key=cb04f712479c42abb0b78f0c4cae377a")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue("cb04f712479c42abb0b78f0c4cae377a", forHTTPHeaderField: "Www-Authenticate")
        
        session.dataTask(with: request) {data, response, err in
            print("Server Responded")
            print(response)
            if(err != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    
                    self.parseResponse(json: json)
                    
                    
                    
                }catch let error as NSError{
                    print(error)
                }
                
            }
            
            }.resume()
        
        
        
    }
    
    
    func parseResponse(json:[String:Any]) {
        
        if let status = json["status"] as? String{
            
            if status == "OK" {
            
                if let data = json["results"] as? [[String:Any]]{
                    
                    allBooks.removeAll()
                    
                    for i in 0..<data.count{
                        
                        let bk = Book()
                        
                       allBooks.append(bk.parseBookFromDict(dict: data[i]))
                    
                    }
                    
                    print(allBooks)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dataUpdated"), object: nil, userInfo: nil)

                    
                
                }
                
              
            }else{
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dataEnded"), object: nil, userInfo: nil)
            
            }
        
        }
        
    }
    
}
