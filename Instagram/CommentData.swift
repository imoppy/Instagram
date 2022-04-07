//
//  CommentData.swift
//  Instagram
//
//  Created by 若原 旬 on 2022/04/07.
//

import UIKit

class CommentData: NSObject {
    var name: String?
    var caption: String?

    init(name: String, caption: String) {
        self.name = name
        self.caption = caption
    }
}
