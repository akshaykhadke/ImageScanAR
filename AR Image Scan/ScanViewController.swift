//
//  ScanViewController.swift
//  //
//  
//

import UIKit
import SceneKit
import ARKit
import AVFoundation
import SpriteKit

@available(iOS 11.311.3, *)
class ScanViewController: UIViewController , ARSCNViewDelegate{
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var viewCorner: UIView!
    
    var videoPlayer = AVPlayer()
    
    var isFirstTime = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        
        let scene = SCNScene()
        // Set the scene to the view
        sceneView.scene = scene
        self.navigationController?.navigationBar.isHidden = true
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.videoPlayer.currentItem, queue: .main) { [weak self] _ in
            
            
            NotificationCenter.default.removeObserver(self)
            if self!.isFirstTime
            {
                self!.isFirstTime = false
                let HomeVC = self!.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                
                self!.navigationController?.pushViewController(HomeVC, animated: true)
            }
            
        }
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        if #available(iOS 12.0, *) {
            let configuration = ARImageTrackingConfiguration()
            
            
            guard let arImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
            configuration.trackingImages = arImages
            configuration.maximumNumberOfTrackedImages = 1
            
            // Run the view's session
            
            sceneView.session.run(configuration)
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        self.videoPlayer.pause()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRenderScene scene: SCNScene, atTime time: TimeInterval) {
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        if let imageAnchor = anchor as? ARImageAnchor {
            
            print("image width = \(imageAnchor.isTracked)")
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            print("image width = \(imageAnchor.isTracked)")
            
            if imageAnchor.isTracked
            {
                self.videoPlayer.play()
                sceneView.session.add(anchor: anchor)
            }
            else{
                self.videoPlayer.pause()
                //node.removeFromParentNode()
                
                
                
                sceneView.session.remove(anchor: anchor)
            }
            
        }
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor {
            
            var isLandscape = true
            
           
                
             if imageAnchor.referenceImage.name == "Cocktail Party"
            {
                
                guard let url = Bundle.main.url(forResource: "Cocktail_Party",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "Cocktail_Party_friends"
            {
                
                guard let url = Bundle.main.url(forResource: "Cocktail_Party_friends",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "Dinosaur"
            {
                
                guard let url = Bundle.main.url(forResource: "Dinosaur",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "DJ_Old_Couple"
            {
                
                guard let url = Bundle.main.url(forResource: "DJ_Old_Couple",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "DJ_Solo"
            {
                
                guard let url = Bundle.main.url(forResource: "DJ_Solo",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "DJ_Solo_lady"
            {
                
                guard let url = Bundle.main.url(forResource: "DJ_Solo_lady",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "Fireworks"
            {
                
                guard let url = Bundle.main.url(forResource: "Fireworks",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "Fireworks_night"
            {
                
                guard let url = Bundle.main.url(forResource: "Fireworks_night",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
                
            else if imageAnchor.referenceImage.name == "running_guy_Dinosaur"
            {
                
                guard let url = Bundle.main.url(forResource: "running_guy_Dinosaur",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            ///
            else if imageAnchor.referenceImage.name == "Scubadiving"
            {
                
                guard let url = Bundle.main.url(forResource: "Scubadiving",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "Scubadiving_single"
            {
                
                guard let url = Bundle.main.url(forResource: "Scubadiving_single",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "Skiing"
            {
                
                guard let url = Bundle.main.url(forResource: "Skiing",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "Skiing_guy"
            {
                
                guard let url = Bundle.main.url(forResource: "Skiing_guy",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "Surfing"
            {
                
                guard let url = Bundle.main.url(forResource: "Surfing",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "Surfing_friends"
            {
                
                guard let url = Bundle.main.url(forResource: "Surfing_friends",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "Waterpark_family"
            {
                
                guard let url = Bundle.main.url(forResource: "Waterpark_family",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "DJ_Couple"
            {
                
                guard let url = Bundle.main.url(forResource: "DJ_Couple",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            else if imageAnchor.referenceImage.name == "Waterpark"
            {
                
                guard let url = Bundle.main.url(forResource: "Waterpark",   withExtension: "mp4") else {
                    return node
                }
                videoPlayer = AVPlayer(url: url)
                
            }
            
            var plane = SCNPlane()
            
            
            plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = videoPlayer
            videoPlayer.play()
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
        }
        return node
    }
    
    
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        
        let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        self.navigationController?.pushViewController(HomeVC, animated: true)
    }
    
}

