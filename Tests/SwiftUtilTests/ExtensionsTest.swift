import XCTest
@testable import SwiftUtil

final class ExtensionsTest: XCTestCase {
    
    func test_collection_exists() {
        let arr = [1,2,3]
        XCTAssertNil(arr[exists: 3])
        XCTAssertEqual(arr[exists: 0], 1)
        
        let dict = ["1":2, "3":4]
        XCTAssertNil(dict[exists: "2"])
        XCTAssertEqual(dict[exists: "1"], 2)
    }
    
    func test_collection_merge() {
        var intArr = [1: 1, 2: 2, 3: 3]
        
        intArr.merge(addingWith: [3: 3, 4: 4])
        XCTAssertEqual(intArr[3], 6)
        XCTAssertEqual(intArr[4], 4)
        XCTAssertEqual(intArr[1], 1)
        
        var strArr = ["1": 1.1, "2": 2.2, "3": 3.3]
        
        strArr.merge(addingWith: ["3": 3.3, "4": 4.4])
        XCTAssertEqual(strArr["3"], 6.6)
        XCTAssertEqual(strArr["4"], 4.4)
        XCTAssertEqual(strArr["1"], 1.1)
    }

    static var allTests = [
        ("test_collection_exists", test_collection_exists),
        ("test_collection_merge", test_collection_merge),
    ]
}
