//
//  RSTabBar
//
//  Created by Radu Ursache
//

import Foundation

public struct TabItem: Codable, Equatable, Hashable {
	public let index: Int
	public let title: String
	public let icon: String
	
	public init(index: Int, title: String, icon: String) {
		self.index = index
		self.title = title
		self.icon = icon
	}
}
