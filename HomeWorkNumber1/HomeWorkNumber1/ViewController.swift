//
//  ViewController.swift
//  HomeWorkNumber1
//
//  Created by Emil on 19.04.2022.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var isRealLightOn = false
    private var count = 0 {
        didSet {
            if count == 3 { count = 0}
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    // MARK: - Methods
    
    /// Create Button for control the Device Torch
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        let widht: CGFloat = 200
        let height: CGFloat = 50
        button.frame = CGRect (x: self.view.frame.midX - widht / 2, y: self.view.frame.maxY - self.view.frame.midY/2, width: widht, height: height)
        button.backgroundColor = .black
        button.setTitle("Torch on", for: .normal)
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(nil, action: #selector(buttonAction), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        buttonPressed()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonPressed()
    }
    
    /// Turn On/Off the Device Torch and Switch the Button Title.
    @objc private func buttonAction() {
        let title: String = isRealLightOn ? "Torch off": "Torch on"
        button.setTitle(title, for: .normal)
        
        isRealLightOn.toggle()
        updateRealLightState()
    }
    
    /// Control the Device Torch Status.
    private func updateRealLightState() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if let dev = device, dev.hasTorch {
            do {
                try dev.lockForConfiguration()
                dev.torchMode = isRealLightOn ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print(error)
            }
        } else {
            print("Device Has No Torch.")
        }
    }
    
    /// Update the Screen Color
    @IBAction func buttonPressed() {
        switch count {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .yellow
        case 2:
            view.backgroundColor = .green
        default:
            break
        }
        count += 1
    }
}
