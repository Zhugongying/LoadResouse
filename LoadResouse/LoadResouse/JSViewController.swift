//
//  JSViewController.swift
//  LoadResouse
//
//  Created by zhugy on 2017/3/16.
//  Copyright © 2017年 Zhugy. All rights reserved.
//

import UIKit
import WebKit
import Cartography
import Reachability

class JSViewController: UIViewController {
    var webView: WKWebView!
    
    private let progress: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        progress.progress = 0.2
        progress.trackTintColor = UIColor.red
        progress.progressTintColor = UIColor.black
        return progress
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "JS 交互"
        view.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "loading")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = WKWebViewConfiguration()
        config.userContentController = WKUserContentController()
        config.userContentController.add(self, name: "Model")
        webView = WKWebView(frame: CGRect(), configuration: config)
        webView.backgroundColor = UIColor.white
        
        view.addSubview(webView)
        view.addSubview(progress)
        constrain(progress) { progress in
            progress.top == progress.superview!.top + 64
            progress.leading == progress.superview!.leading
            progress.trailing == progress.superview!.trailing
            progress.height == 2
        }
        constrain(webView) {
            $0.leading == $0.superview!.leading
            $0.trailing == $0.superview!.trailing
            $0.top == $0.superview!.top + 5
            $0.bottom == $0.superview!.bottom
        }
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
//        guard let path = Bundle.main.path(forResource: "test", ofType: "html") else {
//            return
//        }
//        
//        webView.load(URLRequest(url: URL(fileURLWithPath: path)))
        webView.load(URLRequest(url: URL(string: "http://ddp.vip.pptv.com/h5/myorder/?cateid=2")!))
        
        webView.allowsBackForwardNavigationGestures = true
        
        
        // add KVO
        
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(JSViewController.judgeNetworkStatus), name: ReachabilityChangedNotification, object: nil)
        // Do any additional setup after loading the view.
        
        
    }
    
    @objc func judgeNetworkStatus() {
        let networkStatus = Reachability()
        if let status = networkStatus?.currentReachabilityStatus {
            switch status {
            case .notReachable:
                print("没有网络")
            case .reachableViaWiFi:
                print("wifi")
                
            case .reachableViaWWAN:
                print("流量用户")
            }
        }
    }
    
    func test<T>(str: Any) -> T? {
        return str as? T
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print("进度")
            progress.setProgress(Float(webView.estimatedProgress), animated: true)
        } else if keyPath == "loading" {
            print("加载。。。。")
            webView.evaluateJavaScript("callJsAlert()", completionHandler: nil)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension JSViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("name ----->   \(message.name) + \(message.body)")
        
    }
}

extension JSViewController: WKUIDelegate {
   
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    
    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
        
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        completionHandler()
        let alert = UIAlertController(title: "iOS-Alert", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let sureAction = UIAlertAction(title: "确定", style: .default) { (action) in
            
        }
        alert.addAction(cancelAction)
        alert.addAction(sureAction)
        present(alert, animated: true, completion: nil)
    }

    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "iOS-ConfirmPanelWithMessage", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let sureAction = UIAlertAction(title: "确定", style: .default) { (action) in
            completionHandler(true)
        }
        alert.addAction(cancelAction)
        alert.addAction(sureAction)
        present(alert, animated: true, completion: nil)
    }
    
   
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        
//        return nil
//    }
//    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
        
        let alert = UIAlertController(title: "iOS-TextInputPanelWithPrompt", message: "JS-TextInput", preferredStyle: .alert)
        alert.addTextField { (textF) in
            textF.isSecureTextEntry = true
            textF.placeholder = "密码"
            
        }
        alert.addAction(UIAlertAction(title: "Sure", style: UIAlertActionStyle.default, handler: { (action) in
           completionHandler(alert.textFields?.last?.text)
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension JSViewController: WKNavigationDelegate {
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
//        webView.evaluateJavaScript("callJsAlert()") { (str, error) in
//            if str != nil {
//                print(str as! String)
//            }
//        }
        
//        webView.evaluateJavaScript("document.title") { (str, error) in
//            if str != nil {
//            print(str as! String)
//            }
//            
//            
//        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
    
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        
//    }
//    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        
        guard let hostName = navigationAction.request.url?.host?.lowercased() else {
            return
        }
        
        
        print(hostName)
        
        switch navigationAction.navigationType {
        case .linkActivated:
            decisionHandler(.allow)
        default:
            decisionHandler(.cancel)
        }
    }
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//        
//    }
}
