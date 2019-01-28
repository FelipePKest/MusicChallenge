//
//  MyProfileViewController.swift
//  MusicChallenge
//
//  Created by Guilherme Vassallo on 17/12/18.
//  Copyright © 2018 Felipe Kestelman. All rights reserved.
//

//ViewController da tela de perfil do usuário

import UIKit

class MyProfileViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var instrumentsLabel: UILabel!
    
    @IBOutlet var instrumentsTableView: UITableView!
    
    var profile = Musician(name: "Felipe Gouveia", age: 75, instruments: [Instrument.Guitar, Instrument.Bass, Instrument.Others], band: Band(), id: "asldmglwmrogw")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.instrumentsTableView.dataSource = self
        self.instrumentsTableView.delegate = self
        
        let tableXib = UINib(nibName: "InstrumentsTableViewCell", bundle: nil)
        instrumentsTableView.register(tableXib, forCellReuseIdentifier: "instrumentCell")

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.instruments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInstrument = tableView.dequeueReusableCell(withIdentifier: InstrumentsTableViewCell.identifier, for: indexPath) as! InstrumentsTableViewCell
        
        cellInstrument.instrumentImage.image = profile.instruments?[indexPath.row].image
        cellInstrument.instrumentName.text = profile.instruments?[indexPath.row].text
        
        return cellInstrument
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editButton(_ sender: Any) {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
