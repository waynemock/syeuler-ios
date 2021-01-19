//
//  Problem.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/28/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
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
	public var defaultInput: String { return "" }
	public var inputPlaceholder: String { return "Enter a number" }
	public var references: [ProblemReference] { return [] }
	
	public var state: State { return .inProgress }
	public var startedAt: Date? { return nil }
	public var completedAt: Date? { return nil }

	public var daysToComplete: Int {
		guard let startedAt = startedAt, let completedAt = completedAt,
			  let days = Calendar.current.dateComponents([.day], from: startedAt, to: completedAt).day else { return -1 }
		return days
	}

	public var url: String { return "https://www.projecteuler.net/problem=\(id)" }
	public var sourceUrl: String { return "https://www.github.com/waynemock/syeuler-ios/blob/main/SyEuler/Problems/Problem\(id)Op.swift?ts=2" }

	public func getOp(inputs: [String], completion: @escaping ProblemOpCompletion) -> ProblemOp {
		return ProblemNoOp(inputs: inputs, completion: completion)
	}
}

class ProblemOpResults: ObservableObject {
	var answer: String?
	var isDone = false
	var precentComplete: Double?
	let started = Date()

	var elapsed: TimeInterval {
		return started.distance(to: Date())
	}
}

typealias ProblemOpCompletion = (_ progress: ProblemOpResults) -> Void

class ProblemOp: Operation {
	let inputs: [String]
	let completion: ProblemOpCompletion
	var results = ProblemOpResults()
	var lastProgressReport = TimeInterval(0)

	init(inputs: [String], completion: @escaping ProblemOpCompletion) {
		self.inputs = inputs
		self.completion = completion
	}

	override func main() {
		results = ProblemOpResults()
		lastProgressReport = results.elapsed
	}

	func report(progress: Double) {
		if lastProgressReport + 0.01 < results.elapsed {
			results.precentComplete = progress
			completion(results)
			lastProgressReport = results.elapsed
		}
	}
}

class ProblemNoOp: ProblemOp {
	override func main() {
		super.main()
		results.isDone = true
		results.answer = "No implementation yet..."
		completion(results)
	}
}

struct ProblemReference: Identifiable {
	var label: String
	var link = ""

	var url: URL? { return URL(string: link) }
	let id = UUID().uuidString
}

class ProblemQueue {
	private lazy var queue: OperationQueue = {
		var queue = OperationQueue()
		queue.name = "Problem Queue"
		queue.maxConcurrentOperationCount = 1
		return queue
	}()

	public var operationCount: Int {
		return queue.operationCount
	}

	public func start(op: ProblemOp) {
		queue.addOperation(op)
	}

	public func stop() {
		queue.cancelAllOperations()
	}
}

class ProblemIntOp: ProblemOp {

	func compute(target: Int) -> IntAnswer? {
		return nil
	}

	override func main() {
		super.main()
		if let target = Int(inputs[0]) {
			if let answer = compute(target: target) {
				results.answer = answer.asString
			} else {
				results.answer = "Canceled"
			}
		} else {
			results.answer = "NaN"
		}
		results.isDone = true
		results.precentComplete = nil
		self.completion(self.results)
	}
}

struct ProblemFormatter {

	static let intFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.usesGroupingSeparator = true
		return formatter
	}()

	static let nthFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = NumberFormatter.Style.ordinal
		formatter.usesGroupingSeparator = true
		return formatter
	}()

	static func format(int value: Int) -> String {
		return intFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
	}

	static func formatNth(int value: Int) -> String {
		return nthFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
	}
}

struct IntAnswer {
	var value: Int?
	var details: String?
	var error: String?

	var asString: String {
		var answers = [String]()
		if let value = value {
			answers.append("Answer: \(ProblemFormatter.format(int: value))")
		}
		if let details = details {
			answers.append(details)
		}
		if let error = error {
			answers.append(error)
		}
		return answers.joined(separator: "\n")
	}
}
