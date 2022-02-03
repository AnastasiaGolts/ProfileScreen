//
//  ViewController.swift
//  ProfileScreen
//
//  Created by Anastasia G on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let notAuthCells = ["Настройки приложения",
                        "Информация о магазине"]
    let authCells = ["Мои заказы",
                     "Мои купоны",
                     "Отложенные товары",
                     "Мои подписки",
                     "Купленные товары",
                     "Мои рецензии",
                     "156 пунктов самовывоза",
                     "Настройки профиля",
                     "Настройки приложения",
                     "Информация о магазине"]
    
    let blackCell = ["BlackCell"]
    let lowerCell = ["LowerCell"]
    var sectionsNotAuth = [[String]]()
    var sectionsAuth = [[String]]()
    
    var isAuth = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isAuth = true
        
        if isAuth {
            let profileAuthCell = UINib(nibName: "ProfileAuthTableViewCell", bundle: nil)
            tableView.register(profileAuthCell, forCellReuseIdentifier: "ProfileAuthTableViewCell")
            
            let lowerAuthCell = UINib(nibName: "LowerAuthTableViewCell", bundle: nil)
            tableView.register(lowerAuthCell, forCellReuseIdentifier: "LowerAuthTableViewCell")
        } else {
            let profileNotAuthCell = UINib(nibName: "ProfileNotAuthTableViewCell", bundle: nil)
            tableView.register(profileNotAuthCell, forCellReuseIdentifier: "ProfileNotAuthTableViewCell")
        }
        
        let whiteProfileNotAuthCell = UINib(nibName: "WhiteProfileTableViewCell", bundle: nil)
        tableView.register(whiteProfileNotAuthCell, forCellReuseIdentifier: "WhiteProfileTableViewCell")
        
        sectionsNotAuth = [blackCell, notAuthCells]
        sectionsAuth = [blackCell, authCells, lowerCell]
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isAuth {
            return sectionsAuth.count
        } else {
            return sectionsNotAuth.count
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAuth {
            return sectionsAuth[section].count
        } else {
            return sectionsNotAuth[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isAuth {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAuthTableViewCell", for: indexPath) as? ProfileAuthTableViewCell
                return cell ?? UITableViewCell()
            } else if indexPath.section == sectionsAuth.count - 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LowerAuthTableViewCell", for: indexPath) as? LowerAuthTableViewCell
                return cell ?? UITableViewCell()
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "WhiteProfileTableViewCell", for: indexPath) as? WhiteProfileTableViewCell
                cell?.titleLabel.text = authCells[indexPath.row]
                return cell ?? UITableViewCell()
            }
        } else {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNotAuthTableViewCell", for: indexPath) as? ProfileNotAuthTableViewCell
                return cell ?? UITableViewCell()
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "WhiteProfileTableViewCell", for: indexPath) as? WhiteProfileTableViewCell
                cell?.titleLabel.text = notAuthCells[indexPath.row]
                return cell ?? UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isAuth {
            if indexPath.section == 0 {
                return 189
            } else if indexPath.section == sectionsAuth.count - 1 {
                return 246
            } else {
                return 65
            }
        } else {
            if indexPath.section == 0 {
                return 208
            } else {
                return 65
            }
        }
    }
}

