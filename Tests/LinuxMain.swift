import XCTest

import HKDFTests

var tests = [XCTestCaseEntry]()
tests += HKDFTests.allTests()
XCTMain(tests)
