import UIKit
import FlexiJSONCoder


struct MyModel: Codable {
    let id: String?
    let name: String
    let userDesc: Int?
    let formsCount: Bool?
    let rate: Float?
}


let jsonData = """
{
    "id": "123",
    "name": "Welcome",
    "rate": "45.67",
    "formsCount": "true"
}
""".data(using: .utf8)!



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonData, options: [.fragmentsAllowed])
            let decodedModel = try FlexiJSONCoder().decode(MyModel.self, from: jsonData)
            print(decodedModel)  // Outputs: MyModel(id: "123", name: "Welcome", userDesc: 0, formsCount: true, rate: 45.67)
        } catch {
            print("Decoding failed: \(error)")
        }
    }


}

