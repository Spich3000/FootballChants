//
//  ChantsViewController.swift
//  FootballChants
//
//  Created by Дмитрий Спичаков on 11.04.2023.
//

import UIKit

class ChantsViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false // If we build view programmatically
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    private lazy var audioManagerViewModel = AudioManagerViewModel()

    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        setup() // Setup tableView (subView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
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

private extension ChantsViewController {
    
    func setup() {
        
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView) // Add subview to View
        
        // Anchor view to a points in view
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return teamsViewModel.teams.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let team = teamsViewModel.teams[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        
        cell.configure(with: team, delegate: self)
        
        return cell
    }
}

extension ChantsViewController: TeamTableViewCellDelegate {
    
    func didTapPlayback(for team: Team) {
        audioManagerViewModel.playback(team)
        teamsViewModel.togglePlayback(for: team)
        tableView.reloadData()
    }
    
}
