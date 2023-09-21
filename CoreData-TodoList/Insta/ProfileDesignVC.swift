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
    
    let postView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.nameLabel.text = "post"
        view.numberLabel.text = "7"
        
        return view
    }()
    
    let followerView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.nameLabel.text = "follower"
        view.numberLabel.text = "999"
        
        return view
    }()
    
    let followingView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.nameLabel.text = "following"
        view.numberLabel.text = "0"
        
        return view
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postView,followerView,followingView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    
    let followBtn: UIButton = {
        let followBtn = UIButton()
        followBtn.setTitle("Follow", for: .normal)
        followBtn.translatesAutoresizingMaskIntoConstraints = false
        followBtn.backgroundColor = .systemBlue
        followBtn.layer.cornerRadius = 5
        followBtn.setTitleColor(.white, for: .normal)
        followBtn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        
        return followBtn
    }()
    
    let moreBtn: UIButton = {
        let moreBtn = UIButton()
        moreBtn.setImage(UIImage(named: "More"), for: .normal)
        moreBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return moreBtn
    }()
    
    let messageBtn: UIButton = {
        let messageBtn = UIButton()
        messageBtn.setTitle("Message", for: .normal)
        messageBtn.translatesAutoresizingMaskIntoConstraints = false
        messageBtn.backgroundColor = .white
        messageBtn.layer.cornerRadius = 5
        messageBtn.setTitleColor(.black, for: .normal)
        messageBtn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        messageBtn.layer.borderWidth = 1
        messageBtn.layer.borderColor = UIColor.lightGray.cgColor
        
        return messageBtn
    }()
    
    let gridBtn: UIButton = {
        let gridBtn = UIButton()
        gridBtn.setImage(UIImage(named: "Grid"), for: .normal)
        gridBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return gridBtn
    }()
    
    lazy var btnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followBtn, messageBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 8 //follow, message 사이 8만큼
        return stackView
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
        layout()
        backButton.addTarget(self, action: #selector(didClickBackButton), for: .touchUpInside)
        moreBtnLayout()
        btnLayout()
        gridBtnLayout()
    }
    
    func addSubViews() {
        view.addSubview(userIdLabel)
        view.addSubview(menuImageView)
        view.addSubview(profile)
        view.addSubview(username)
        view.addSubview(userinfo)
        view.addSubview(link)
        view.addSubview(backButton)
        view.addSubview(infoStackView)
        view.addSubview(moreBtn)
        view.addSubview(btnStackView)
        view.addSubview(gridBtn)
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
        profile.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        NSLayoutConstraint.activate([
            profile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
    
    func layout() {
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: profile.trailingAnchor, constant: 10),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            infoStackView.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 50),
        ])
    }

    func moreBtnLayout() {
        NSLayoutConstraint.activate([
            moreBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            moreBtn.widthAnchor.constraint(equalToConstant: 30),
            moreBtn.heightAnchor.constraint(equalToConstant: 30),
            moreBtn.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 3)
        
        ])
    }
    
    func btnLayout() {
        NSLayoutConstraint.activate([
            btnStackView.trailingAnchor.constraint(equalTo: moreBtn.leadingAnchor, constant: -8),
            btnStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            btnStackView.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 3)
        
        ])
    }
    
    func gridBtnLayout() {
        NSLayoutConstraint.activate([
            gridBtn.
        
        ])
    }
    
    
    
    // UITextViewDelegate를 준수하는 경우 사용자가 링크를 탭할 때 호출될 메서드
//     func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//         // 사용자가 링크를 탭했을 때 웹 페이지를 여는 동작 추가
//         UIApplication.shared.open(URL, options: [:], completionHandler: nil)
//         return false // 기본 동작을 수행하지 않도록 false 반환
//     }
}
