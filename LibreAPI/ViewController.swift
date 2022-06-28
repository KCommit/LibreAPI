import Cocoa
import SnapKit
import Alamofire
import SwiftyJSON

class ViewController: NSViewController {
    let httpRequestBar = HttpRequestBar()
    let jsonView = JsonView()
    
//    func prettyJsonString(data: Data) -> String {
//        guard let jsonObject = try? JSONSerialization.jsonObject(with: data) else {
//            return ""
//        }
//
//        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//            return ""
//        }
//
//        return String(decoding: jsonData, as: UTF8.self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(httpRequestBar)
        httpRequestBar.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
            make.top.equalTo(view.snp.top).offset(10)
            make.height.equalTo(40)
        }
        
        view.addSubview(jsonView)
        jsonView.snp.makeConstraints { make in
            make.left.equalTo(httpRequestBar.snp.left)
            make.right.equalTo(httpRequestBar.snp.right)
            make.top.equalTo(httpRequestBar.snp.bottom).offset(10)
            make.bottom.equalTo(view.snp.bottom).offset(-10)
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
//    func sendGetRequest() {
//        AF.request(urlTextField.stringValue, method: .get).response { [self] response in
//            switch response.result {
//            case .success(let value):
//                guard let data  = value else {
//                    return
//                }
//                jsonView.string = prettyJsonString(data: data)
//                break
////
//            case .failure(let error):
//                print(error)
//                break
//            }
//        }
//    }
//
//    func sendPostRequest() {
//        let dict: [String: Any?] = [
//            "id": 5,
//            "name": "eee"
//        ]
//        let json = JSON(dict)
//        AF.request(urlTextField.stringValue, method: .post, parameters: json, encoder: JSONParameterEncoder.default).response { [self] response in
//            switch response.result {
//            case .success(let value):
//                guard let data = value else { return }
//                jsonView.string = prettyJsonString(data: data)
//                break
//            case .failure(let error):
//                print(error)
//                break
//            }
//        }
//    }
//
//    func sendPutRequest() {
//
//    }
//
//    func sendDeleteRequest() {
//
//    }
//
//    @objc func sendRequest(){
//        if httpMethodPicker.title == "GET" {
//           sendGetRequest()
//        }
//
//        if httpMethodPicker.title == "POST" {
//            sendPostRequest()
//        }
//
//        if httpMethodPicker.title == "PUT" {
//            sendPutRequest()
//        }
//
//        if httpMethodPicker.title == "DELETE" {
//            sendDeleteRequest()
//        }
//    }
}


extension ViewController: HttpRequestBarDelegate {
    func sendButtonAction(httpMethodPicker: NSPopUpButton, urlTextField: NSTextField, sendRequestButton: NSButton) {
        
    }
    
}
