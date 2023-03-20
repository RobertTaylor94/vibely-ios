//
//  SigninViewModel.swift
//  vibely
//
//  Created by Robert on 19/03/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    
    var fireStore = FirestoreManager()
    
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    func signUp(
        emailAddress: String,
        password: String,
        displayName: String,
        bio: String
    ) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("an error occured \(error.localizedDescription)")
                return
            } else {
                print(result!)
                self.fireStore.db.collection("users").document("\(self.user!.uid)").setData([
                    "displayName": displayName,
                    "bio": bio,
                    "uid": self.user!.uid
                ])
                self.updateDisplayname(displayName: displayName)
                self.fireStore.db.collection("userSearch").document("\(String(describing: self.user!.email))").setData([
                    "uid": self.user!.uid
                ])
            }
        }
    }
    
    func signIn(
        emailAddress: String,
        password: String
    ) {
        Auth.auth().signIn(withEmail: emailAddress, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func updateDisplayname(displayName: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = displayName
        changeRequest?.commitChanges { error in
            print(error)
        }
    }
    
}
