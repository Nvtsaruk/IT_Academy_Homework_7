import UIKit

protocol AccountDelegate: AnyObject {
    var config: AccountConfig { get set }
    func saveAccountConfig(_ config: AccountConfig)
}

class AccountConfig {
    var nickName: String
    var avatarImg: UIImage? = nil
    init(nickName: String, avatarImg: UIImage? = nil) {
        self.nickName = nickName
        self.avatarImg = avatarImg
    }
}

