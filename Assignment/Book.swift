
//  Assignmenent IOS OOP

import Foundation

class Book{
    
    var title=""
    var description=""
    var author=""
    
    
    func parseBookFromDict(dict:[String:Any])->Book{
        
        if let book_title=dict["title"] as? String{
        
            title=book_title
        }
        
        if let book_description=dict["description"] as? String{
            
            description=book_description
        }
        
        if let book_author=dict["author"] as? String{
            
           author=book_author
        }
        
        
        return self
    
    }
    

}
