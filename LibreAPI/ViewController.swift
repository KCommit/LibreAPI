import Cocoa
import SnapKit
import Alamofire
import SwiftyJSON

let httpRequestMethods = [
    "GET",
    "POST",
    "PUT",
    "DELETE"
]

class ViewController: NSViewController {
    
    let stackView = NSStackView()
    let httpMethodPicker = NSPopUpButton()
    let urlTextField = NSTextField()
    let sendRequestButton = NSButton()
    let jsonView = NSTextView()
    
    func prettyJsonString(data: Data) -> String {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data) else {
            return ""
        }
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
            return ""
        }
        
        return String(decoding: jsonData, as: UTF8.self)
    }
    
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
        urlTextField.cell?.usesSingleLineMode = true
        stackView.addArrangedSubview(urlTextField)
        
        sendRequestButton.title = "Send"
        sendRequestButton.bezelStyle = .rounded
        sendRequestButton.action = #selector(sendRequest)
        stackView.addArrangedSubview(sendRequestButton)
        
        view.addSubview(jsonView)
        jsonView.snp.makeConstraints { make in
            make.left.equalTo(stackView.snp.left)
            make.right.equalTo(stackView.snp.right)
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.bottom.equalTo(view.snp.bottom).offset(-20)
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func sendGetRequest() {
        AF.request(urlTextField.stringValue, method: .get).response { [self] response in
            switch response.result {
            case .success(let value):
                guard let data  = value else {
                    return
                }
                jsonView.string = prettyJsonString(data: data)
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func sendPostRequest() {
        let dict: [String: Any?] = [
            "id": 5,
            "name": "eee"
        ]
        let json = JSON(dict)
        AF.request(urlTextField.stringValue, method: .post, parameters: json, encoder: JSONParameterEncoder.default).response { [self] response in
            switch response.result {
            case .success(let value):
                guard let data = value else { return }
                jsonView.string = prettyJsonString(data: data)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func sendPutRequest() {
        
    }
    
    func sendDeleteRequest() {
        
    }
    
    @objc func sendRequest(){
        if httpMethodPicker.title == "GET" {
           sendGetRequest()
        }
        
        if httpMethodPicker.title == "POST" {
            sendPostRequest()
        }
        
        if httpMethodPicker.title == "PUT" {
            sendPutRequest()
        }
        
        if httpMethodPicker.title == "DELETE" {
            sendDeleteRequest()
        }
    }
}

