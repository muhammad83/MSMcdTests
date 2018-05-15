import XCTest

import iosHelloWorldTests

var tests = [XCTestCaseEntry]()
tests += iosHelloWorldTests.allTests()
XCTMain(tests)