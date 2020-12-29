//
//  ProblemStartedOn.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import SwiftUI

struct ProblemStartedOn: View {
	var problem: Problem
	var body: some View {
		HStack {
			if let startedAt = problem.startedAt {
				Text("Started on \(startedAt, formatter: ProblemRow.itemFormatter)")
					.font(.subheadline)
			}
			Spacer()
		}
	}
}

struct ProblemStartedOn_Previews: PreviewProvider {
    static var previews: some View {
        ProblemStartedOn(problem: Problem1())
    }
}
