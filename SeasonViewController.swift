//
//  SeasonViewController.swift
//  Westeros
//
//  Created by yisus on 30/08/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    let model: Season
    
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel () {
        lbTitle.text = model.title
        lbDate.text = model.date.description
    }
    
    func setUpUi () {
        let episodes = UIBarButtonItem(title: "Episodes",
                                       style: .plain,
                                       target: self,
                                       action: #selector(displayEpisodes))
        
        navigationItem.rightBarButtonItem = episodes
    }

    @objc func displayEpisodes () {
        let episodesVC = EpisodeTableViewController(model: model.sortedEpisodes())
        navigationController?.pushViewController(episodesVC, animated: true)
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpUi()
        syncViewWithModel()
    }

}
