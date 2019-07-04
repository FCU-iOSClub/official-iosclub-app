//
//  AboutUsData.swift
//  iOSClub
//
//  Created by Admin02 on 2019/7/4.
//  Copyright © 2019年 FCUiosclub. All rights reserved.
//

import Foundation

class Cadre {
    var photo:String!
    var position:String!
    var name:String!
    var introduce:String!

    init(_ photo:String,_ position:String,_ name:String,_ introduce:String) {
        self.photo = photo
        self.position = position
        self.name = name
        self.introduce = introduce
    }
    func setPhoto(_ photo:String) {
        self.photo = photo
    }
    func setPosition(_ position:String){
        self.position = position
    }
    func setName(_ name:String) {
        self.name = name
    }
    func setIntroduce(_ introduce:String) {
        self.introduce = introduce
    }
    
    func getPhoto()->String{
        return self.photo
    }
    func getPosition() ->String{
        return self.position
    }
    func getName()->String{
        return self.name
    }
    func getIntroduce()->String{
        return self.introduce
    }
}
