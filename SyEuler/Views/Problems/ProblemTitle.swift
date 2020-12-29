//
//  ProblemTitle.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//

import SwiftUI

struct ProblemTitle: View {
	var problem: Problem
	var body: some View {
		HStack {
			Text("\(problem.id): \(problem.title)")
				.font(.title2)
				.bold()
			if problem.state.isCompleted {
				Image(systemName: "checkmark.shield.fill")
					.font(.title2)
			}
			Spacer()
		}
	}
}

struct ProblemTitle_Previews: PreviewProvider {
    static var previews: some View {
        ProblemTitle(problem: Problem1())
    }
}
