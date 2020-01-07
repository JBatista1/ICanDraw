//
//  FaceCapture.swift
//  ICanDraw
//
//  Created by Joao Batista on 07/01/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import Foundation
import AVFoundation
import Vision
import UIKit

class FaceCapture: NSObject {
    let session = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    let view: UIView
    //Cria uma threde separada para se trabalhar em paralelo e não precisar bloquear o Dispositivo
    
    let dataOutputQueue = DispatchQueue(
       label: "video data queue",
       qos: .userInitiated,
       attributes: [],
       autoreleaseFrequency: .workItem)
    
    init(view: UIView) {
        self.view = view
    }
    func configureCaptureSession() {
      // Define the capture device we want to use
      guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                 for: .video,
                                                 position: .front) else {
        fatalError("No front video camera available")
      }
      
      // Connect the camera to the capture session input
      do {
        let cameraInput = try AVCaptureDeviceInput(device: camera)
        session.addInput(cameraInput)
      } catch {
        fatalError(error.localizedDescription)
      }
      
      // Create the video data output
      let videoOutput = AVCaptureVideoDataOutput()
      videoOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)
      videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
      
      // Add the video output to the capture session
      session.addOutput(videoOutput)
      
      let videoConnection = videoOutput.connection(with: .video)
      videoConnection?.videoOrientation = .portrait
      
      // Configure the preview layer
      previewLayer = AVCaptureVideoPreviewLayer(session: session)
      previewLayer.videoGravity = .resizeAspectFill
      previewLayer.frame = view.bounds
      view.layer.insertSublayer(previewLayer, at: 0)
    }
}
extension FaceCapture: AVCaptureVideoDataOutputSampleBufferDelegate {
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
  }
}
