//
//  CommunityVIew.swift
//  WorkLife
//
//  Created by 조세연 on 6/15/24.
//

import SwiftUI

struct CommunityView: View {
    //    @Binding var selectColor: Int
    @State private var selectedColor: Int = 0
    @State var isModalPresented: Bool = false
    @State private var isActive = false
    
    var body: some View {
        VStack {
            HStack {
//                Text("자랑 일기")
//                    .frame(width: 64, height: 21)
//                    .font(.mainTitle)
                //            Image("")
                //            List {
                //                Text("1")
                //                Text("2")
                //            }.listStyle(.sidebar)
                
                VStack {
                    Menu {
                        Button("전체보기") {

                        }
                        Button("Yellow") {

                        }
                        Button("Green") {

                        }
                    } label: {
                        HStack{
                            Text("참잘했어요")
                            Image.YGDot
                            Text("\(Image(systemName: "chevron.down"))")
                        }
                    } .font(.mainTitle)
                        .accentColor(.black)
                }
                
                Spacer()
                Button(action: {
                    isModalPresented.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                        .frame(width: 21, height: 21)
                })
            }
            .padding()
            HStack {
                ScrollView(.vertical) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 371, height: 317)
                            .foregroundStyle(selectedColor == 0 ? Color(hex:"F5EDC5") : Color(hex:"C2DDB5"))
                        VStack {
                            HStack {
                                Text("2024년 6월 15일 토요일")
                                Spacer()
                                Text("날씨 맑음")
                            }
                            .padding(20)
                            Spacer()
                            Text("하...너무 어렵고도 어려운 나날이다...")
                        }
                        .onTapGesture {
                            isActive = true
                        }
                        NavigationLink(
                                           destination: CommentView(),
                                           isActive: $isActive,
                                           label: {
                                               EmptyView()
                                           }
                                       )
                                       .frame(width: 0, height: 0)
                                       .hidden()
                        .font(.mainBody)
                        .padding()
                        .frame(width: 371, height: 317)
                        
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 371, height: 317)
                            .foregroundStyle(selectedColor == 0 ? Color(hex:"F5EDC5") : Color(hex:"C2DDB5"))
                        VStack {
                            HStack {
                                Text("2024년 6월 10일 목요일")
                                Spacer()
                                Text("날씨 비옴")
                            }
                            .padding(20)
                            Spacer()
                            Text("앙 배고팡")
                        }
                        .font(.mainBody)
                        .padding()
                        .frame(width: 371, height: 317)
                        
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 371, height: 317)
                            .foregroundStyle(selectedColor == 0 ? Color(hex:"F5EDC5") : Color(hex:"C2DDB5"))
                        VStack {
                            HStack {
                                Text("2024년 6월 1일 토요일")
                                Spacer()
                                Text("날씨 화창")
                            }
                            .padding(20)
                            Spacer()
                            Text("오늘은 연을 날렸다 우하하")
                        }
                        .font(.mainBody)
                        .padding()
                        .frame(width: 371, height: 317)
                        
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 371, height: 317)
                            .foregroundStyle(selectedColor == 0 ? Color(hex:"F5EDC5") : Color(hex:"C2DDB5"))
                        VStack {
                            HStack {
                                Text("2024년 6월 1일 토요일")
                                Spacer()
                                Text("날씨 눈")
                            }
                            .padding(20)
                            Spacer()
                            Text("오늘은 개발을 성공했다!!!!!!!!!!!!!! 최고")
                        }
                        .font(.mainBody)
                        .padding()
                        .frame(width: 371, height: 317)
                        
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 371, height: 317)
                            .foregroundStyle(selectedColor == 0 ? Color(hex:"F5EDC5") : Color(hex:"C2DDB5"))
                        VStack {
                            HStack {
                                Text("2024년 6월 1일 토요일")
                                Spacer()
                                Text("날씨 화창")
                            }
                            .padding(20)
                            Spacer()
                            Text("하...오늘은 잘 안됐는데 격려해주셔 그나마 나아졌당...~")
                        }
                        .font(.mainBody)
                        .padding()
                        .frame(width: 371, height: 317)
                        
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
        .sheet(isPresented: $isModalPresented) {
            PictureDiaryView(isPresented: $isModalPresented)
        }
    }
}

#Preview {
    CommunityView()
}
