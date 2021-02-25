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
    var name : [String]
    var game : [String]
    var win : [String]
    var draw : [String]
    var lose : [String]
    var winPoints : [String]
}

var PL : Team = Team(name: [], game: [], win: [], draw: [], lose: [], winPoints: [])

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
                
//        print(try TeamName[0].text(), try FirstStat[3].text(), try FirstStat[4].text(), try FirstStat[5].text(), try FirstStat[6].text(), try FirstWinStat[0].text())
        
        PL.name.append(try TeamName[0].text())
        PL.game.append(try FirstStat[3].text())
        PL.win.append(try FirstStat[4].text())
        PL.draw.append(try FirstStat[5].text())
        PL.lose.append(try FirstStat[6].text())
        PL.winPoints.append(try FirstWinStat[0].text())
      
        print(PL.name,PL.game,PL.win,PL.draw,PL.lose,PL.winPoints)
        
        
        
    } catch Exception.Error(let type, let message) {
        print("Message: \(message)")
        print("type: \(type)")
    } catch {
        print("error")
    }

}
