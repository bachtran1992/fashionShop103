//
//  ViewScroll.swift
//  fashionShop103
//
//  Created by iOS Student on 10/25/16.
//  Copyright © 2016 iOS Student. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {
var photo = UIImageView()
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
    //    UIScrollViewDelegate
        let imgView = UIImageView(image: UIImage (named: "shop1-0.jpg"))
            imgView.frame = CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)
            imgView.isUserInteractionEnabled = true
            imgView.isMultipleTouchEnabled = true
            imgView.contentMode = .scaleAspectFit
        photo = imgView
        
        
        scrollView.contentSize = CGSize(width: imgView.bounds.width, height: imgView.bounds.height)
            self.scrollView.addSubview(imgView)
        
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
       
        scrollView.delegate = self
        //
    
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg(gesture:)))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTabImg(gesture:)))
        doubleTap.numberOfTapsRequired = 2
      tap.require(toFail: doubleTap)
        imgView.addGestureRecognizer(doubleTap)
       }
    func tapImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.location(in: photo)
        zoomRectForScale(scale: scrollView.zoomScale * 1.5, center: position)
        
    }
    func doubleTabImg(gesture: UITapGestureRecognizer)
    {
        let position = gesture.location(in: photo)
        zoomRectForScale(scale: scrollView.zoomScale * 0.5, center: position)
    }
    func zoomRectForScale(scale: CGFloat, center: CGPoint)
    {
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        print(zoomRect)
        scrollView.zoom(to: zoomRect, animated: true)
    }
        
    @IBAction func SliderZoom(_ sender: UISlider) {
        scrollView.zoomScale = CGFloat(sender.value)
        
    }
    
        
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
 
    return photo
    
        
        
        
}


}
