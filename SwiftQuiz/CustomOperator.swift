//
//  CustomOperator.swift
//  SwiftQuiz
//
//  Created by marco willy on 29/11/20.
//

import Foundation

postfix operator ++
postfix func ++ (lhs: inout Int) {
    lhs += 1
}
