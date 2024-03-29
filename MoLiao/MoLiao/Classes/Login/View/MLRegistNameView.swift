//
//  MLRegistNameView.swift
//  MoLiao
//
//  Created by study on 2019/4/17.
//  Copyright © 2019年 WY. All rights reserved.
//

import UIKit

protocol MLRegistNameViewDelegate: NSObjectProtocol {
    /// 公司所在地
    func loginClick(pageView: MLRegistNameView, name: String, pwd: String)
}

///  为自己起一个有趣的名字
class MLRegistNameView: MLRegistBaseView {
    
    var textView:UITextView!
    
    var tempBtn: UIButton!
    
    weak var delegate: MLRegistNameViewDelegate?
    /// 身高
    private var heightString = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTopicView(title: "为自己起一个有趣的名字吧")
        setupContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 点击事件
extension MLRegistNameView {
    
    /// 进入主界面
    @objc private func comeMainController() {
        let loginPwd: String = UserDefaults.standard.object(forKey: "loginPwd") as! String
        //用户不存在后就注册
        //执行注册的请求
        print("loginPwd==",loginPwd)
        print("textView==",textView.text)
        
        self.delegate?.loginClick(pageView: self, name: textView.text, pwd: loginPwd)
    }
}

// MARK:- UI创建
extension MLRegistNameView {
    
    private func setupContent() {
        
        textView = UITextView.init(frame: CGRect(x: (bgView.width - 220) / 2.0, y: FRegist_titleY, width: 220, height: 60))
        textView.font = UIFont.boldSystemFont(ofSize: 20.0)
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.gray.alpha(0.3)
        textView.textAlignment = .center
        bgView.addSubview(textView)
        
        
        let nextBtn = UIButton.init(type: .custom)
        nextBtn.frame = CGRect(x: 20, y: kScreenHeight - kStatusBarH - kNavH - 100, width: kScreenWidth - 40 - 2*kBgViewSpace, height: 45)
        nextBtn.setTitle("进入陌聊", for: .normal)
        nextBtn.layer.cornerRadius = 8
        nextBtn.clipsToBounds = true
        nextBtn.backgroundColor = UIColor.blue //kNavColor
        nextBtn.addTarget(self, action: #selector(comeMainController), for: .touchUpInside)
        bgView.addSubview(nextBtn)
    }
}
