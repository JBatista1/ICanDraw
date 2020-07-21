//
//  AdjustSensitivityViewController.swift
//  ICanDraw
//
//  Created by Joao Batista on 07/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit
import AVFoundation
import Vision

class AdjustSensitivityViewController: UIViewController {
    let session = AVCaptureSession()
    let customView = AdjustSensitivity(frame: .zero)
    var faceCapture: FaceCapture!
    var sequenceHandler = VNSequenceRequestHandler()
    let math = MathLib()
    let sensibility: CGFloat = 20.0
    var orientationVideo = CGImagePropertyOrientation.down
    var count = 0
    
    var cursor: CursorPosition!
    
    let dataOutputQueue = DispatchQueue(
        label: "video data queue",
        qos: .userInteractive,
        attributes: [],
        autoreleaseFrequency: .workItem)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCaptureSession()
        
        session.startRunning()
        let screen = UIScreen.main.bounds
        let positionInitial = CGPoint(x: screen.width / 2, y: screen.height / 2)
        cursor = CursorPosition(sensibinity: 10.0, decimalPlace: 100, initialPosition: positionInitial)
        
    }
    override func loadView() {
        view = customView
    }
    //Verificar orientacao do dispositivo
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let orientation = UIDevice.current.orientation
        if orientation == .landscapeLeft {
            orientationVideo = .up
        } else {
            orientationVideo = .down
        }
    }
    
    func configureCaptureSession() {
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                   for: .video,
                                                   position: .front) else {
                                                    fatalError("No front video camera available")
        }
       
        do {
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            session.addInput(cameraInput)
        } catch {
            fatalError(error.localizedDescription)
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        let videoInut = AVCaptureVideoOrientation.landscapeLeft
        videoOutput.connection(with: .video)?.videoOrientation = videoInut
        videoOutput.connection(with: .video)?.preferredVideoStabilizationMode = AVCaptureVideoStabilizationMode.auto
       
        videoOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)
        session.addOutput(videoOutput)
        
    }
    
}

extension AdjustSensitivityViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        let detectFaceRequest = VNDetectFaceLandmarksRequest(completionHandler: detectedFace)

        do {
            try sequenceHandler.perform(
                [detectFaceRequest],
                on: imageBuffer,
                orientation: orientationVideo)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func detectedFace(request: VNRequest, error: Error?) {
        guard let results = request.results as? [VNFaceObservation] else { return}
        
        if let landmark = results.first?.landmarks?.nose {
            
            guard let point = landmark.normalizedPoints.first else { return }
            DispatchQueue.main.async {
                let newPosition = self.cursor.moveTo(usingPoint: point)
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .transitionCrossDissolve, animations: {
                    self.customView.faceView.center = newPosition
                }, completion: nil)
            }
        }
    }
}
//0.0075491033
