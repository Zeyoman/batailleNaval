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
    var placeView2 : PlaceViewController2!
    var choiceView : ChoiceViewController!
    var hitView : HitViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choiceView = (self.storyboard?.instantiateViewController(withIdentifier: "choice") as! ChoiceViewController)
        placeView = (self.storyboard?.instantiateViewController(withIdentifier: "place") as! PlaceViewController)
        placeView2 = (self.storyboard?.instantiateViewController(withIdentifier: "place2") as! PlaceViewController2)
        hitView = (self.storyboard?.instantiateViewController(withIdentifier: "hit") as! HitViewController)
        
        choiceView?.parentvc = self
        placeView?.parentvc = self
        placeView2?.parentvc = self
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
        parentvc!.choiceView.view.removeFromSuperview()
        parentvc!.addChild(parentvc!.placeView2)
        parentvc!.view.addSubview(parentvc!.placeView2.view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class PlaceViewController : UIViewController{
    
    var parentvc: ViewController? = nil
    
    @IBOutlet weak var arrayButtonBoat: UITableView!
    
    @IBAction func validateButton(_ sender: Any) {
        parentvc!.placeView.view.removeFromSuperview()
        parentvc!.addChild(parentvc!.hitView)
        parentvc!.view.addSubview(parentvc!.hitView.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class PlaceViewController2 : UIViewController {
    
    var parentvc: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // dans cette partie il y a le placement du bateau
    
    // fonction qui sur le clique repère l'emplacement et choisi
        // sépare les boutons dans un tableau de tableau de chaque ligne
        // lors du clique il prend l'index du bouton
        // le prochain choix se fait soit sur la ligne du dessus soit du dessous si possible ( par index du tableau )
        // soit dans le tableau selon l'index du bouton choisi ( +1 ou -1 ) si possible
}

class HitViewController : UIViewController {
    var parentvc: ViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // dans cette partie il y a la recherche du bateau
}
