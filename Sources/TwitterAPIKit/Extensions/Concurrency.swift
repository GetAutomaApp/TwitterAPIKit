// Concurrency.swift
// Copyright (c) 2025 GetAutomaApp
// All source code and related assets are the property of GetAutomaApp.
// All rights reserved.

import Foundation

#if compiler(>=5.5.2) && canImport(_Concurrency)

    // I'm not that familiar with Swift Concurrency, so please report any problems.

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionDataTask {
        var responseData: TwitterAPIResponse<Data> {
            get async {
                await withTaskCancellationHandler(
                    operation: {
                        await withCheckedContinuation { c in
                            responseData { response in
                                c.resume(returning: response)
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

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionJSONTask {
        var responseObject: TwitterAPIResponse<Any> {
            get async {
                await withTaskCancellationHandler(
                    operation: {
                        await withCheckedContinuation { c in
                            responseObject { response in
                                c.resume(returning: response)
                            }
                        }
                    },
                    onCancel: {
                        cancel()
                    }
                )
            }
        }

        func responseDecodable<T: Decodable>(
            type: T.Type,
            decoder _: JSONDecoder = TwitterAPIClient.defaultJSONDecoder
        ) async -> TwitterAPIResponse<T> {
            return await withTaskCancellationHandler(
                operation: {
                    await withCheckedContinuation { c in
                        responseDecodable(type: type) { response in
                            c.resume(returning: response)
                        }
                    }
                },
                onCancel: {
                    cancel()
                }
            )
        }
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionSpecializedTask {
        var responseObject: TwitterAPIResponse<Success> {
            get async {
                await withTaskCancellationHandler(
                    operation: {
                        await withCheckedContinuation { c in
                            responseObject { response in
                                c.resume(returning: response)
                            }
                        }
                    }, onCancel: {
                        cancel()
                    }
                )
            }
        }
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPISessionStreamTask {
        func streamResponse(queue: DispatchQueue = .main) -> AsyncStream<TwitterAPIResponse<Data>> {
            return AsyncStream { continuation in
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

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public extension TwitterAPIClient {
        func refreshOAuth20Token(
            type: TwitterAuthenticationMethod.OAuth20WithPKCEClientType,
            forceRefresh: Bool = false
        ) async throws -> RefreshOAuth20TokenResultValue {
            return try await withCheckedThrowingContinuation { c in
                refreshOAuth20Token(type: type, forceRefresh: forceRefresh) { result in
                    c.resume(with: result)
                }
            }
        }
    }

#endif
