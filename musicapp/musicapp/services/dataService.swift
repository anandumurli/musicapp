//
//  dataService.swift
//  musicapp
//
//  Created by Peter Paul on 19/04/19.
//  Copyright © 2019 Emilda pvt. ltd. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService{
    static let instance = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_SONG = DB_BASE.child("music")
    private var _REF_USER = Auth.auth().currentUser
    func getData(handler: @escaping(_ songs: [song]) -> ()){
        var songArray = [song]()
        _REF_SONG.observeSingleEvent(of: .value) { (songSnapshot) in
            guard let songSnapshot = songSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for songs in songSnapshot{
                let url = songs.childSnapshot(forPath: "url").value as! String
                let Sname = songs.childSnapshot(forPath: "song_name").value as! String
                let Aname = songs.childSnapshot(forPath: "artist_name").value as! String
                let sId = songs.childSnapshot(forPath: "uniqID").value as! Int
                let Iurl = songs.childSnapshot(forPath: "imgUrl").value as! String
                let songs = song(Surl: url, Sname: Sname, sUid: sId, Aname: Aname, Iurl: Iurl)
                songArray.append(songs)
            }
            handler(songArray)
        }
    }
//    func getDatafavsong(handler: @escaping(_ favsongs: [song]) -> ()){
//        var favsongArray = [song]()
//        _REF_SONG.observeSingleEvent(of: .value) { (songSnapshot) in
//           guard let songSnapshot = songSnapshot.children.allObjects as? [DataSnapshot] else {return}
//            for songs in songSnapshot{
//                let url = songs.childSnapshot(forPath: "url").value as! String
//                let Sname = songs.childSnapshot(forPath: "song_name").value as! String
//                let Aname = songs.childSnapshot(forPath: "artist_name").value as! String
//                let sId = songs.childSnapshot(forPath: "uniqID").value as! String
//                let Iurl = songs.childSnapshot(forPath: "imgUrl").value as! String
//                if fav == 1{
//                    let favsongs = song(Surl: url, Sname: Sname, sUid: sId, Aname: Aname, Iurl: Iurl)
//                    favsongArray.append(favsongs)
//                }
//            }
//            handler(favsongArray)
//        }
//    }
}

