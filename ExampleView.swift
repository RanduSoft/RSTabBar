//
//  RSTabBar
//
//  Created by Radu Ursache
//

import SwiftUI
import RSTabBar

struct ExampleView: View {
	
	static let tabs = [
		TabItem(index: 0, title: "Home", icon: "house"),
		TabItem(index: 1, title: "Items", icon: "list.dash"),
		TabItem(index: 2, title: "More", icon: "bolt.car")
	]
	
	@State var tabBarVisible: Bool = true
	
	@State var tabs = DemoView.tabs
	@State var selectedTab: TabItem = DemoView.tabs.first!
	
	var body: some View {
		RSTabBar(
			tabs: $tabs,
			selectedTab: $selectedTab,
			tabBarVisible: $tabBarVisible,
			tabBarShowSeparator: true,
			tabBarBackgroundColor: .white.opacity(0.75),
			tabBarSelectedItemColor: .red
		) {
			
			HStack {
				Spacer()
				VStack(spacing: 12) {
					Text("First view")
						.font(.title).bold()
						.padding()
					Button("\(tabBarVisible ? "Hide" : "Show") tab bar") {
						withAnimation(.interactiveSpring()) {
							self.tabBarVisible.toggle()
						}
					}
					Button("Switch to random tab") {
						self.selectedTab = self.tabs.randomElement()!
					}
					Spacer()
				}
				Spacer()
			}
			.background(Color(uiColor: .systemGroupedBackground))
			.tag(self.tabs[0])
			
			ListViewDemo(tabBarVisible: $tabBarVisible)
				.tag(self.tabs[1])
			
			Text("Third view")
				.font(.title).bold()
				.padding()
				.tag(self.tabs[2])
		}
	}
}

struct ListViewDemo: View {
	@Binding var tabBarVisible: Bool
	
	var body: some View {
		NavigationView {
			List {
				ForEach(0...50, id: \.self) { number in
					NavigationLink {
						List {
							ForEach(50...100, id: \.self) { number in
								NavigationLink {
									Text("It works!")
								} label: {
									Text("\(number)")
								}
							}
						}
						.navigationTitle("2nd View")
						.navigationBarTitleDisplayMode(.inline)
						.onAppear {
							self.tabBarVisible = false
						}
					} label: {
						Text("\(number)")
					}
				}
			}
			.onAppear {
				self.tabBarVisible = true
			}
			.navigationTitle("Large Title Here")
		}
	}
}
