//
//  EventsViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 07/02/2021.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    
    @IBOutlet weak var fetchActivityIndicator: UIActivityIndicatorView!
    var events: [Event] = []
    var pagination = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchActivityIndicator.hidesWhenStopped = true
        fetchActivityIndicator.startAnimating()
        setupTable()
        _getEvents(pagination: self.pagination)
        // Do any additional setup after loading the view.
    }
    
    func setupTable() {
        eventTableView.isHidden = true
        eventTableView.dataSource = self
        eventTableView.delegate = self
        eventTableView.register(UINib(nibName: "EventViewCell", bundle: nil), forCellReuseIdentifier: "EventViewCell")
        
        
    }
    
    func _getEvents(pagination: Int) {
        print("get events")
        NetworkingProvider.shared.getEvents( pagination: pagination) {(events) in
            
            print(events.count)
            var _eventsTemp: [Event] = self.events
            if(self.pagination != 1){
                _eventsTemp = self.events
                events.forEach{ char in
                    _eventsTemp.append(char)
                }
            } else {
                _eventsTemp = events
            }
            
            
            self.events = _eventsTemp
            self.eventTableView.isHidden = false
            self.eventTableView.reloadData()
            self.fetchActivityIndicator.stopAnimating()
            
        } failure: { (error) in
            print(error)
            self.fetchActivityIndicator.stopAnimating()
        }
    }
    
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NavigatorHelper.sharedInstance.openEventDetailModal(originVc: self,event: events[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == events.count-5 {
            
            self.pagination += 1

            _getEvents(pagination:self.pagination+1)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventViewCell", for: indexPath) as? EventViewCell

        //cell?.delegate = self
        
        cell?.setup(event: events[indexPath.row])
        
        return cell!
    }
    
}

