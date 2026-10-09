//
//  MapStateTypes.swift
//  Kohere
//
//  Created by Codex on 7/5/26.
//

import Foundation
import KohereCore
import KohereDomain

enum MapSheetMode: Equatable {
    case listingList
    case selectedListing
}

/// 목록과 마커를 어느 API 결과로 채우는지. appliedFilterSource와의 관계는 MapFeature.State 참고.
enum MapListingSource: Equatable {
    case idle
    case locationSearch
    case diagnosis
}

/// 지도 목록의 검색 모드와, 그 모드에서만 의미 있는 데이터.
/// 데이터를 연관값으로 들고 있어 모드를 바꾸면 이전 모드의 데이터가 함께 사라진다.
enum MapSearchMode: Equatable {
    case idle
    case locationSearch(MapLocationSearchState)
    case diagnosis(MapDiagnosisSearchState)
}

/// 페이지 단위 요청의 진행 상태. 지도 이탈·재진입 판단에 쓴다.
enum PagedRequestStatus: Equatable {
    /// 첫 페이지를 받은 적이 없다. 처음, 첫 페이지 조회 중 지도를 떠났거나 실패한 뒤.
    case idle
    case loadingFirstPage
    case loaded
    case loadingNextPage
}

/// 페이지 단위로 받는 요청 하나의 상태. 원소 타입만 다르고 나머지는 같다.
struct PagedRequest<Item: Equatable & Identifiable>: Equatable {
    var items: [Item] = []
    var pageInfo: PageInfo?
    var status: PagedRequestStatus = .idle

    var isLoading: Bool { status == .loadingFirstPage || status == .loadingNextPage }
    var hasNextPage: Bool { pageInfo?.hasNext == true }
    var nextPageNumber: Int { (pageInfo?.number ?? 0) + 1 }

    mutating func beginFirstPage() { status = .loadingFirstPage }
    mutating func beginNextPage() { status = .loadingNextPage }

    /// 응답 반영. 첫 페이지는 교체, 다음 페이지는 중복을 빼고 이어 붙인다.
    mutating func apply(_ page: [Item], pageInfo: PageInfo?, isFirstPage: Bool) {
        self.pageInfo = pageInfo
        if isFirstPage { items = page } else { items.appendUnique(contentsOf: page) }
        status = .loaded
    }

    /// 실패하거나 진행 중 요청이 끊겼을 때. 첫 페이지였으면 받은 적 없는 상태로, 다음 페이지였으면 받은 상태로 돌아간다.
    /// items는 건드리지 않는다. (첫 페이지 재조회 중 남겨둔 이전 카드는 재진입 재요청이 교체한다)
    mutating func settle() {
        switch status {
        case .loadingFirstPage: status = .idle
        case .loadingNextPage: status = .loaded
        case .idle, .loaded: break
        }
    }
}

/// 진단 마커(전체) 요청의 진행 상태. 페이지가 없어 상태만 있다.
enum MapMarkerRequestStatus: Equatable {
    /// 받은 적 없고 요청도 안 도는 상태. 재진입 시 다시 요청한다.
    case idle
    case loading
    case loaded
}

/// 위치 기반 일반 검색 모드의 데이터.
struct MapLocationSearchState: Equatable {
    /// 서버 원본. 화면용 `listings`는 이 값으로 계산한다.
    var results = PagedRequest<Listing>()
}

/// 진단 추천 모드의 데이터.
struct MapDiagnosisSearchState: Equatable {
    /// 지금 보고 있는 진단.
    var diagnosisID: Int
    /// 서버 원본. 화면용 `listings`는 이 값으로 계산한다.
    var recommendations = PagedRequest<DiagnosisRecommendedListing>()
    /// 마커 전체 요청. 결과 자체는 공통 필드 `markers`에 들어간다.
    var markerRequest: MapMarkerRequestStatus = .idle
}

/// 적용된 필터가 진단 조건인지. 표시용이며 목록 데이터 출처와는 별개다.
enum MapFilterApplicationSource: Equatable {
    case manual
    case diagnosis
}

/// 카메라가 멈췄을 때(viewport 변경) 무엇을 할지 정한다. 진입 경로가 알맞은 case를 넣어 두고, `MapFeature+Viewport`가 이 값만 보고 판단한다.
enum MapViewportSearchTrigger: Equatable {
    /// 아직 검색 기준 영역이 없다. 위치 검색은 첫 멈춤에 바로 검색하고, 진단은 첫 멈춤 영역을 재검색 기준으로 기록만 한다.
    /// 예: 지도 탭 첫 진입, 지도가 그려지기 전의 매물 둘러보기, 진단 진입
    case onFirstIdle
    /// 앱이 카메라를 옮겼다. 목표 좌표가 화면에 들어온 멈춤에서만 검색하고, 그 전 멈춤(초기 카메라 등)은 무시한다.
    /// 예: 장소 검색 결과 선택, 매물 상세의 지도 보기
    case onArrival(at: MapCoordinate)
    /// 한 번이라도 검색한 뒤의 평소 상태. 영역이 기준과 달라지면 재검색 버튼만 띄운다.
    /// 예: 사용자가 손으로 지도를 끌었을 때
    case manual(lastSearched: MapViewport)

    /// 마지막으로 검색한 영역. 아직 검색 전이면 nil이다.
    var lastSearchedViewport: MapViewport? {
        if case let .manual(viewport) = self { viewport } else { nil }
    }
}

struct MapCameraMoveRequest: Equatable {
    let coordinate: MapCoordinate
    let targetPosition: MapCameraTargetPosition
}

enum MapCameraTargetPosition: Equatable {
    case center
    case upper
}
