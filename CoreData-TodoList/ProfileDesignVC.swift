//
//  ProfileDesignVC.swift
//  CoreData-TodoList
//
//  Created by t2023-m0062 on 2023/09/20.
//

import UIKit

class ProfileDesignVC: UIViewController {
    let userIdLabel: UILabel = {
        let label = UILabel()
        label.text = "nabaecamp"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Menu")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let profile: UIImageView = {
        let profile = UIImageView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.image = UIImage(named: "Profile")
        profile.contentMode = .scaleAspectFit
        
        return profile
    }()
    
    let username: UILabel = {
        let username = UILabel()
        username.text = "르탄이"
        username.font = UIFont.boldSystemFont(ofSize: 15)
        username.textColor = .black
        username.translatesAutoresizingMaskIntoConstraints = false
        
        return username
    }()
    
    let userinfo: UILabel = {
        let userinfo = UILabel()
        userinfo.text = "iOS Developer"
        userinfo.font = UIFont.systemFont(ofSize: 15)
        userinfo.textColor = .black
        userinfo.translatesAutoresizingMaskIntoConstraints = false
        
        return userinfo
    }()
    
    let link: UITextView = {
        let link = UITextView()
        link.isScrollEnabled = false
        link.textContainerInset = .zero
        link.textContainer.lineFragmentPadding = 0  //왼쪽 여백 없앰
        link.text = "spartacodingclub.kr"
        link.font = UIFont.systemFont(ofSize: 15)
        link.isEditable = false
        link.dataDetectorTypes = .link
        link.translatesAutoresizingMaskIntoConstraints = false
    
        return link
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("< Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        
        return backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setUI()
        menulayout()
        profilelayout()
        usernameLayout()
        userinfoLayout()
        linkLayout()
        backButtonLayout()
        backButton.addTarget(self, action: #selector(didClickBackButton), for: .touchUpInside)
    }
    
    func addSubViews() {
        view.addSubview(userIdLabel)
        view.addSubview(menuImageView)
        view.addSubview(profile)
        view.addSubview(username)
        view.addSubview(userinfo)
        view.addSubview(link)
        view.addSubview(backButton)
        
    }
    
    @objc func didClickBackButton() {
        self.dismiss(animated: true)
    }
    
    private func setUI() {
        NSLayoutConstraint.activate([
            userIdLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userIdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func menulayout() {
        NSLayoutConstraint.activate([
            //menu.centerXAnchor.constraint(equalTo: username.centerXAnchor),
            menuImageView.centerYAnchor.constraint(equalTo: userIdLabel.centerYAnchor),
            menuImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    func profilelayout() {
        NSLayoutConstraint.activate([
            profile.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
    
    func usernameLayout() {
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: profile.bottomAnchor, constant: 14),
            username.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    func userinfoLayout() {
        NSLayoutConstraint.activate([
            userinfo.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 5),
            userinfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func linkLayout() {
        NSLayoutConstraint.activate([
            link.topAnchor.constraint(equalTo: userinfo.bottomAnchor, constant: 5),
            link.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            link.heightAnchor.constraint(equalToConstant: 30),
            link.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func backButtonLayout() {
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: userIdLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        
        ])
    }
    
    
    
    // UITextViewDelegate를 준수하는 경우 사용자가 링크를 탭할 때 호출될 메서드
//     func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//         // 사용자가 링크를 탭했을 때 웹 페이지를 여는 동작 추가
//         UIApplication.shared.open(URL, options: [:], completionHandler: nil)
//         return false // 기본 동작을 수행하지 않도록 false 반환
//     }
}
