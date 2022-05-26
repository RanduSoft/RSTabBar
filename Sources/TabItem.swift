//
//  RSTabBar
//
//  Created by Radu Ursache
//

import UIKit

public struct TabItem: Codable, Equatable, Hashable {
	public let index: Int
	public let title: String
	public let icon: String
	public let iconSelected: String?
	
	public init(index: Int, title: String, icon: String, iconSelected: String? = nil) {
		self.index = index
		self.title = title
		self.icon = icon
		self.iconSelected = iconSelected
	}
}
