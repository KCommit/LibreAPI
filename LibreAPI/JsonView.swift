//
//  JsonView.swift
//  LibreAPI
//
//  Created by KCommit on 2022/6/28.
//

import Cocoa
import SnapKit

class JsonView: NSView {
    let textView = NSTextView()
    let stackView = NSStackView()
    let prettyButton = NSButton()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.left.equalTo(snp.left)
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
        }
        
        prettyButton.title = "Pretty"
        prettyButton.bezelStyle = .rounded
        stackView.addArrangedSubview(prettyButton)
        
        stackView.addArrangedSubview(textView)
        textView.snp.makeConstraints { make in
            make.width.equalTo(snp.width)
            make.height.equalTo(snp.height)
        }
        
        
    }
    
}
