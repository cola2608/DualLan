//
//  Int.Swift
//  pan
//
//  Created by Cola on 2017/5/1.
//  Copyright © 2017年 Cola. All rights reserved.
//

import Foundation

extension Int {
    func getModelName() -> String {
        switch(self) {
        case 0 :
            return "GATE"
        case 1 :
            return "COMP"
        case 2 :
            return "BOOST"
        case 3 :
            return "DRIVE"
        case 4 :
            return "EQ"
        case 5 :
            return "MOD"
        case 6 :
            return "DELAY"
        case 7 :
            return "REVERB"
        default :
            return "UNKNOWN"
        }
    }
}
