//
//  ViewController.swift
//  FIRDB CRUD
//
//  Created by Likhit Garimella on 22/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var name: UITextField!
    @IBOutlet var genre: UITextField!
    @IBOutlet var labelMessage: UILabel!
    
    @IBOutlet var tblArtists: UITableView!
    
    var artistsList = [ArtistModel]()
    
    var refArtists: DatabaseReference!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let artist: ArtistModel
        artist = artistsList[indexPath.row]
        cell.lblName.text = artist.name
        cell.lblGenre.text = artist.genre
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        refArtists = Database.database().reference().child("Artists")
        refArtists.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.artistsList.removeAll()
                
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    let artistObject = artists.value as? [String: AnyObject]
                    let artistId  = artistObject?["id"]
                    let artistName  = artistObject?["ArtistName"]
                    let artistGenre = artistObject?["ArtistGenre"]
                    
                    let artist = ArtistModel(id: artistId as! String?, name: artistName as! String?, genre: artistGenre as! String?)
                    self.artistsList.append(artist)
                }
                self.tblArtists.reloadData()
            }
        })
        
    }
    
    @IBAction func buttonAddArtist(_ sender: UIButton) {
        
        addArtists()
        
    }
    
    func addArtists() {
        
        let key = refArtists.childByAutoId().key
        let artist = ["id": key, "ArtistName": name.text!, "ArtistGenre": genre.text!]
        refArtists.child(key!).setValue(artist)
        labelMessage.text = "Artist Added"
        
    }
    
}

// Dismiss keyboard on tapping anywhere
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
