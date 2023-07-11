//
//  Follower.swift
//  GithubFollowers
//
//  Created by James Best on 28/06/2023.
//
//{
//    "login": "bakeruk",
//    "id": 7656153,
//    "node_id": "MDQ6VXNlcjc2NTYxNTM=",
//    "avatar_url": "https://avatars.githubusercontent.com/u/7656153?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/bakeruk",
//    "html_url": "https://github.com/bakeruk",
//    "followers_url": "https://api.github.com/users/bakeruk/followers",
//    "following_url": "https://api.github.com/users/bakeruk/following{/other_user}",
//    "gists_url": "https://api.github.com/users/bakeruk/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/bakeruk/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/bakeruk/subscriptions",
//    "organizations_url": "https://api.github.com/users/bakeruk/orgs",
//    "repos_url": "https://api.github.com/users/bakeruk/repos",
//    "events_url": "https://api.github.com/users/bakeruk/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/bakeruk/received_events",
//    "type": "User",
//    "site_admin": false
//},


import Foundation

// Codable is the both Encodable and Deocodable
struct Follower: Codable, Hashable {
    // variable names must match the properties of the response
    // if the response properties could be null then you must make it an optional
    var login: String
    // We can convert to camel case as the decoder can handle that conversion
    var avatarUrl: String
   
    
}
