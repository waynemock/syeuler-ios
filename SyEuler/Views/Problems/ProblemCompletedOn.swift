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
				if days == 1 {
					Text("Completed on \(completedAt, formatter: ProblemRow.itemFormatter) in \(problem.daysToComplete) day")
						.font(.subheadline)
				} else {
					Text("Completed on \(completedAt, formatter: ProblemRow.itemFormatter) in \(problem.daysToComplete) days")
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
