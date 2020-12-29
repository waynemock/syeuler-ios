//
//  EpBase.swift
//  
//
//  Created by Wayne Mock on 12/28/20.
//

import Foundation

protocol EpBase: Identifiable {
	var description: String { get }
	var id: Int { get }
	var title: String { get }
	var url: URL? { get }
}

extension EpBase {
	public var url: URL? {
		return URL(string: "https://projecteuler.net/problem=\(id)")
	}
}
