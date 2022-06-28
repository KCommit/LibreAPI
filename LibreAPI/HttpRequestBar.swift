//
//  HttpRequestBar.swift
//  LibreAPI
//
//  Created by KCommit on 2022/6/28.
//

import Cocoa
import SnapKit

protocol HttpRequestBarDelegate {
    func sendButtonAction(httpMethodPicker: NSPopUpButton, urlTextField: NSTextField, sendRequestButton: NSButton)
}

class HttpRequestBar: NSView {
    let httpRequestMethods = [
        "GET",
        "POST",
        "PUT",
        "DELETE"
    ]
    let stackView = NSStackView()
    let httpMethodPicker = NSPopUpButton()
    let urlTextField = NSTextField()
    let sendRequestButton = NSButton()
    var delegate: HttpRequestBarDelegate?
    override func draw(_ dirtyRect: NSRect) {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.top.equalTo(snp.top)
        }
        stackView.addArrangedSubview(httpMethodPicker)
        httpMethodPicker.addItems(withTitles: httpRequestMethods)
        
        urlTextField.cell?.usesSingleLineMode = true
        stackView.addArrangedSubview(urlTextField)
        
        sendRequestButton.title = "Send"
        sendRequestButton.bezelStyle = .rounded
        stackView.addArrangedSubview(sendRequestButton)
    }
    
    
    @objc func sendAction() {
        guard let delegate = delegate else {
            return
        }
        
        delegate.sendButtonAction(httpMethodPicker: httpMethodPicker, urlTextField: urlTextField, sendRequestButton: sendRequestButton)
    }
}
