//
//  MushroomDetailViewController.swift
//  FungiFinder
//
//  Created by Kyle Warren on 9/1/21.
//

import UIKit

class MushroomDetailViewController: UIViewController {
    
    //MARK: - LABELS
    @IBOutlet weak var mushroomImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var howEdibleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - PROPERTIES
    var mushroom: Mushroom? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - LIFECYCLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - METHODS
    
    func updateViews() {
        guard let mushroom = mushroom else { return }
        mushroomImage?.image = mushroom.image
        nameLabel?.text = mushroom.name
        nicknameLabel?.text = mushroom.nickname
        howEdibleLabel?.text = mushroom.howEdible
        seasonLabel?.text = mushroom.season
        descriptionLabel?.text = mushroom.shroomDescription
        
//
//        if let image = UIImage(data:mushroom.image!) {
//            DispatchQueue.main.async {
//                 self.mushroomImage.image = image
//            }
//        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
} // End of Class
