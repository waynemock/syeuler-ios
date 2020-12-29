//
//  EpBase.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/28/20.
//

import Foundation

protocol PeBase: Identifiable {
	var description: String { get }
	var id: Int { get }
	var title: String { get }
	var url: URL? { get }
}

extension Pe1 {
	public var url: URL? {
		return URL(string: "https://projecteuler.net/problem=\(id)")
	}
}
