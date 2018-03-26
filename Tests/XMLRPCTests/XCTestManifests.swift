import XCTest

extension XMLRPCTests {
    static let __allTests = [
        ("testRequest", testRequest),
        ("testResponse", testResponse),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(XMLRPCTests.__allTests),
    ]
}
#endif
