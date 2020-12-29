//
//  EpBase.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/28/20.
//

import Foundation

class Problem: Identifiable {

	static let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		return formatter
	}()


	enum State: String {
		case completed, inProgress

		var isCompleted: Bool { return self == .completed }

		var label: String {
			switch self {
			case .completed: return "Completed"
			case .inProgress: return "In progress"
			}
		}
	}

	public var id: Int { return 0 }
	public var title: String { return "" }
	public var summary: String { return "" }

	public var state: State { return .inProgress }
	public var startedAt: Date? { return nil }
	public var completedAt: Date? { return nil }

	public var daysToComplete: Int {
		guard let startedAt = startedAt, let completedAt = completedAt,
			  let days = Calendar.current.dateComponents([.day], from: startedAt, to: completedAt).day else { return -1 }
		return max(days, 1)
	}

	public var sourceUrl: URL { return URL(string: "https://github.com/waynemock/syeuler-ios/blob/main/SyEuler/Problems/Pe\(id).swift")! }
	public var url: URL { return URL(string: "https://projecteuler.net/problem=\(id)")! }
}

