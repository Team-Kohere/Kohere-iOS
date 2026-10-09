//
//  PushDeviceInterface.swift
//  Kohere
//
//  Created by 송규섭 on 9/1/26.
//

import ComposableArchitecture

public protocol PushDeviceInterface {
    /// 현재 설치본(installationId)의 FCM 토큰을 서버에 등록·갱신한다. 멱등이며 성공 시 본문 없이 204를 받는다.
    func registerDevice(installationId: String, fcmToken: String) async throws

    /// 현재 설치본을 푸시 발송 대상에서 제거한다. 이미 없거나 다른 사용자의 기기여도 멱등하게 204를 받는다.
    func unregisterDevice(installationId: String) async throws
}

public struct PushDeviceClient: Sendable {
    public var registerDevice: @Sendable (_ installationId: String, _ fcmToken: String) async throws -> Void
    public var unregisterDevice: @Sendable (_ installationId: String) async throws -> Void
}

extension PushDeviceClient {
    public init(repository: any PushDeviceInterface) {
        self.init(
            registerDevice: { installationId, fcmToken in
                try await repository.registerDevice(installationId: installationId, fcmToken: fcmToken)
            },
            unregisterDevice: { installationId in
                try await repository.unregisterDevice(installationId: installationId)
            }
        )
    }
}

extension PushDeviceClient: DependencyKey {
    public static let liveValue = PushDeviceClient(
        registerDevice: { _, _ in },
        unregisterDevice: { _ in }
    )

    public static let testValue = PushDeviceClient(
        registerDevice: { _, _ in },
        unregisterDevice: { _ in }
    )
}

extension DependencyValues {
    public var pushDeviceClient: PushDeviceClient {
        get { self[PushDeviceClient.self] }
        set { self[PushDeviceClient.self] = newValue }
    }
}
