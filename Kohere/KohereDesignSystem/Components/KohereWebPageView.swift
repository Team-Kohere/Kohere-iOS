//
//  KohereWebPageView.swift
//  Kohere
//
//  Created by Codex on 7/9/26.
//

import SwiftUI
import WebKit

public struct KohereWebPageView: UIViewRepresentable {
    let url: URL
    let onLoadingStarted: () -> Void
    let onLoadingFinished: () -> Void

    public init(
        url: URL,
        onLoadingStarted: @escaping () -> Void,
        onLoadingFinished: @escaping () -> Void
    ) {
        self.url = url
        self.onLoadingStarted = onLoadingStarted
        self.onLoadingFinished = onLoadingFinished
    }

    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.backgroundColor = .clear
        webView.load(URLRequest(url: url))
        return webView
    }

    public func updateUIView(_ webView: WKWebView, context: Context) {
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(
            onLoadingStarted: onLoadingStarted,
            onLoadingFinished: onLoadingFinished
        )
    }

    public final class Coordinator: NSObject, WKNavigationDelegate {
        private let onLoadingStarted: () -> Void
        private let onLoadingFinished: () -> Void

        init(
            onLoadingStarted: @escaping () -> Void,
            onLoadingFinished: @escaping () -> Void
        ) {
            self.onLoadingStarted = onLoadingStarted
            self.onLoadingFinished = onLoadingFinished
        }

        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            onLoadingStarted()
        }

        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            onLoadingFinished()
        }

        public func webView(
            _ webView: WKWebView,
            didFail navigation: WKNavigation!,
            withError error: Error
        ) {
            onLoadingFinished()
        }

        public func webView(
            _ webView: WKWebView,
            didFailProvisionalNavigation navigation: WKNavigation!,
            withError error: Error
        ) {
            onLoadingFinished()
        }
    }
}
