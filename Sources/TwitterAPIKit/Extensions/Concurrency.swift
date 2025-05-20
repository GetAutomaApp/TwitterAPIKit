// Concurrency.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.
//
// This Package is a heavily modified fork of https://github.com/mironal/TwitterAPIKit.
// This Package is distributable through a modified version of the MIT License.

import Foundation

/// A protocol that represents a concurrency.
public protocol Concurrency {
    // No Logic Here
}

#if compiler(>=5.5.2) && canImport(_Concurrency)

    // I'm not that familiar with Swift Concurrency, so please report any problems.

    /// Adds async/await support to TwitterAPISessionDataTask.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionDataTask {
        /// Asynchronously retrieves the response data from the API request.
        /// This property provides an async interface to the completion handler-based API.
        /// - Returns: A TwitterAPIResponse containing the raw data response.
        var responseData: TwitterAPIResponse<Data> {
            get async {
                await withTaskCancellationHandler(
                    operation: {
                        await withCheckedContinuation { continuation in
                            responseData { response in
                                continuation.resume(returning: response)
                            }
                        }
                    },
                    onCancel: {
                        cancel()
                    }
                )
            }
        }
    }

    /// Adds async/await support to TwitterAPISessionJSONTask.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionJSONTask {
        /// Asynchronously retrieves the JSON response as a generic object.
        /// This property provides an async interface to the completion handler-based API.
        /// - Returns: A TwitterAPIResponse containing the parsed JSON object.
        var responseObject: TwitterAPIResponse<Any> {
            get async {
                await withTaskCancellationHandler(
                    operation: {
                        await withCheckedContinuation { continuation in
                            responseObject { response in
                                continuation.resume(returning: response)
                            }
                        }
                    },
                    onCancel: {
                        cancel()
                    }
                )
            }
        }

        /// Asynchronously decodes the JSON response into a specified Decodable type.
        /// - Parameters:
        ///   - type: The Decodable type to decode the response into.
        ///   - decoder: The JSONDecoder to use for decoding. Defaults to TwitterAPIClient.defaultJSONDecoder.
        /// - Returns: A TwitterAPIResponse containing the decoded object.
        func responseDecodable<T: Decodable>(
            type: T.Type,
            decoder _: JSONDecoder = TwitterAPIClient.defaultJSONDecoder
        ) async -> TwitterAPIResponse<T> {
            await withTaskCancellationHandler(
                operation: {
                    await withCheckedContinuation { continuation in
                        responseDecodable(type: type) { response in
                            continuation.resume(returning: response)
                        }
                    }
                },
                onCancel: {
                    cancel()
                }
            )
        }
    }

    /// Adds async/await support to TwitterAPISessionSpecializedTask.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionSpecializedTask {
        /// Asynchronously retrieves the specialized response object.
        /// This property provides an async interface to the completion handler-based API.
        /// - Returns: A TwitterAPIResponse containing the specialized success type.
        var responseObject: TwitterAPIResponse<Success> {
            get async {
                await withTaskCancellationHandler(
                    operation: {
                        await withCheckedContinuation { continuation in
                            responseObject { response in
                                continuation.resume(returning: response)
                            }
                        }
                    }, onCancel: {
                        cancel()
                    }
                )
            }
        }
    }

    /// Adds async/await support to TwitterAPISessionStreamTask.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionStreamTask {
        /// Creates an AsyncStream for receiving streaming responses from the API.
        /// - Parameter queue: The dispatch queue on which to receive responses. Defaults to the main queue.
        /// - Returns: An AsyncStream that yields TwitterAPIResponse<Data> values.
        func streamResponse(queue: DispatchQueue = .main) -> AsyncStream<TwitterAPIResponse<Data>> {
            AsyncStream { continuation in
                streamResponse(queue: queue) { response in
                    continuation.yield(response)
                    if response.isError {
                        continuation.finish()
                    }
                }
                continuation.onTermination = { @Sendable _ in
                    cancel()
                }
            }
        }
    }

    /// Adds async/await support to TwitterAPIClient.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPIClient {
        /// Asynchronously refreshes the OAuth 2.0 token.
        /// - Parameters:
        ///   - type: The type of OAuth 2.0 client to use for token refresh.
        ///   - forceRefresh: Whether to force a token refresh even if the current token is still valid.
        /// - Returns: The result of the token refresh operation.
        /// - Throws: A TwitterAPIKitError if the token refresh fails.
        func refreshOAuth20Token(
            type: TwitterAuthenticationMethod.OAuth20WithPKCEClientType,
            forceRefresh: Bool = false
        ) async throws -> RefreshOAuth20TokenResultValue {
            try await withCheckedThrowingContinuation { continuation in
                refreshOAuth20Token(type: type, forceRefresh: forceRefresh) { result in
                    continuation.resume(with: result)
                }
            }
        }
    }

#endif
