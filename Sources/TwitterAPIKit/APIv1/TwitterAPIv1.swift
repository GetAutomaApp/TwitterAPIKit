// TwitterAPIv1.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

/// Main class for accessing Twitter API v1.1 endpoints.
/// This class provides access to all Twitter API v1.1 functionality through specialized API clients.
/// Each property represents a group of related API endpoints.
open class TwitterAPIv1 {
    /// API client for managing Twitter account settings and profile information.
    public let account: AccountAPIv1
    
    /// API client for accessing application-level information and rate limits.
    public let application: ApplicationAPIv1
    
    /// API client for managing blocked and muted users.
    public let blockAndMute: BlockAndMuteAPIv1
    
    /// API client for managing Twitter collections (curated groups of tweets).
    public let collection: CollectionAPIv1
    
    /// API client for sending and receiving direct messages.
    public let directMessage: DirectMessageAPIv1
    
    /// API client for managing tweet favorites (likes).
    public let favorite: FavoriteAPIv1
    
    /// API client for managing user relationships (following/followers).
    public let friendships: FriendshipsAPIv1
    
    /// API client for accessing Twitter's geo-location features.
    public let geo: GeoAPIv1
    
    /// API client for accessing Twitter platform information and supported features.
    public let help: HelpAPIv1
    
    /// API client for managing Twitter lists.
    public let list: ListAPIv1
    
    /// API client for uploading and managing media attachments.
    public let media: MediaAPIv1
    
    /// API client for managing retweets.
    public let retweet: RetweetAPIv1
    
    /// API client for searching tweets and managing saved searches.
    public let search: SearchAPIv1
    
    /// API client for accessing user timelines.
    public let timeline: TimelineAPIv1
    
    /// API client for accessing trending topics.
    public let trend: TrendAPIv1
    
    /// API client for creating, deleting, and retrieving tweets.
    public let tweet: TweetAPIv1
    
    /// API client for managing and retrieving user information.
    public let user: UserAPIv1

    /// Creates a new Twitter API v1.1 client.
    /// - Parameter session: The Twitter API session to use for making requests.
    public init(session: TwitterAPISession) {
        account = .init(session: session)
        application = .init(session: session)
        blockAndMute = .init(session: session)
        collection = .init(session: session)
        directMessage = .init(session: session)
        favorite = .init(session: session)
        friendships = .init(session: session)
        geo = .init(session: session)
        help = .init(session: session)
        list = .init(session: session)
        media = .init(session: session)
        retweet = .init(session: session)
        search = .init(session: session)
        timeline = .init(session: session)
        trend = .init(session: session)
        tweet = .init(session: session)
        user = .init(session: session)
    }
}
