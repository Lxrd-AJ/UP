//
//  WelcomeScene.swift
//  UP
//
//  Created by AJ Ibraheem on 11/02/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit
import SpriteKit

class WelcomeScene: SKScene {

    var playableRect:CGRect?
    
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 16.0/9.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height-playableHeight)/2.0
        playableRect = CGRect(x: 0, y: playableMargin,width: size.width, height: playableHeight)
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // 6
    }
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        //Create the background image
        let backgroundSprite = SKSpriteNode( imageNamed: "LaunchImage.png" )
        backgroundSprite.position = CGPoint(x: size.width/2 , y: size.height/2)
        backgroundSprite.size = UIScreen.mainScreen().bounds.size
        backgroundSprite.zPosition = -1
        self.addChild( backgroundSprite )
        
        //Add the play button
        let buttonSprite = SKSpriteNode( texture: SKTexture(imageNamed: "StartButton.png"), size: CGSize(width: 150, height: 90))
        buttonSprite.position = CGPoint( x: screenWidth * 0.55, y: screenHeight * 0.2 )
        buttonSprite.name = "PlayButton"
        addChild( buttonSprite )
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        let nodes:[SKNode] = nodesAtPoint(touchLocation) as [SKNode]
        let node = nodes.filter { $0.name == "PlayButton" }
        if node[0].name == "PlayButton" {
            self.view!.presentScene( GameScene() )
        }
        
        
    }
   
}
