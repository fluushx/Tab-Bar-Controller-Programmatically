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
        button.translatesAutoresizingMaskIntoConstraints = false
      
    
        return button
    }()
    
    private let button2: UIButton = {
       let button2 = UIButton()
        button2.setTitle("Show TableView", for: .normal)
        button2.backgroundColor = .white
        button2.setTitleColor(.black, for: .normal)
        button2.addTarget(self, action: #selector(didTapButtonTwo), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        view.addSubview(button2)
        anchor()
        
        
    }
    public func anchor(){
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        
        button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        
       
        
         
    }
    
    @objc func didTapButtonTwo(){
        print("tapped")
        let vc = NewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func didTapButton (){
        print("tapped")
        
        let tabBarVC = UITabBarController()
        tabBarVC.dismiss(animated: true, completion: nil)
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

class NewViewController:UIViewController{
    @IBOutlet var tableView: UITableView!
 
    override func viewDidLoad() {
        tableView?.delegate = self
        tableView?.dataSource = self
        view.backgroundColor = .black
        
    }
}
extension NewViewController: UITableViewDelegate{
    
}

extension NewViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    
}
