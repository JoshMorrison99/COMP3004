//
//  SongSelectionController.swift
//  Pitch Pal
//
//  Created by Josh Morrison on 11/12/20.
//  Copyright © 2020 Pied Piper. All rights reserved.
//

import UIKit
import SpriteKit
import AudioKit

class SongSelectionGuitarController: UITableViewController {
    var songIndex:Int = 0
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        songIndex = indexPath.section
        print(songIndex)
        self.performSegue(withIdentifier: "PlayGuitarSong", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "PlayGuitarSong"
        {
            let vc = segue.destination as? Play_Guitar
            vc?.songSelectionIndex = songIndex
        }
    }
    
    
}
