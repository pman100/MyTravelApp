//
//  DataViewController.swift
//  MyTravelApp
//
//  Created by Peter Mårtensson on 2017-01-29.
//  Copyright © 2017 Peter Mårtensson. All rights reserved.
//

import UIKit
import MapKit

class DataViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var dataMapView: MKMapView!
    @IBOutlet weak var dataTextView: UITextView!

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        dataMapView.delegate = self
       /*dataMapView.mapType = .standard
        let location = CLLocationCoordinate2D(latitude: 23.0250, longitude: 72.5714)
        let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
        let region = MKCoordinateRegion(center: location, span: span)
        dataMapView.setRegion(region, animated: false)*/
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.dataLabel!.text = dataObject
    }


}

