//
//  ScannerVC+Ext.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Mark Battistella on 13/8/21.
//

import UIKit
import AVFoundation

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
	
	func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
		
		guard let object = metadataObjects.first else {
			scannerDelegate?.didSurface(error: .invalidScannedValue)
			return
		}
		
		guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
			scannerDelegate?.didSurface(error: .invalidScannedValue)
			return
		}
		
		guard let barcode = machineReadableObject.stringValue else {
			scannerDelegate?.didSurface(error: .invalidScannedValue)
			return
		}
		
		scannerDelegate?.didFind(barcode: barcode)
	}
}
