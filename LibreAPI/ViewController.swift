import Cocoa
import SnapKit

class ViewController: NSViewController {
    let httpRequestMethods = [
        "GET"
    ]
    
    let stackView = NSStackView()
    let httpMethodPicker = NSPopUpButton()
    let urlTextField = NSTextField()
    let sendRequestButton = NSButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(10)
            make.top.equalTo(view.snp.top).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
        }
        
        httpMethodPicker.addItems(withTitles: httpRequestMethods)
        stackView.addArrangedSubview(httpMethodPicker)
        
        urlTextField.maximumNumberOfLines = 1
        stackView.addArrangedSubview(urlTextField)
        
        sendRequestButton.title = "Send"
        sendRequestButton.bezelStyle = .rounded
        stackView.addArrangedSubview(sendRequestButton)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

