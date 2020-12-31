//
//  BundleExtension.swift
//  SyEmber
//
//  Created by Wayne Mock on 1/29/19.
//  Copyright © 2021 Syzygy Softwerks LLC. All rights reserved.
//

import UIKit

extension Bundle {

	struct Keys {
		// Info.plist keys
		static let Build = "CFBundleVersion"
		static let BuildType = "BUILD_TYPE"
		static let Version = "CFBundleShortVersionString"

		// BUILD_TYPE values
		static let AppStore = "APPSTORE"
		static let Prod = "PROD"
		static let Stage = "STAGE"
		static let Test = "TEST"
	}

	//--------------------------------------------------------------------------
	/// Returns the app version, combining the `CFBundleShortVersionString`
	/// and `CFBundleVersion` into a single string.
	var appVersion: String {
		let type = (isAppStoreBuild || buildType.isEmpty) ? "" : "_" + buildType
		return "\(version)\(type) (\(build))"
	}

	//--------------------------------------------------------------------------
	/// Returns the app version string suitable for displaying.
	var appVersionForDisplay: String {
		return String(format: NSLocalizedString("Version %@", comment: "The version of this app"), appVersion)
	}

	//--------------------------------------------------------------------------
	/// Returns the `CFBundleVersion` string from the Info.plist file.
	var build: String {
		guard let retVal = infoDictionary?[Keys.Build] as? String else { return "" }
		return retVal
	}

	//--------------------------------------------------------------------------
	/// Retruns the `BUILD_TYPE` string from the Info.plist file.
	var buildType: String {
		guard let retVal = infoDictionary?[Keys.BuildType] as? String else { return "" }
		return retVal
	}

	//--------------------------------------------------------------------------
	/// `true` if the current build is an App Store build, otherwise `false`.
	var isAppStoreBuild: Bool {
		return buildType == Keys.AppStore
	}

	//--------------------------------------------------------------------------
	/// `true` if the current build is a Production build or the build type
	/// cannot be determined, otherwise `false`.
	var isProductionBuild: Bool {
		// A production build is basically not a test, stage, or App Store build,
		// making it the default build type if one cannot be determined.
		return buildType != Keys.Test && buildType != Keys.Stage && buildType != Keys.AppStore
	}

	//--------------------------------------------------------------------------
	/// `true` if the current build is a Stage build, otherwise `false`.
	var isStageBuild: Bool {
		return buildType == Keys.Stage
	}

	//--------------------------------------------------------------------------
	/// `true` if the current build is a Test build, otherwise `false`.
	var isTestBuild: Bool {
		return buildType == Keys.Test
	}

	//--------------------------------------------------------------------------
	/// `true` if the current build uses the production API, otherwise `false`.
	var useProductionAPI: Bool {
		return isAppStoreBuild || isProductionBuild || isStageBuild
	}

	//--------------------------------------------------------------------------
	/// Retruns the `CFBundleShortVersionString` string from the Info.plist file.
	var version: String {
		guard let retVal = infoDictionary?[Keys.Version] as? String else { return "" }
		return retVal
	}
}
