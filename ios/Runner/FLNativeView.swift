//
//  FLNativeView.swift
//  Runner
//
//  Created by Angga Dwi Arifandi on 08/10/23.
//

import Foundation
import Flutter
import UIKit
import OSLog

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private var _args: Dictionary<String, AnyObject>

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        _args = args as! Dictionary<String, AnyObject>
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView){
        let selectableNativeText = SelectableLabel()
        
        let content = _args["content"] as! String? ?? "-"
        selectableNativeText.text = "Hi, My name is Angga"
        selectableNativeText.textColor = UIColor.black
        selectableNativeText.textAlignment = .center
        selectableNativeText.frame = CGRect(x: 0, y: 0, width: 300, height: 24.0)
        _view.addSubview(selectableNativeText)
    }
}
