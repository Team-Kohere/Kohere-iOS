//
//  InstallationIdClient.swift
//  Kohere
//
//  Created by 송규섭 on 9/3/26.
//

import Dependencies
import Foundation
import os

extension KeychainKey where Value == String {
    nonisolated static let installationId = Self(rawValue: "installationId")
}

public struct InstallationIdClient: Sendable {
    public var id: @Sendable () throws -> String

    public init(id: @escaping @Sendable () throws -> String) {
        self.id = id
    }
}

extension InstallationIdClient: DependencyKey {
    public static let liveValue: InstallationIdClient = {
        let provider = InstallationIdProvider()
        return InstallationIdClient(id: { try provider.id() })
    }()
}

public extension DependencyValues {
    var installationIdClient: InstallationIdClient {
        get { self[InstallationIdClient.self] }
        set { self[InstallationIdClient.self] = newValue }
    }
}

nonisolated private final class InstallationIdProvider: Sendable {
    private let keychainClient: KeychainClient
    private let cached = OSAllocatedUnfairLock<String?>(initialState: nil)

    init(keychainClient: KeychainClient = .liveValue) {
        self.keychainClient = keychainClient
    }

    func id() throws -> String {
        try cached.withLock { cached in
            if let cached { return cached }

            let identifier = try loadOrCreate()
            cached = identifier
            return identifier
        }
    }

    private func loadOrCreate() throws -> String {
        if let stored = try keychainClient.load(for: .installationId),
           stored.isEmpty == false {
            return stored
        }

        let identifier = UUID().uuidString.lowercased()
        try keychainClient.save(identifier, for: .installationId)

        return identifier
    }
}
