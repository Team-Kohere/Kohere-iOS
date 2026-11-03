//
//  PushDeviceClient.swift
//  Kohere
//
//  Created by 송규섭 on 9/1/26.
//

import Dependencies

public struct PushDeviceClient: Sendable {
    /// 현재 설치본(installationId)의 FCM 토큰을 서버에 등록·갱신한다. 멱등이며 성공 시 본문 없이 204를 받는다.
    public var registerDevice: @Sendable (_ installationId: String, _ fcmToken: String) async throws -> Void

    /// 현재 설치본을 푸시 발송 대상에서 제거한다. 이미 없거나 다른 사용자의 기기여도 멱등하게 204를 받는다.
    public var unregisterDevice: @Sendable (_ installationId: String) async throws -> Void

    public init(
        registerDevice: @escaping @Sendable (_ installationId: String, _ fcmToken: String) async throws -> Void,
        unregisterDevice: @escaping @Sendable (_ installationId: String) async throws -> Void
    ) {
        self.registerDevice = registerDevice
        self.unregisterDevice = unregisterDevice
    }
}

extension PushDeviceClient: TestDependencyKey {
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
