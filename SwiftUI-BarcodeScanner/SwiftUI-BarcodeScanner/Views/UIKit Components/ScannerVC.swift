//
//  ScannerVC.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Mark Battistella on 12/8/21.
//

import UIKit
import AVFoundation


enum CameraError {
	case invalidDeviceInput
	case invalidScannedValue
}

protocol ScannerVCDelegate: AnyObject {
	func didFind(barcode: String)
	func didSurface(error: CameraError)
}

final class ScannerVC: UIViewController {
	let captureSession = AVCaptureSession()
	var previewLayer: AVCaptureVideoPreviewLayer?
	weak var scannerDelegate: ScannerVCDelegate?
	
	init(scannerDelegate: ScannerVCDelegate) {
		super.init(nibName: nil, bundle: nil)
		self.scannerDelegate = scannerDelegate
	}
	
	// storyboard
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	// run it
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCaptureSession()
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		guard let previewLayer = previewLayer else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		previewLayer.frame = view.layer.bounds
	}
	
	
	private func setupCaptureSession() {
		guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		let videoInput: AVCaptureDeviceInput
		
		do {
			try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
		} catch {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		if captureSession.canAddInput(videoInput) {
			captureSession.addInput(videoInput)
		} else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		let metaDataOutput = AVCaptureMetadataOutput()
		
		if captureSession.canAddOutput(metaDataOutput) {
			captureSession.addOutput(metaDataOutput)
			metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
			metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
		} else {
			scannerDelegate?.didSurface(error: .invalidDeviceInput)
			return
		}
		
		previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
		previewLayer!.videoGravity = .resizeAspectFill
		view.layer.addSublayer(previewLayer!)
		
		captureSession.startRunning()
	}
}
