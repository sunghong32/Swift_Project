import UIKit
import SwiftSoup

class ViewController: UIViewController {
    var datalist = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        crawl()
    }
}

struct eachTeam {
    var name : [String]
    var game : [String]
    var win : [String]
    var draw : [String]
    var lose : [String]
    var points : [String]
    var fiveresult : [String]
    var nextgame : [String]
}

struct PLTeam {
    var oneTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var twoTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var threeTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var fourTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var fiveTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var sixTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var sevenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var eightTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var nineTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var tenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var elevenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var twelveTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var thirteenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var fourteenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var fifteenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var sixteenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var seventeenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var eightteenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var nineteenTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
    var twentyTeam : eachTeam = eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: [])
}

var TotalTeam : PLTeam = PLTeam(oneTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), twoTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), threeTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), fourTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), fiveTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), sixTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), sevenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), eightTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), nineTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), tenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), elevenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), twelveTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), thirteenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), fourteenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), fifteenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), sixteenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), seventeenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), eightteenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), nineteenTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []), twentyTeam: eachTeam(name: [], game: [], win: [], draw: [], lose: [], points: [], fiveresult: [], nextgame: []))

func crawl(){
    let url = URL(string: "https://www.premierleague.com/tables")
  
    guard let myURL = url else {   return    }
    
    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        let Total: [Element] = try doc.select("tbody.tableBodyContainer.isPL").select("td").array()
                
        for i in 1...280 {
            if i < 14 {
                if i == 2 {
                    TotalTeam.oneTeam.name.append(try Total[i].text())
                } else if i == 3 {
                    TotalTeam.oneTeam.game.append(try Total[i].text())
                } else if i == 4 {
                    TotalTeam.oneTeam.win.append(try Total[i].text())
                } else if i == 5 {
                    TotalTeam.oneTeam.draw.append(try Total[i].text())
                } else if i == 6 {
                    TotalTeam.oneTeam.lose.append(try Total[i].text())
                } else if i == 10 {
                    TotalTeam.oneTeam.points.append(try Total[i].text())
                } else if i == 11 {
                    TotalTeam.oneTeam.fiveresult.append(try Total[i].text())
                } else if i == 12 {
                    TotalTeam.oneTeam.nextgame.append(try Total[i].text())
                }
           } else if i > 15 && i < 28 {
                if i == 16 {
                    TotalTeam.twoTeam.name.append(try Total[i].text())
                } else if i == 17 {
                    TotalTeam.twoTeam.game.append(try Total[i].text())
                } else if i == 18 {
                    TotalTeam.twoTeam.win.append(try Total[i].text())
                } else if i == 19 {
                    TotalTeam.twoTeam.draw.append(try Total[i].text())
                } else if i == 20 {
                    TotalTeam.twoTeam.lose.append(try Total[i].text())
                } else if i == 24 {
                    TotalTeam.twoTeam.points.append(try Total[i].text())
                } else if i == 25 {
                    TotalTeam.twoTeam.fiveresult.append(try Total[i].text())
                } else if i == 26 {
                    TotalTeam.twoTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 29 && i < 42 {
                if i == 30 {
                    TotalTeam.threeTeam.name.append(try Total[i].text())
                } else if i == 31 {
                    TotalTeam.threeTeam.game.append(try Total[i].text())
                } else if i == 32 {
                    TotalTeam.threeTeam.win.append(try Total[i].text())
                } else if i == 33 {
                    TotalTeam.threeTeam.draw.append(try Total[i].text())
                } else if i == 34 {
                    TotalTeam.threeTeam.lose.append(try Total[i].text())
                } else if i == 38 {
                    TotalTeam.threeTeam.points.append(try Total[i].text())
                } else if i == 39 {
                    TotalTeam.threeTeam.fiveresult.append(try Total[i].text())
                } else if i == 40 {
                    TotalTeam.threeTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 43 && i < 56 {
                if i == 44 {
                    TotalTeam.fourTeam.name.append(try Total[i].text())
                } else if i == 45 {
                    TotalTeam.fourTeam.game.append(try Total[i].text())
                } else if i == 46 {
                    TotalTeam.fourTeam.win.append(try Total[i].text())
                } else if i == 47 {
                    TotalTeam.fourTeam.draw.append(try Total[i].text())
                } else if i == 48 {
                    TotalTeam.fourTeam.lose.append(try Total[i].text())
                } else if i == 52 {
                    TotalTeam.fourTeam.points.append(try Total[i].text())
                } else if i == 53 {
                    TotalTeam.fourTeam.fiveresult.append(try Total[i].text())
                } else if i == 54 {
                    TotalTeam.fourTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 57 && i < 70 {
                if i == 58 {
                    TotalTeam.fiveTeam.name.append(try Total[i].text())
                } else if i == 59 {
                    TotalTeam.fiveTeam.game.append(try Total[i].text())
                } else if i == 60 {
                    TotalTeam.fiveTeam.win.append(try Total[i].text())
                } else if i == 61 {
                    TotalTeam.fiveTeam.draw.append(try Total[i].text())
                } else if i == 62 {
                    TotalTeam.fiveTeam.lose.append(try Total[i].text())
                } else if i == 66 {
                    TotalTeam.fiveTeam.points.append(try Total[i].text())
                } else if i == 67 {
                    TotalTeam.fiveTeam.fiveresult.append(try Total[i].text())
                } else if i == 68 {
                    TotalTeam.fiveTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 71 && i < 84 {
                if i == 72 {
                    TotalTeam.sixTeam.name.append(try Total[i].text())
                } else if i == 73 {
                    TotalTeam.sixTeam.game.append(try Total[i].text())
                } else if i == 74 {
                    TotalTeam.sixTeam.win.append(try Total[i].text())
                } else if i == 75 {
                    TotalTeam.sixTeam.draw.append(try Total[i].text())
                } else if i == 76 {
                    TotalTeam.sixTeam.lose.append(try Total[i].text())
                } else if i == 80 {
                    TotalTeam.sixTeam.points.append(try Total[i].text())
                } else if i == 81 {
                    TotalTeam.sixTeam.fiveresult.append(try Total[i].text())
                } else if i == 82 {
                    TotalTeam.sixTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 85 && i < 98 {
                if i == 86 {
                    TotalTeam.sevenTeam.name.append(try Total[i].text())
                } else if i == 87 {
                    TotalTeam.sevenTeam.game.append(try Total[i].text())
                } else if i == 88 {
                    TotalTeam.sevenTeam.win.append(try Total[i].text())
                } else if i == 89 {
                    TotalTeam.sevenTeam.draw.append(try Total[i].text())
                } else if i == 90 {
                    TotalTeam.sevenTeam.lose.append(try Total[i].text())
                } else if i == 94 {
                    TotalTeam.sevenTeam.points.append(try Total[i].text())
                } else if i == 95 {
                    TotalTeam.sevenTeam.fiveresult.append(try Total[i].text())
                } else if i == 96 {
                    TotalTeam.sevenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 99 && i < 112 {
                if i == 100 {
                    TotalTeam.eightTeam.name.append(try Total[i].text())
                } else if i == 101 {
                    TotalTeam.eightTeam.game.append(try Total[i].text())
                } else if i == 102 {
                    TotalTeam.eightTeam.win.append(try Total[i].text())
                } else if i == 103 {
                    TotalTeam.eightTeam.draw.append(try Total[i].text())
                } else if i == 104 {
                    TotalTeam.eightTeam.lose.append(try Total[i].text())
                } else if i == 108 {
                    TotalTeam.eightTeam.points.append(try Total[i].text())
                } else if i == 109 {
                    TotalTeam.eightTeam.fiveresult.append(try Total[i].text())
                } else if i == 110 {
                    TotalTeam.eightTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 113 && i < 126 {
                if i == 114 {
                    TotalTeam.nineTeam.name.append(try Total[i].text())
                } else if i == 115 {
                    TotalTeam.nineTeam.game.append(try Total[i].text())
                } else if i == 116 {
                    TotalTeam.nineTeam.win.append(try Total[i].text())
                } else if i == 117 {
                    TotalTeam.nineTeam.draw.append(try Total[i].text())
                } else if i == 118 {
                    TotalTeam.nineTeam.lose.append(try Total[i].text())
                } else if i == 122 {
                    TotalTeam.nineTeam.points.append(try Total[i].text())
                } else if i == 123 {
                    TotalTeam.nineTeam.fiveresult.append(try Total[i].text())
                } else if i == 124 {
                    TotalTeam.nineTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 127 && i < 140 {
                if i == 128 {
                    TotalTeam.tenTeam.name.append(try Total[i].text())
                } else if i == 129 {
                    TotalTeam.tenTeam.game.append(try Total[i].text())
                } else if i == 130 {
                    TotalTeam.tenTeam.win.append(try Total[i].text())
                } else if i == 131 {
                    TotalTeam.tenTeam.draw.append(try Total[i].text())
                } else if i == 132 {
                    TotalTeam.tenTeam.lose.append(try Total[i].text())
                } else if i == 136 {
                    TotalTeam.tenTeam.points.append(try Total[i].text())
                } else if i == 137 {
                    TotalTeam.tenTeam.fiveresult.append(try Total[i].text())
                } else if i == 138 {
                    TotalTeam.tenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 141 && i < 154 {
                if i == 142 {
                    TotalTeam.elevenTeam.name.append(try Total[i].text())
                } else if i == 143 {
                    TotalTeam.elevenTeam.game.append(try Total[i].text())
                } else if i == 144 {
                    TotalTeam.elevenTeam.win.append(try Total[i].text())
                } else if i == 145 {
                    TotalTeam.elevenTeam.draw.append(try Total[i].text())
                } else if i == 146 {
                    TotalTeam.elevenTeam.lose.append(try Total[i].text())
                } else if i == 150 {
                    TotalTeam.elevenTeam.points.append(try Total[i].text())
                } else if i == 151 {
                    TotalTeam.elevenTeam.fiveresult.append(try Total[i].text())
                } else if i == 152 {
                    TotalTeam.elevenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 155 && i < 168 {
                if i == 156 {
                    TotalTeam.twelveTeam.name.append(try Total[i].text())
                } else if i == 157 {
                    TotalTeam.twelveTeam.game.append(try Total[i].text())
                } else if i == 158 {
                    TotalTeam.twelveTeam.win.append(try Total[i].text())
                } else if i == 159 {
                    TotalTeam.twelveTeam.draw.append(try Total[i].text())
                } else if i == 160 {
                    TotalTeam.twelveTeam.lose.append(try Total[i].text())
                } else if i == 164 {
                    TotalTeam.twelveTeam.points.append(try Total[i].text())
                } else if i == 165 {
                    TotalTeam.twelveTeam.fiveresult.append(try Total[i].text())
                } else if i == 166 {
                    TotalTeam.twelveTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 169 && i < 182 {
                if i == 170 {
                    TotalTeam.thirteenTeam.name.append(try Total[i].text())
                } else if i == 171 {
                    TotalTeam.thirteenTeam.game.append(try Total[i].text())
                } else if i == 172 {
                    TotalTeam.thirteenTeam.win.append(try Total[i].text())
                } else if i == 173 {
                    TotalTeam.thirteenTeam.draw.append(try Total[i].text())
                } else if i == 174 {
                    TotalTeam.thirteenTeam.lose.append(try Total[i].text())
                } else if i == 178 {
                    TotalTeam.thirteenTeam.points.append(try Total[i].text())
                } else if i == 179 {
                    TotalTeam.thirteenTeam.fiveresult.append(try Total[i].text())
                } else if i == 180 {
                    TotalTeam.thirteenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 183 && i < 196 {
                if i == 184 {
                    TotalTeam.fourteenTeam.name.append(try Total[i].text())
                } else if i == 185 {
                    TotalTeam.fourteenTeam.game.append(try Total[i].text())
                } else if i == 186 {
                    TotalTeam.fourteenTeam.win.append(try Total[i].text())
                } else if i == 187 {
                    TotalTeam.fourteenTeam.draw.append(try Total[i].text())
                } else if i == 188 {
                    TotalTeam.fourteenTeam.lose.append(try Total[i].text())
                } else if i == 192 {
                    TotalTeam.fourteenTeam.points.append(try Total[i].text())
                } else if i == 193 {
                    TotalTeam.fourteenTeam.fiveresult.append(try Total[i].text())
                } else if i == 194 {
                    TotalTeam.fourteenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 197 && i < 210 {
                if i == 198 {
                    TotalTeam.fifteenTeam.name.append(try Total[i].text())
                } else if i == 199 {
                    TotalTeam.fifteenTeam.game.append(try Total[i].text())
                } else if i == 200 {
                    TotalTeam.fifteenTeam.win.append(try Total[i].text())
                } else if i == 201 {
                    TotalTeam.fifteenTeam.draw.append(try Total[i].text())
                } else if i == 202 {
                    TotalTeam.fifteenTeam.lose.append(try Total[i].text())
                } else if i == 206 {
                    TotalTeam.fifteenTeam.points.append(try Total[i].text())
                } else if i == 207 {
                    TotalTeam.fifteenTeam.fiveresult.append(try Total[i].text())
                } else if i == 208 {
                    TotalTeam.fifteenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 211 && i < 224 {
                if i == 212 {
                    TotalTeam.sixteenTeam.name.append(try Total[i].text())
                } else if i == 213 {
                    TotalTeam.sixteenTeam.game.append(try Total[i].text())
                } else if i == 214 {
                    TotalTeam.sixteenTeam.win.append(try Total[i].text())
                } else if i == 215 {
                    TotalTeam.sixteenTeam.draw.append(try Total[i].text())
                } else if i == 216 {
                    TotalTeam.sixteenTeam.lose.append(try Total[i].text())
                } else if i == 220 {
                    TotalTeam.sixteenTeam.points.append(try Total[i].text())
                } else if i == 221 {
                    TotalTeam.sixteenTeam.fiveresult.append(try Total[i].text())
                } else if i == 222 {
                    TotalTeam.sixteenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 225 && i < 238 {
                if i == 226 {
                    TotalTeam.seventeenTeam.name.append(try Total[i].text())
                } else if i == 227 {
                    TotalTeam.seventeenTeam.game.append(try Total[i].text())
                } else if i == 228 {
                    TotalTeam.seventeenTeam.win.append(try Total[i].text())
                } else if i == 229 {
                    TotalTeam.seventeenTeam.draw.append(try Total[i].text())
                } else if i == 230 {
                    TotalTeam.seventeenTeam.lose.append(try Total[i].text())
                } else if i == 234 {
                    TotalTeam.seventeenTeam.points.append(try Total[i].text())
                } else if i == 235 {
                    TotalTeam.seventeenTeam.fiveresult.append(try Total[i].text())
                } else if i == 236 {
                    TotalTeam.seventeenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 239 && i < 252 {
                if i == 240 {
                    TotalTeam.eightteenTeam.name.append(try Total[i].text())
                } else if i == 241 {
                    TotalTeam.eightteenTeam.game.append(try Total[i].text())
                } else if i == 242 {
                    TotalTeam.eightteenTeam.win.append(try Total[i].text())
                } else if i == 243 {
                    TotalTeam.eightteenTeam.draw.append(try Total[i].text())
                } else if i == 244 {
                    TotalTeam.eightteenTeam.lose.append(try Total[i].text())
                } else if i == 248 {
                    TotalTeam.eightteenTeam.points.append(try Total[i].text())
                } else if i == 249 {
                    TotalTeam.eightteenTeam.fiveresult.append(try Total[i].text())
                } else if i == 250 {
                    TotalTeam.eightteenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 253 && i < 266 {
                if i == 254 {
                    TotalTeam.nineteenTeam.name.append(try Total[i].text())
                } else if i == 255 {
                    TotalTeam.nineteenTeam.game.append(try Total[i].text())
                } else if i == 256 {
                    TotalTeam.nineteenTeam.win.append(try Total[i].text())
                } else if i == 257 {
                    TotalTeam.nineteenTeam.draw.append(try Total[i].text())
                } else if i == 258 {
                    TotalTeam.nineteenTeam.lose.append(try Total[i].text())
                } else if i == 262 {
                    TotalTeam.nineteenTeam.points.append(try Total[i].text())
                } else if i == 263 {
                    TotalTeam.nineteenTeam.fiveresult.append(try Total[i].text())
                } else if i == 264 {
                    TotalTeam.nineteenTeam.nextgame.append(try Total[i].text())
                }
            } else if i > 267 && i < 280 {
                if i == 268 {
                    TotalTeam.twentyTeam.name.append(try Total[i].text())
                } else if i == 269 {
                    TotalTeam.twentyTeam.game.append(try Total[i].text())
                } else if i == 270 {
                    TotalTeam.twentyTeam.win.append(try Total[i].text())
                } else if i == 271 {
                    TotalTeam.twentyTeam.draw.append(try Total[i].text())
                } else if i == 272 {
                    TotalTeam.twentyTeam.lose.append(try Total[i].text())
                } else if i == 276 {
                    TotalTeam.twentyTeam.points.append(try Total[i].text())
                } else if i == 277 {
                    TotalTeam.twentyTeam.fiveresult.append(try Total[i].text())
                } else if i == 278 {
                    TotalTeam.twentyTeam.nextgame.append(try Total[i].text())
                }
            }
        }
        
        print(TotalTeam.oneTeam)
        print(TotalTeam.twoTeam)
        print(TotalTeam.threeTeam)
        print(TotalTeam.fourTeam)
        print(TotalTeam.fiveTeam)
        print(TotalTeam.sixTeam)
        print(TotalTeam.sevenTeam)
        print(TotalTeam.eightTeam)
        print(TotalTeam.nineTeam)
        print(TotalTeam.tenTeam)
        print(TotalTeam.elevenTeam)
        print(TotalTeam.twelveTeam)
        print(TotalTeam.thirteenTeam)
        print(TotalTeam.fourteenTeam)
        print(TotalTeam.fifteenTeam)
        print(TotalTeam.sixteenTeam)
        print(TotalTeam.seventeenTeam)
        print(TotalTeam.eightteenTeam)
        print(TotalTeam.nineteenTeam)
        print(TotalTeam.twentyTeam)

    } catch Exception.Error(let type, let message) {
        print("Message: \(message)")
        print("type: \(type)")
    } catch {
        print("error")
    }
}
