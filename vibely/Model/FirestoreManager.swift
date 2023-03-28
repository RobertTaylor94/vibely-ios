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
    @Published var userData = UserData(displayName: "", bio: "", uid: "", followers: [])
    @Published var userPosts = [Vibe]()
    @Published var searchResult = SearchResult(uid: "")
    @Published var foundUser = UserData(displayName: "", bio: "", uid: "", followers: [])
    
    func getCurrentUserData(uid: String) {
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { document, err in
            if let err = err {
                print(err)
            } else {
                if let document = document {
                    do {
                        self.userData = try document.data(as: UserData.self)
                    } catch {
                        print(error)
                    }
                }
            }
            
        }
    }
    
    func getSearchedUserData(uid: String) {
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { document, err in
            if let err = err {
                print(err)
            } else {
                if let document = document {
                    do {
                        self.foundUser = try document.data(as: UserData.self)
                    } catch {
                        print(error)
                    }
                }
            }
            
        }
    }
    
    //MARK: Get Posts Functions
    
    func getUserPosts(uid: String) {
        db.collection("vibes").document(uid).collection("posts").getDocuments { querySnapshot, error in
            if let error = error {
                print("getPostsError: \(error.localizedDescription)")
            } else {
                self.userPosts = []
                for doc in querySnapshot!.documents {
                    do {
                        let vibe = try doc.data(as: Vibe.self)
                        self.userPosts.append(vibe)
                    } catch {
                        print("for doc in error: \(error)")
                    }
                    print(doc.data())
                }
            }
        }
    }
    
    func getFullFeed() {
        
    }
    
    //MARK: User Search functions
    
    func searchUsers(email: String) {
        let documentName = "Optional(\"\(email)\")"
        let docRef = db.collection("userSearch").document(documentName)
        docRef.getDocument { document, err in
            if let err = err {
                print("Error fetching users: \(err)")
            } else {
                if let document = document {
                    do {
                        self.searchResult = try document.data(as: SearchResult.self)
                        self.getSearchedUserData(uid: self.searchResult.uid)
                    } catch {
                        print("no user found")
                    }
                }
            }
        }
    }
    
    //MARK: Follower Functions
    
    func addToFollowers(uid: String) {
        userData.followers.append(uid)
        let docref = db.collection("users").document("\(userData.uid)")
        docref.updateData([
            "followers": FieldValue.arrayUnion(["\(uid)"])
        ])
    }
    
    func removeFromFollowers(uid: String) {
        if userData.followers.contains("\(uid)") {
            let index = userData.followers.firstIndex(of: uid)
            userData.followers.remove(at: index!)
        }
        let docref = db.collection("users").document("\(userData.uid)")
        docref.updateData([
            "followers": FieldValue.arrayRemove(["\(uid)"])
        ])
    }
}

