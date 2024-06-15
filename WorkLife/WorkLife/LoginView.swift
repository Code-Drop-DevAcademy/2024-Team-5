//
//  ContentView.swift
//  Happy
//
//  Created by 신혜연 on 6/15/24.
//

import SwiftUI

struct LoginView: View {
    @State private var password = ""
    //변수 초기화
    @State var colorCode : Int = -1
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: CommunityView(), isActive: $isActive){
                VStack{
                    Image.YGDot
                        .resizable()
                        .scaledToFill()
                        .frame(width: 34, height: 16)
                    
                    Text("자랑일기")
                        .font(.OnboardingTitle)
                    
                    Text("시작 코드를 입력해 주세요")
                        .font(.OnboardingBody)
                        .padding(.top, 55)
                    
                    SecureField("", text: $password, onCommit: performLogin)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 138)
                        .padding()
                    
                    //로그인 뷰에서 커뮤니티뷰로 트리거에 의해 네비게이션 전환
                    //                NavigationLink(destination: CommunityView(), isActive: $isActive) {
                    //                    LoginView()
                    //                }
                }
            }
        }
    }
    
    
    func postLogin() async {
        do {
            colorCode = try await LoginService.shared.PostLoginData(user_id: password)
            
            moveCommunity()
            
            
            print(colorCode)
        } catch {
            print("에러 발생: \(error)")
        }
    }
    
    func moveCommunity() {
        
        if colorCode == 0 || colorCode == 1 {
            isActive = true
        }
    }
    
    
    func performLogin() {
        Task {
            await postLogin()
        }
    }
}


//#Preview {
//    LoginView(colorCode: Int)
//}
