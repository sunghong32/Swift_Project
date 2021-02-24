import UIKit
import SwiftSoup

class ViewController: UIViewController {
    var datalist = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        crawl()
    }
}

struct Team {
    var name : Elements
    var stat : [Element]
    var winPoints : Elements
}

func crawl(){
    let url = URL(string: "https://www.premierleague.com/tables")
  
    guard let myURL = url else {   return    }
    
    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        //let headerTitle = try doc.title()
        
        let TeamName: Elements = try doc.select(".team").select("span.long") //.은 클래스
        
        let FirstStat: [Element] = try doc.select(".tableDark").select("td").array()
        
        let FirstWinStat: Elements = try doc.select(".tableDark").select("td.points")
                
        print(try TeamName[0].text(), try FirstStat[3].text(), try FirstStat[4].text(), try FirstStat[5].text(), try FirstStat[6].text(), try FirstWinStat[0].text())
       
    } catch Exception.Error(let type, let message) {
        print("Message: \(message)")
        print("type: \(type)")
    } catch {
        print("error")
    }

}
