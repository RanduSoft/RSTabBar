//
//  RSTabBar
//
//  Created by Radu Ursache
//

import SwiftUI

public struct RSTabBar<Content: View>: View {
	
	@Environment(\.colorScheme) var colorScheme
	
	@Binding var tabs: [TabItem]
	@Binding var selectedTab: TabItem
	@Binding var tabBarVisible: Bool
	
	var tabBarShowSeparator: Bool?
	var tabBarBackgroundColor: Color?
	var tabBarSelectedItemColor: Color?
	
	let content: Content
	
	public init(tabs: Binding<[TabItem]>, selectedTab: Binding<TabItem>, tabBarVisible: Binding<Bool>, tabBarShowSeparator: Bool? = nil, tabBarBackgroundColor: Color? = nil, tabBarSelectedItemColor: Color? = nil, @ViewBuilder content: @escaping () -> Content) {
		self._tabs = tabs
		self._selectedTab = selectedTab
		self._tabBarVisible = tabBarVisible
		self.tabBarShowSeparator = tabBarShowSeparator
		self.tabBarBackgroundColor = tabBarBackgroundColor
		self.tabBarSelectedItemColor = tabBarSelectedItemColor
		self.content = content()
		
		// make the original tabbar transparent
		let tabAppearance = UITabBarAppearance()
		tabAppearance.configureWithTransparentBackground()
		UITabBar.appearance().standardAppearance = tabAppearance
		UITabBar.appearance().scrollEdgeAppearance = tabAppearance
	}
	
	public var body: some View {
		ZStack(alignment: .bottom) {
			TabView(selection: $selectedTab) {
				content
			}
			
			VStack(spacing: 0) {
				if tabBarVisible {
					if tabBarShowSeparator ?? true {
						HStack {
							Spacer()
								.frame(height: 1)
								.background(Color.gray.opacity(0.25))
						}
					}
					
					HStack(alignment: .center) {
						ForEach(tabs, id:\.self) { tab in
							if tab.index == 0 {
								Spacer()
							}
							
							TabItemView(model: tab, selectedTab: $selectedTab, selectedColor: tabBarSelectedItemColor)
							
							Spacer()
						}
					}
					.background(tabBarBackgroundColor ?? (colorScheme == .dark ? .black : .white))
				}
			}
		}.safeAreaInset(edge: .bottom) {
			if tabBarVisible {
				HStack(alignment: .center, spacing: 0) {
					Spacer(minLength: 0).frame(maxWidth: .infinity)
				}.background(tabBarBackgroundColor ?? (colorScheme == .dark ? .black : .white))
			}
		}
	}
}
