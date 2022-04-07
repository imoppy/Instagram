//
//  CommentViewController.swift
//  Instagram
//
//  Created by 若原 旬 on 2022/04/06.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    var postId: String!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 10.0
        textView.layer.masksToBounds = true
    }

    @IBAction func handleCommentButton(_ sender: Any) {
        if textView.text == nil {
            SVProgressHUD.showError(withStatus: "コメントを入力してください")
            return
        }

        if Auth.auth().currentUser?.uid == nil {
            SVProgressHUD.showError(withStatus: "ログインしてください")
            return
        }
        
        SVProgressHUD.show()

        let postRef = Firestore.firestore().collection(Const.PostPath).document(postId)
        let commentData = [
            "name": Auth.auth().currentUser?.displayName ?? "noname",
            "caption": textView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        ]
        postRef.updateData(["comments": FieldValue.arrayUnion([commentData])])

        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
}
