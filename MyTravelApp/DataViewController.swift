//
//  DataViewController.swift
//  MyTravelApp
//
//  Created by Peter Mårtensson on 2017-01-29.
//  Copyright © 2017 Peter Mårtensson. All rights reserved.
//

import UIKit
import MapKit

class DataViewController: UIViewController, MKMapViewDelegate, iCarouselDataSource, iCarouselDelegate  {

    
    @IBOutlet weak var dataImageView: iCarousel!
    @IBOutlet weak var dataMapView: MKMapView!
    @IBOutlet weak var dataTextView: UITextView!
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    var items: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0 ... 99 {
            items.append(i)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
         dataImageView.type = .timeMachine
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
    
    
    // MARK : iCarousel

    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        var itemView: UIImageView
        
        //reuse view if available, otherwise create a new view
        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
            label = itemView.viewWithTag(1) as! UILabel
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 170, height: 170))
            itemView.image = UIImage(named: "page.png")
            itemView.contentMode = .center
            
            label = UILabel(frame: itemView.bounds)
            label.backgroundColor = .clear
            label.textAlignment = .center
            label.font = label.font.withSize(50)
            label.tag = 1
            itemView.addSubview(label)
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(items[index])"
        
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        
        switch option {
        
        case iCarouselOption.angle:
            print("iCarousel, angle = \(value)")
            return value
        case iCarouselOption.arc:
            print("iCarousel, arc = \(value)")
            return value
        case iCarouselOption.count:
            print("iCarousel, count = \(value)")
            return value
        case iCarouselOption.fadeMax:
            print("iCarousel, fadeMax = \(value)")
            return value
        case iCarouselOption.fadeMin:
            print("iCarousel, fadeMin = \(value)")
            return value
        case iCarouselOption.fadeMinAlpha:
            print("iCarousel, fadeMinAlpha = \(value)")
            return value
        case iCarouselOption.fadeRange:
            print("iCarousel, fadeRange = \(value)")
            return value
        case iCarouselOption.offsetMultiplier:
            print("iCarousel, offsetMultiplier = \(value)")
            return value
        case iCarouselOption.radius:
            print("iCarousel, radius = \(value)")
            return value
        case iCarouselOption.showBackfaces:
            print("iCarousel, showBackfaces = \(value)")
            return value
        case iCarouselOption.spacing:
            print("iCarousel, spacing = \(value)")
            return value * 1.1
        case iCarouselOption.tilt:
            print("iCarousel, tilt = \(value)")
            return value
        case iCarouselOption.visibleItems:
            print("iCarousel, visibleItems = \(value)")
            return value
        case iCarouselOption.wrap:
            print("iCarousel, wrap = \(value)")
            return 1.0
        }
        
    }
}

