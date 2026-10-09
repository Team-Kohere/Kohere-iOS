//
//  ListingSearchResult.swift
//  Kohere
//
//  Created by Codex on 7/5/26.
//

public struct ListingSearchPage: Equatable, Sendable {
    public let content: [Listing]
    public let page: PageInfo?

    public init(
        content: [Listing],
        page: PageInfo?
    ) {
        self.content = content
        self.page = page
    }
}
