//
//  CommentView.swift
//  WorkLife
//
//  Created by kim kanghyeok on 6/15/24.
//

import SwiftUI

struct CommentView: View {
    
    @State private var selectedColor: Int = 0
    @State private var comments: [String] = []
    @State var text: String = ""
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 371, height: 317)
                        .foregroundStyle(selectedColor == 0 ? Color(hex:"F5EDC5") : Color(hex:"C2DDB5"))
                    VStack {
                        HStack {
                            Text("Date")
                            Spacer()
                            Text("날씨")
                        }
                        .padding(20)
                        Spacer()
                        Text("Contents")
                    }
                    .font(.mainBody)
                    .padding()
                    .frame(width: 371, height: 317)
                    
                }
                
                ForEach(comments, id:\.self) { comment in
                    HStack{
                        Image("GreenDot")
                            .resizable()
                            .frame(width: 17, height: 17)
                        ZStack{
                            Image("commentBox")
                                .resizable()
                                .frame(width: 337, height: 60)
                            Text(comment)
                        }
                    }
                }
            }
            Spacer()
        }
        .overlay(
            CommentWriteLayout(comments: $comments)
            , alignment: .bottom
        )
    }
}

fileprivate
struct Comment: Identifiable, Hashable {
    let id = UUID()
    let text: String
}

#Preview {
    CommentView()
}

