//
//  Quiz.swift
//  iOSClub
//
//  Created by 黃威愷 on 2019/7/5.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import Foundation
//
//  Quiz.swift
//  iOSClub
//
//  Created by 黃威愷 on 2019/7/5.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import Foundation

class Quiz {
    var Flag:Int
    var Name:[String]
    var Description:String
    init(name:String,description:String) {
        if(Int.random(in: 0...1) == 1){
            self.Name = [name+"(真)",name+"(假)"]
        }else{
            self.Name = [name+"(假)",name+"(真)"]
        }
        
        self.Flag = 0
        self.Description = description
        
    }
    func SetFlagToUsed(){
        self.Flag = 1
    }
    func SetFlagToUnusd(){
        self.Flag = 0
    }
    
}
