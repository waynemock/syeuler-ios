//
//  ProblemTitle.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/29/20.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import SwiftUI

struct ProblemTitle: View {
	let font = Font.title3
	var problem: Problem
	var body: some View {
		HStack {
			Text("\(problem.id): \(problem.title)")
				.font(font)
				.bold()
			if problem.state.isCompleted {
				Image(systemName: "checkmark.shield.fill")
					.font(font)
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
