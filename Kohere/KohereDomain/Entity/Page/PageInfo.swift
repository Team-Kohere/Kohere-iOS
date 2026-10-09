//
//  PageInfo.swift
//  Kohere
//
//  Created by Codex on 8/6/26.
//

/// 서버 페이지네이션 응답의 공통 메타 정보.
///
/// 매물 검색, 진단 추천, 예약 목록이 모두 같은 규격을 사용하므로 도메인별로 나누지 않고 하나로 둔다.
/// DTO에서 이 타입으로 변환하는 방식은 응답 필드가 도메인마다 달라 각 Repository가 담당한다.
public nonisolated struct PageInfo: Equatable, Sendable {
    public let number: Int?
    public let size: Int?
    public let totalElements: Int?
    public let totalPages: Int?
    public let hasNext: Bool?

    public init(
        number: Int?,
        size: Int?,
        totalElements: Int?,
        totalPages: Int?,
        hasNext: Bool?
    ) {
        self.number = number
        self.size = size
        self.totalElements = totalElements
        self.totalPages = totalPages
        self.hasNext = hasNext
    }
}
