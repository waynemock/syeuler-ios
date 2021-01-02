//
//  ProblemRow.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

struct ProblemRow: View {
	let problem: Problem

	var body: some View {
		VStack(alignment: .leading, spacing: 4.0) {
			ProblemTitle(problem: problem)
				.foregroundColor(.main)
			switch problem.state {
			case .completed:
				ProblemCompletedOn(problem: problem)
			case .inProgress:
				ProblemStartedOn(problem: problem)
			}
		}
		.padding(4)
	}
}

struct ProblemRow_Previews: PreviewProvider {
    static var previews: some View {
		ProblemRow(problem: Problem1())
		ProblemRow(problem: Problem2())
    }
}
