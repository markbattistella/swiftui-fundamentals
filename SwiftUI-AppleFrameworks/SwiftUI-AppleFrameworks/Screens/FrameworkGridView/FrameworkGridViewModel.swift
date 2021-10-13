//
//  FrameworkGridViewModel.swift
//  SwiftUI-AppleFrameworks
//
//  Created by Mark Battistella on 13/10/21.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
	
	var selectedFramework: Framework? {
		didSet { isShowingDetailView = true }
	}

	@Published var isShowingDetailView = false

	let columns: [GridItem] = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]
}
