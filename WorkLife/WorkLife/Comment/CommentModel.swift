//
//  CommentModel.swift
//  WorkLife
//
//  Created by 조세연 on 6/15/24.
//

import Foundation

struct CommentModel: Identifiable {
    let id = UUID()
    
    let Color: Int
    let Date: String
    let Weather: Int
    let Image: String
    let Content: String
    
}
