//
//  ListingItemModel.swift
//  Kohere
//
//  Created by soomin on 6/23/26.
//

import Foundation

public struct ListingItemModel: Equatable, Identifiable {
    public let id: String
    public let title: String
    public let thumbnailURL: String?
    public let formattedPrice: String
    public let formattedUsdPrice: String
    public let detailsDescription: String
    public let locationDescription: String
    public let typeTag: String
    public let period: String
    public var isLiked: Bool
    public var favoriteCount: Int?

    public var listingID: String { id }

    public nonisolated init(
        id: String,
        title: String = "",
        thumbnailURL: String? = nil,
        formattedPrice: String,
        formattedUsdPrice: String,
        detailsDescription: String,
        locationDescription: String,
        typeTag: String,
        period: String,
        isLiked: Bool,
        favoriteCount: Int? = nil
    ) {
        self.id = id
        self.title = title
        self.thumbnailURL = thumbnailURL
        self.formattedPrice = formattedPrice
        self.formattedUsdPrice = formattedUsdPrice
        self.detailsDescription = detailsDescription
        self.locationDescription = locationDescription
        self.typeTag = typeTag
        self.period = period
        self.isLiked = isLiked
        self.favoriteCount = favoriteCount
    }

    public nonisolated init(
        id: Int,
        title: String = "",
        thumbnailURL: String? = nil,
        formattedPrice: String,
        formattedUsdPrice: String,
        detailsDescription: String,
        locationDescription: String,
        typeTag: String,
        period: String,
        isLiked: Bool,
        favoriteCount: Int? = nil
    ) {
        self.init(
            id: "\(id)",
            title: title,
            thumbnailURL: thumbnailURL,
            formattedPrice: formattedPrice,
            formattedUsdPrice: formattedUsdPrice,
            detailsDescription: detailsDescription,
            locationDescription: locationDescription,
            typeTag: typeTag,
            period: period,
            isLiked: isLiked,
            favoriteCount: favoriteCount
        )
    }
}
