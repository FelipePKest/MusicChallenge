//
//  EditSongViewController.swift
//  MusicChallenge
//
//  Created by Guilherme Vassallo on 09/01/19.
//  Copyright © 2019 Felipe Kestelman. All rights reserved.
//

import UIKit

class EditSongViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var keyField: UITextField!
    @IBOutlet var bpmField: UITextField!
    @IBOutlet var instrumentsTableView: UITableView!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instrumentsTableView.delegate = self
        instrumentsTableView.dataSource = self
        
        let tableXib = UINib(nibName: "InstrumentsTableViewCell", bundle: nil)
        instrumentsTableView.register(tableXib, forCellReuseIdentifier: "instrumentsCell")
        
        nameField.text = song?.name

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song?.instruments.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let instrumentsCell = tableView.dequeueReusableCell(withIdentifier: InstrumentsTableViewCell.identifier, for: indexPath) as! InstrumentsTableViewCell
        
        instrumentsCell.instrumentImage.image = song?.instruments[indexPath.row].type.image
        instrumentsCell.instrumentName.text = song?.instruments[indexPath.row].type.text
        
        return instrumentsCell
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
