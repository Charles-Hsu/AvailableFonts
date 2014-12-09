//
//  GameScene.swift
//  AvailableFonts
//
//  Created by chiaHsu on 12/9/14.
//  Copyright (c) 2014 Loxoll. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var familyIdx: Int = 0
    
    override init(size: CGSize) {
        super.init(size: size)
        showCurrentFamily()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showCurrentFamily() {
        removeAllChildren()
        
        let familyName = UIFont.familyNames()[familyIdx] as String
        println("Family: \(familyName)")
        
        let fontNames = UIFont.fontNamesForFamilyName(familyName) as [String]
        
        for (idx, fontName) in enumerate(fontNames) {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            label.position = CGPoint(
                x: size.width / 2,
                y: (size.height * (CGFloat(idx+1))) / (CGFloat(fontNames.count) + 1))
            label.fontSize = 25
            label.verticalAlignmentMode = .Center
            addChild(label)
        }
        
    }
    
    override func didMoveToView(view: SKView) {
    
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        //self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        familyIdx++
        if familyIdx >= UIFont.familyNames().count {
            familyIdx = 0
        }
        showCurrentFamily()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
