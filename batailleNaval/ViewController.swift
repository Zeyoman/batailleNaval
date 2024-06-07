//
//  ViewController.swift
//  batailleNaval
//
//  Created by Alexandre Pumpalovic on 07/06/2024.
//

import UIKit

//parent
class ViewController: UIViewController {
    
    var placeView : PlaceViewController!
    var choiceView : ChoiceViewController!
    var hitView : HitViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choiceView = (self.storyboard?.instantiateViewController(withIdentifier: "choice") as! ChoiceViewController)
        placeView = (self.storyboard?.instantiateViewController(withIdentifier: "place") as! PlaceViewController)
        hitView = (self.storyboard?.instantiateViewController(withIdentifier: "hit") as! HitViewController)
        
        choiceView?.parentvc = self
        placeView?.parentvc = self
        hitView?.parentvc = self
        
        self.addChild(choiceView!)
        self.view.addSubview(choiceView!.view)
    }

}

class ChoiceViewController : UIViewController{
    var parentvc: ViewController? = nil
    @IBAction func facileGo(_ sender: Any) {
        
        parentvc!.choiceView.view.removeFromSuperview()
        parentvc!.addChild(parentvc!.placeView)
        parentvc!.view.addSubview(parentvc!.placeView.view)
    }
    
    @IBAction func difficileGo(_ sender: Any) {
        print("difficile")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class PlaceViewController : UIViewController {
    var parentvc: ViewController? = nil

    @IBAction func validateButton(_ sender: Any) {
        parentvc!.placeView.view.removeFromSuperview()
        parentvc!.addChild(parentvc!.hitView)
        parentvc!.view.addSubview(parentvc!.hitView.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class HitViewController : UIViewController {
    var parentvc: ViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
