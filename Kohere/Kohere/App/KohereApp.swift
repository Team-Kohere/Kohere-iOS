//
//  KohereApp.swift
//  Kohere
//
//  Created by 송규섭 on 6/11/26.
//

import ComposableArchitecture
import GoogleSignIn
import SwiftUI

@main
struct KohereApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate

    init() {
        TabBarAppearanceConfigurator.configure()
    }

    var body: some Scene {
        WindowGroup {
            // 단위 테스트의 호스트로 실행될 때는 루트 화면을 띄우지 않는다.
            // 띄우면 시작 동작(홈·지도 조회)이 테스트 중에 실행되어 관계없는 테스트가 실패로 기록된다.
            if isTesting {
                EmptyView()
            } else {
                RootView(
                    store: Store(initialState: makeInitialState()) {
                        RootFeature()
                    }
                )
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
            }
        }
    }

    private func makeInitialState() -> RootFeature.State {
        return RootFeature.State()
    }
}
