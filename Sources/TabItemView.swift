//
//  RSTabBar
//
//  Created by Radu Ursache
//

import SwiftUI

public struct TabItemView: View {
	
	var model: TabItem
	@Binding var selectedTab: TabItem
	var selectedColor: Color?
	
	private var isSelected: Bool {
		return selectedTab == model
	}
	
	public var body: some View {
		Button {
			selectedTab = model
		} label: {
			VStack(alignment: .center, spacing: 0) {
				Spacer()
				
				Image(systemName: model.icon)
					.aspectRatio(contentMode: .fit)
					.font(.system(size: 22))
					.foregroundColor(isSelected ? (selectedColor ?? .accentColor) : .gray)
					.frame(width: 32, height: 32, alignment: .center)

				Text(String(model.title.prefix(15)))
					.font(.system(size: 14))
					.multilineTextAlignment(.center)
					.fixedSize()
					.foregroundColor(isSelected ? (selectedColor ?? .accentColor) : .gray)

				Spacer()
			}
			.frame(height: 58)
		}
		.frame(width: 45)
	}
}
