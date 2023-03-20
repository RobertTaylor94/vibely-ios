//
//  FirestoreManager.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreManager: ObservableObject {
    
    let db = Firestore.firestore()
    @Published var userData = UserData(displayName: "", bio: "", uid: "")
    @Published var userPosts = [Vibe]()
    
    func getCurrentUserData(uid: String) {
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { document, err in
            if let err = err {
                print(err)
            } else {
                if let document = document {
                    do {
                        self.userData = try document.data(as: UserData.self)
                        print(self.userData)
                    } catch {
                        print(error)
                    }
                }
            }
            
        }
    }
    
    func getUserPosts(uid: String) {
        db.collection("vibes").document(uid).collection("posts").getDocuments { querySnapshot, error in
            if let error = error {
                print("getPostsError: \(error.localizedDescription)")
            } else {
                self.userPosts = []
                for doc in querySnapshot!.documents {
                    do {
                        let vibe = try doc.data(as: Vibe.self)
                        print("VIBE: \(vibe)")
                        self.userPosts.append(vibe)
                    } catch {
                        print("for doc in error: \(error)")
                    }
                    print(doc.data())
                }
                print("POSTS: \(self.userPosts)")
            }
        }
    }
}

