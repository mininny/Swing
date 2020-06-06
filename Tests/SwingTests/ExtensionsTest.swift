import XCTest
@testable import Swing

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
    
    func test_UIColor_UIColorToHex() {
        let blackColorHex = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).toHexString()
        XCTAssertEqual(blackColorHex, "#000000")
        
        let whiteColorHex = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).toHexString().uppercased()
        XCTAssertEqual(whiteColorHex, "#FFFFFF")
        
        let blackColor = UIColor(fromHex: "000000")
        XCTAssertEqual(blackColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        let whiteColor = UIColor(fromHex: "#ffffff")
        XCTAssertEqual(whiteColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }

    static var allTests = [
        ("test_collection_exists", test_collection_exists),
        ("test_collection_merge", test_collection_merge),
    ]
}
