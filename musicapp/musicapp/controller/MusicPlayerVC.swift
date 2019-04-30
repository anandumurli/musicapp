//
//  MusicPlayer.swift
//  musicapp
//
//  Created by Peter Paul on 25/04/19.
//  Copyright © 2019 Emilda pvt. ltd. All rights reserved.
//

import UIKit

class MusicPlayerVC: UIViewController {

    @IBOutlet weak var artistname: UILabel!
    @IBOutlet weak var SongName: UILabel!
    @IBOutlet weak var playingFromLabel: UILabel!
    @IBOutlet weak var albumArt: UIImageView!
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var playButTapped: UIButton!
    @IBOutlet weak var shuffleTapped: UIButton!
    @IBAction func cancelTapped(_ sender: Any) {
        //dismiss the view
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func loveSong(_ sender: Any) {
    }
    @IBAction func shuffleTapped(_ sender: Any) {
        if(shuffleFlag == 0){
            self.shuffleTapped.setImage(UIImage(named:"shuffleOn.png"), for: .normal)
            shuffleFlag = 1
        } else if shuffleFlag == 1{
            self.shuffleTapped.setImage(UIImage(named:"shuffle.png"), for: .normal)
            shuffleFlag = 0
        }
    }
    @IBAction func previousSongTapped(_ sender: Any) {
    }
    @IBAction func nextSongTapped(_ sender: Any) {
    }
    @IBAction func playPausetapped(_ sender: Any) {
        if(flag == 0){
            self.playButTapped.setImage(UIImage(named: "play_button.png"), for: .normal)
            flag = 1
        }else if flag == 1{
            self.playButTapped.setImage(UIImage(named: "pause_button.png"), for: .normal)
            flag = 0
        }
        
    }
    var flag = 0 //song was playing
    var shuffleFlag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
