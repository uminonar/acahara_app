//
//  AssistViewController.swift
//  acahara_app
//
//  Created by RIho OKubo on 2016/06/04.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class AssistViewController: UIViewController {



    @IBOutlet weak var assistSideTrig: UIButton!
    @IBOutlet weak var assistMailContent: UITextView!
    @IBOutlet weak var assistComments: UIImageView!
    @IBOutlet weak var assistInfo: UIImageView!
    @IBOutlet weak var assistEye: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let sideT = FAKFontAwesome.barsIconWithSize(40)
//        let sideTImage = sideT.imageWithSize(CGSizeMake(40, 40))
//        assistSideTrig.imageView = UIImage(named:sideTImage)
//        
        
        let info = FAKFontAwesome.infoIconWithSize(15)
        let infoImage = info.imageWithSize(CGSizeMake(15, 15))
        assistInfo.image = infoImage
        
        let comments = FAKFontAwesome.commentsOIconWithSize(15)
        let commentsImage = comments.imageWithSize(CGSizeMake(15, 15))
        assistComments.image = commentsImage
        
        let eye = FAKFontAwesome.eyeIconWithSize(15)
        let eyeImage = eye.imageWithSize(CGSizeMake(15, 15))
        assistEye.image = eyeImage
        
        
        // assistMailContentのTextViewに枠をつける。
        assistMailContent.layer.borderWidth = 0.5
        
        // 枠の色を設定する。
        assistMailContent.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // 枠の角を丸くする。
        assistMailContent.layer.cornerRadius = 8
        
       
    }

    
    override func viewWillAppear(animated: Bool) {
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        var mailContent = myDefault.stringForKey("selectedText")
        
        //userDefaultはnilになる？textFieldは入力しなくても空文字が入ってくるからnilにはならない
        
        if ( mailContent != nil){
            assistMailContent.text = mailContent
        }
        
        
    }
    
 
    @IBAction func tapMailContent(sender: UITapGestureRecognizer) {
        
        
        let mailContentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MailContentViewController") as UIViewController
        
        presentViewController(mailContentVC, animated: true, completion: nil)
    }

    @IBAction func chosePostsVC(sender: UIButton) {
        //ChosePostsVCへモーダル遷移
        let ChosePostsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChosePostsViewController") as UIViewController
        
        presentViewController(ChosePostsVC, animated: true, completion: nil)
        
        
    }
       @IBAction func questionBtn(sender: UIButton) {
        //ChosePostsVCへモーダル遷移
        let ChosePostsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChosePostsViewController") as UIViewController
        
        presentViewController(ChosePostsVC, animated: true, completion: nil)
    }
    
    @IBAction func professorBtn(sender: UIButton) {
       
        assistMailContent.text = "稲陰 正彦先生\n\nお忙しいところ失礼いたします。この度、慶応義塾大学大学院メディアデザイン研究科に在籍中の大久保理穂様に代わりまして、ご連絡させて頂いております。大久保理穂様はこれまで、貴大学において、ハラスメントと思われる行為を受けたと感じ、今後の防止策を望んでいらっしゃいます。\n\n本サービスはアカデミックハラスメントの被害を、大学と学生の双方にとって負担なく迅速に解決する目的で作られました。学生は、ハラスメント状況について出来る限り具体的にその場で記録するよう促され、被害が深刻になる前に、繰り返しの状況説明による追体験を避けながら、適切な関係者に相談出来るよう配慮されております。\n\n下記リンク先にて、大久保理穂様がこれまでに経験なさった状況の一部をご確認頂けます。ご一読くださいますようお願い申し上げます。なお、このページは今回の相談のために作られたもので、一般公開はされておりません。\n\nアカデミックハラスメントは、放置されれば教員と学生の人生を大きく歪めてしまう可能性のある重大な行為です。子供の虐めと違い被害の深刻さは見過ごされがちですが、大人であればこそ取り返しのつかない被害に繋がり得ます。研究や仕事や家庭をこれから築いていく重要な一時期を教育の場は担っています。\n\n大久保理穂様の学びの機会や将来が守られますよう、十分なご配慮をお願い申し上げます。\n\nなおお手数ではございますが、具体的にどの様な対策がなされたか、このご本人様のメールアドレスにご返信頂けますと幸いです。\n\nアカハラ対策アプリ\n\nURL"

            self.userDefaultMailContentSet("教授")
        
    }
    @IBAction func assailant(sender: UIButton) {
        assistMailContent.text = "杉浦   先生\n\nお忙しいところ失礼いたします。この度、慶応義塾大学大学院メディアデザイン研究科に在籍中の大久保理穂様に代わりまして、ご連絡させて頂いております。\n\nこのサービスは、アカデミックハラスメントの被害を、負担なく迅速に解決する目的で作られました。被害者はハラスメント状況について出来る限り具体的にその場で記録を残すよう促され、被害が深刻になる前に、適切な相談が出来るよう配慮されております。\n\n大久保理穂様はこれまで、貴殿からハラスメントと思われる行為を受けたと感じていらっしゃいます。様々な誤解があるかもしれません。あるいは教育の場とはいえ、個人の相性に問題があるかも分かりません。\n\nただ、学生はより良い学びの機会を求めて多額の授業料を納めています。健全な学びの場を得る権利があります。またアカデミックハラスメントは、放置されれば学生のみならず教員の人生も大きく歪めてしまう可能性のある重大な行為です。子供の虐めと違い被害の深刻さは見過ごされがちですが、大人であればこそ取り返しのつかない被害に繋がることもあります。研究や仕事や家庭をこれから築いていく重要な一時期を教育の場は担っています。\n\n行為の記録の、少なくとも一部につき、下記リンクにてご確認頂けるようになっております。関連する行為は今後も記録され、必要に応じて公表される可能性がございます。また被害が長期化し、深刻化した場合には調停や訴訟に発展する可能性もございます。\n\n誤解が積み重なっているかもわかりません。今後はその様な事が起きないよう、学生の健全な学びの機会が確保されますよう、宜しくお願い申し上げます。\n\nアカハラ対策\n\nアプリ\n\nurl"
        
            self.userDefaultMailContentSet("加害者")
    }
    
    @IBAction func committeeBtn(sender: UIButton) {
        assistMailContent.text = "ご担当者様\n\nお忙しいところ失礼いたします。慶応義塾大学大学院メディアデザイン研究科に在学中の大久保理穂様に代わりましてご連絡させて頂いております。\n\nこのサービスは、アカデミックハラスメントの被害を、大学と学生の双方において、負担なく迅速に解決する目的で作られました。学生は、ハラスメント状況について出来る限り具体的にその場で記録を残すよう促され、被害が深刻になる前に、状況説明による追体験を出来る限り避けながら、適切な関係者に相談が出来るよう配慮されております。\n\n大久保理穂様はこれまで、貴大学において、ハラスメントに当たると思われる行為を経験し、貴委員会による具体的な調査と防止策を望んでいらっしゃいます。\n\n下記リンク先にて、大久保理穂様がこれまでに経験なさった状況の一部をご確認頂けます。実際の調査に当たっては、事前のカウンセリが不可欠かもしれませんが、証拠になり得るものもございます。ご一読くださいますようお願い申し上げます。なお、当該ページは今回の相談のために作られ、一般公開はされておりません。\n\n学生にとって健全な学びの機会を得ることが第一です。調査を通じ、貴大学における大久保理穂様の学ぶ環境が改善されますよう、心からお願い申し上げます。\n\nアカハラ対策サービス\n\nアプリ\nURL"
        
        self.userDefaultMailContentSet("防止委員会")
        
    }
    
    @IBAction func psycotherapistBtn(sender: UIButton) {
        assistMailContent.text = "aaaaaaa aaa先生\n\n初めてご連絡を差し上げます。先生のカウンセリングを希望されていらっしゃる大久保理穂様に代行して、カウンセリング依頼をさせて頂きたく、本メールを書かせて頂いております。\n\nこのサービスはアカデミックハラスメントの被害者が負担なく問題を解決できるよう作られました。アカデミックハラスメントの被害者の数は多く、学生全体の5割近くが経験者だと推察される報告書もございます。被害が深刻になるにつれ心に傷を抱え、日常生活に支障を来たす方もいらっしゃいます。その様な場合、専門家の先生方のお力添えで、健康な前向きさや生活を取り戻すことができます。\n\nアカデミックハラスメントでは、被害が深刻になる場合、調停や訴訟に発展する可能性がございます。その際に、被害や損害金の算定に当たりカウンセリング費用も考慮の対象になり得ます。通常の領収書以外に、どの様な内容を訴えていたか、どの様な症状を抱えていたか報告書作成を依頼することがございます。報告書の作成費用は別途ご請求頂いておりますが、その様な場合もお引き受け願えますでしょうか。報告書の作成金額の目安をお教え願えましたら幸いです。\n\n大久保理穂様は先生のカウンセリングを強く希望されていらっしゃいます。今後とも宜しくお願い申し上げます。このメールは大久保理穂様のメールアドレスを利用して発信されておりますので、引き続きのご本人様との日程調整等は、こちらのメールにご返信いただければ幸いです。\n\n＊ハラスメント状況についての記録の一部は下記リンクからご確認頂けるようになっております。必要に応じて、ご参照くださいませ。この依頼のために作られた特別なページのため、一般公開はされておりません。\n\nアカハラ対策サービス\n\nアプリ\nURL"
        
        self.userDefaultMailContentSet("心理療法士")
    }
    
    @IBAction func lawyerBtn(sender: UIButton) {
        assistMailContent.text = "ご担当者様\n\nお忙しいところ失礼いたします。貴事務所においてアカデミックハラスメント案件を扱うことの出来る弁護士の先生はいらっしゃいますでしょうか。\n\n現在、慶応義塾大学大学院メディアデザイン研究科に在籍し、アカデミックハラスメントの被害を受けている大久保理穂様のご依頼を受け、このメールを代行させて頂いております。\n\nこのサービスはアカデミックハラスメントの被害者が問題を相談する際に、何度も繰り返し説明を強いられ追体験することがないように作られました。\n\n被害を受けた学生はその場でできる限り具体的な記録を残すよう促され、被害が深刻になる前に適切な相談ができるように配慮されています。\n\nその様にして集められた被害状況の記録は、下記のリンク先にてご覧いただけます。ご一読頂いた上で、お引き受け頂ける先生がいらっしゃいましたら、面談の調整をお願い致します。このメールアドレスはご本人様のものですので、そのままご返信頂ければ幸いです。\n\n可能な限り被害者の追体験を避けるという趣旨から、まずは証拠状況と、お引き受け頂ける可能性の有無のご確認をお願いしております。何卒、ご理解とご協力をお願い申し上げます。\n\nアカハラ対策サービス\n\nアプリ\nURL"
        
        self.userDefaultMailContentSet("弁護士")
    }
    
    @IBAction func friendBtn(sender: UIButton) {
        assistMailContent.text = "あああああ様\n\nこんにちは！大久保理穂さんからご依頼を受け、。。。。さんにメールを差し上げています。大久保理穂さんは慶応義塾大学大学院メディアデザイン研究科において、アカハラ被害を受けいていると感じています。お気づきになられましたか？\n\nこのサービスはアカハラ被害にあった方が、できるだけ負担なく問題を解決できるように作られました。アカハラ被害は決して他人事ではありません。ある調査によると5割近い学生が何らかのアカハラを経験しています。\n\n今回、大久保理穂さんはあなたに協力を求めています。とは言っても大変なことではなく、アカハラに当たるような状況を見かけたら、「見かけたよ」と、ボタンをタップして欲しいのです。\n\n仕組みは簡単です！下記のリンク先で大久保理穂さんがこれまでに経験したハラスメントの記録が表示されます。その中で見かけたものがあった場合、「見かけたよ」ボタンをクリックしてください。\n\n今まで見かけたことがない場合、これから同様の被害が起きていないか、少し注意して見ていてください。アカハラは決して他人事ではありません。\n\nあなたの協力が加害者に知らされることはありません。大久保理穂さんが加害者以外の教授や防止委員会に相談する際に、重要な参考になりますが、その場合も名前が明かされることはありません。どうしても確認が必要な場合には、事前の許可をいただきます。\n\nアカハラを撲滅するために、健やかな学習環境を作るために、みんなで協力しましょう！宜しくお願いします。\n\nアカハラ対策サービス\n\nアプリ\nURL"
        
        self.userDefaultMailContentSet("友達")
        
    }
    
    
    func userDefaultMailContentSet(pType:String){
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(assistMailContent.text, forKey: "selectedText")
        
        myDefault.setObject(pType, forKey: "personType")
        
        //即反映させる
        myDefault.synchronize()
        
        
    }
    
    
    @IBAction func sendBtn(sender: UIButton) {
        
        //入力必須項目の確認
        //データを送信する
        
        //userDefaultの”selectedText”を空にする
        var myDefault = NSUserDefaults.standardUserDefaults()
        myDefault.removeObjectForKey("selectedText")
        myDefault.synchronize()
        

        
        //assistMailContentを空にする
        assistMailContent.text = ""
        
        //画面を落とす
        self.dismissViewControllerAnimated(true, completion:nil )
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
