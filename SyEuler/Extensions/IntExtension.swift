//
//  IntExtension.swift
//  SyEuler
//
//  Created by Wayne Mock on 1/1/21.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import Foundation

func pow(_ lhs: Int, _ rhs: Int) -> Int {
	return Int(pow(Double(lhs), Double(rhs)))
}

