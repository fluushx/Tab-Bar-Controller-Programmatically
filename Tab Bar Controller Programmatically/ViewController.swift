//
//  ViewController.swift
//  Tab Bar Controller Programmatically
//
//  Created by Felipe Ignacio Zapata Riffo on 09-08-21.
//

import UIKit

class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Click Here", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton (){
        print("tapped")
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController:SecondViewController())
        let vc3 = UINavigationController(rootViewController:ThirdViewController())
        let vc4 = UINavigationController(rootViewController:FourthViewController())
        let vc5 = UINavigationController(rootViewController:FiveViewController())
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        
        vc1.title = "Home"
        vc2.title = "Contact"
        vc3.title = "Help"
        vc4.title = "About"
        vc5.title = "Settings"
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        let images = ["house","bell","person.circle","star","gear"]
        
        for x in 0..<items.count{
            items[x].image = UIImage(systemName: images[x])
        }
    }

}
class FirstViewController:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .green
       title = "Home"
    }
}

class SecondViewController:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .red
        title = "Contact"
    }
}

class ThirdViewController:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .blue
        title = "Help"
    }
}

class FourthViewController:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .orange
        title = "About"
    }
}

class FiveViewController:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        title = "Settings"
    }
}
