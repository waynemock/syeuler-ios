//
//  ProblemCompletedOn.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

struct ProblemCompletedOn: View {
	var problem: Problem
    var body: some View {
		HStack {
			if let completedAt = problem.completedAt {
				let days = problem.daysToComplete
				switch days {
				case 0:
					Text("Completed on \(completedAt, formatter: Problem.dateFormatter) in less than a day")
						.font(.subheadline)
				case 1:
					Text("Completed on \(completedAt, formatter: Problem.dateFormatter) in \(days) day")
						.font(.subheadline)
				default:
					Text("Completed on \(completedAt, formatter: Problem.dateFormatter) in \(problem.daysToComplete) days")
						.font(.subheadline)
				}
				Spacer()
			}
		}
    }
}

struct ProblemCompletedOn_Previews: PreviewProvider {
    static var previews: some View {
		ProblemCompletedOn(problem: Problem1())
    }
}
