//
//  StringExtension.swift
//  PlugProject
//
//  Created by zero on 2018/8/15.
//  Copyright © 2018年 zero. All rights reserved.
//

extension String {
    
    /// 16进制转int类型的10进制
    ///
    /// - Returns:
    func hexStringToInt() -> Int {
        var str = self.uppercased()
        if str[1] == "X" {
            str = str[2..<str.count]
        }
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
    
    // str[1]
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    // str[1]
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    // str[1..<5]
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start..<end])
    }
    
    // str[1...5]
    subscript (r: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start...end])
    }
    
}
