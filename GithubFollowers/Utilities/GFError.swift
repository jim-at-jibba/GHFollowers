//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by James Best on 30/06/2023.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again"
    case networkError = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again later."
    case unableToFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "This user is already favorited."
}
