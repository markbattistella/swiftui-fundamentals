//
//  BarcodeScannerViewModel.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Mark Battistella on 13/8/21.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
	
	@Published var scannedCode = ""
	@Published var alertItem: AlertItem?
	
	var statusText: String {
		scannedCode.isEmpty ? "Not yet scanned" : scannedCode
	}
	
	var statusTextColour: Color {
		scannedCode.isEmpty ? .red : .green
	}
	
}
