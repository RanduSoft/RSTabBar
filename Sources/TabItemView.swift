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
	
	private var tabTitle: String {
		return String(model.title.prefix(15))
	}
	
	private var tabIcon: UIImage {
		var imageName = model.icon
		
		if isSelected {
			imageName = model.iconSelected ?? model.icon
		}
		
		return (UIImage(systemName: imageName) ?? UIImage(named: imageName)!).withRenderingMode(.alwaysTemplate)
	}
	
	private var tintColor: Color {
		if isSelected {
			return selectedColor ?? .accentColor
		}
		
		return .gray
	}
	
	public var body: some View {
		Button {
			selectedTab = model
		} label: {
			VStack(alignment: .center, spacing: 0) {
				Spacer()
				
				Image(uiImage: tabIcon)
					.if(!tabIconIsSfSymbol(), transform: {
						$0.resizable()
					})
					.aspectRatio(contentMode: .fit)
					.font(.system(size: 22))
					.foregroundColor(tintColor)
					.if(!tabIconIsSfSymbol(), transform: {
						$0.padding(4)
					})
					.frame(width: 32, height: 32, alignment: .center)

				Text(tabTitle)
					.font(.system(size: 13))
					.multilineTextAlignment(.center)
					.fixedSize()
					.foregroundColor(tintColor)

				Spacer()
			}
			.frame(height: 56)
		}
		.frame(width: 45)
	}
}

extension TabItemView {
	func tabIconIsSfSymbol() -> Bool {
		if isSelected {
			return UIImage(systemName: model.iconSelected ?? model.icon) != nil
		}
		return UIImage(systemName: model.icon) != nil
	}
}

fileprivate extension View {
	@ViewBuilder func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
		if condition {
			transform(self)
		}
		else {
			self
		}
	}
}
