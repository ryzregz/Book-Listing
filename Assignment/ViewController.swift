
//  Assignment OOP

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var books:BookList=BookList()
    
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    @IBOutlet weak var tableView:UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         activityIndicator.center=self.view.center
         activityIndicator.hidesWhenStopped = true
         activityIndicator.color = UIColor.gray
        self.view.addSubview(self.activityIndicator)
        
        
        
        activityIndicator.startAnimating()
        NotificationCenter.default.addObserver(self, selector: #selector(self.dataUpdated(_:)), name: NSNotification.Name(rawValue: "dataUpdated"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.dataEnded(_:)), name: NSNotification.Name(rawValue: "dataEnded"), object: nil)

        tableView.tableFooterView=UIView()
        
        books.refreshModel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataUpdated(_ notification: NSNotification) {
        
        print("notif")
        
        
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
        
        
        
    }
    
    
    func dataEnded(_ notification: NSNotification) {
        
               DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            
            let alertController = UIAlertController(title: "Alert", message: "Data Ended", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        
        
    }
    @IBAction func refreshData(_ sender: Any) {
        
        
        
        activityIndicator.startAnimating()
        books.refreshModel()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return books.allBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let b = books.allBooks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookCell
        
        cell.title.text = b.title
        
        cell.desc.text = b.description
        
        cell.author.text = b.author
       
            cell.desc.adjustsFontSizeToFitWidth = true;

        
        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }



}

