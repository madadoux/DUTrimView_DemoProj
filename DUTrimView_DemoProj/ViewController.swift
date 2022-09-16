//
//  ViewController.swift
//  DUTrimView_DemoProj
//
//  Created by mohamed saeed on 16/09/2022.
//

import AVFoundation
import DUTrimVideoView
import UIKit
class ViewController: UIViewController, VideoTrimViewDelegate {
    func rangeSliderValueChanged(trimView: DUTrimVideoView, rangeSlider: DURangeSlider) {}

    func addDUTrimView() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!)
        let videoAsset = AVAsset(url: url)
        let viewModel = CachingViewModel(videoAsset: videoAsset)
        let trimView = DUTrimVideoView(asset: videoAsset, frame: CGRect(x: 20, y: 200, width: self.view.frame.width - 40, height: 100), viewModel:viewModel)
        trimView.delegate = self
        let rangeSlider = trimView.rangeSlider!
        rangeSlider.leftThumbImage = UIImage(named: "trim-right")
        rangeSlider.rightThumbImage = UIImage(named: "trim-left")
        rangeSlider.thumbWidth = 30
        rangeSlider.thumbHeight = 30
        rangeSlider.trackHighlightTintColor = UIColor.clear
        rangeSlider.trackBorderTintColor = .white
        rangeSlider.trackBorderWidth = 2
        self.view.addSubview(trimView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addDUTrimView()
    }
}
