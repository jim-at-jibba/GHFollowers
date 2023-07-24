//
//  User.swift
//  GithubFollowers
//
//  Created by James Best on 28/06/2023.
//
//{
//  "login": "jim-at-jibba",
//  "id": 7897877,
//  "node_id": "MDQ6VXNlcjc4OTc4Nzc=",
//  "avatar_url": "https://avatars.githubusercontent.com/u/7897877?v=4",
//  "gravatar_id": "",
//  "url": "https://api.github.com/users/jim-at-jibba",
//  "html_url": "https://github.com/jim-at-jibba",
//  "followers_url": "https://api.github.com/users/jim-at-jibba/followers",
//  "following_url": "https://api.github.com/users/jim-at-jibba/following{/other_user}",
//  "gists_url": "https://api.github.com/users/jim-at-jibba/gists{/gist_id}",
//  "starred_url": "https://api.github.com/users/jim-at-jibba/starred{/owner}{/repo}",
//  "subscriptions_url": "https://api.github.com/users/jim-at-jibba/subscriptions",
//  "organizations_url": "https://api.github.com/users/jim-at-jibba/orgs",
//  "repos_url": "https://api.github.com/users/jim-at-jibba/repos",
//  "events_url": "https://api.github.com/users/jim-at-jibba/events{/privacy}",
//  "received_events_url": "https://api.github.com/users/jim-at-jibba/received_events",
//  "type": "User",
//  "site_admin": false,
//  "name": "James G. Best",
//  "company": "Breedr",
//  "blog": "jamesbest.uk",
//  "location": "Bristol",
//  "email": null,
//  "hireable": true,
//  "bio": "Vim loving developer working at Breedr. A host on the @salted_bytes podcast\r\n\r\n\r\n",
//  "twitter_username": null,
//  "public_repos": 167,
//  "public_gists": 76,
//  "followers": 43,
//  "following": 80,
//  "created_at": "2014-06-16T02:36:17Z",
//  "updated_at": "2023-06-28T07:16:39Z"
//}

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let htmlUrl: String
    let createdAt: String
}
