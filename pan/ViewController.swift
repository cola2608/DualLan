//
//  ViewController.swift
//  pan
//
//  Created by Cola on 2017/4/27.
//  Copyright © 2017年 Cola. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import GoogleAPIClientForREST
import GTMOAuth2

class PanViewController: UIViewController {

    let modArray = NSMutableArray()
    let modViewArray = NSMutableArray()
    var deleteBtn: UIButton = UIButton()
    var tmpEntity = modEntity()
    var anotherUIView = UIView()
    var leftLanView = UIView()
    var rightLanView = UIView()
    var middleLanView = UIView()
    var indexOfMod = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(PanViewController.tap(recognizer:)))
        self.view.addGestureRecognizer(tap)
        self.parseData(xml: "https://drive.google.com/uc?export=download&id=0B80IZSV6fwB3eHpnbkIxcGdIbjg")
        self.leftLanView = Draw(frame: CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: self.view.frame.width / 3, height: self.view.frame.height)))
        self.rightLanView = Draw(frame: CGRect(
            origin: CGPoint(x: self.view.frame.width * 2 / 3, y: 0),
            size: CGSize(width: self.view.frame.width / 3, height: self.view.frame.height)))
        self.middleLanView = Draw2(frame: CGRect(
            origin: CGPoint(x: self.view.frame.width  / 3, y: 0),
            size: CGSize(width: self.view.frame.width / 3, height: self.view.frame.height)))
        self.view.addSubview(self.leftLanView)
        self.view.addSubview(self.middleLanView)
        self.view.addSubview(self.rightLanView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Initiail UI
    
    func initModView(view : UIView, number: Int) {
        let mod = self.modArray.object(at: number) as! modEntity
        let modView = UIView(frame: CGRect(
            x: mod.x - 30, y: mod.y - 40,
            width: 60, height: 80))
        modView.backgroundColor = UIColor.orange
        view.addSubview(modView)
        let modName = UILabel(frame: CGRect(x: 0, y: 20, width: 60, height: 15))
        let modType = UILabel(frame: CGRect(x: 0, y: 60, width: 60, height: 20))
        modName.text = mod.name
        modName.textAlignment = .center
        modName.adjustsFontSizeToFitWidth = true
        modType.adjustsFontSizeToFitWidth = true
        modType.textAlignment = .center
        modType.text = mod.type.getModelName()
        let imgaeView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imgaeView.downloadedFrom(url: URL(string: mod.imageURL)!)
        modView.addSubview(modName)
        modView.addSubview(modType)
        modView.addSubview(imgaeView)
        let pan = UIPanGestureRecognizer(
            target:self,
            action:#selector(PanViewController.pan(recognizer:)))
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(PanViewController.longPress(recognizer:)))
        
        pan.minimumNumberOfTouches = 1
        
        pan.maximumNumberOfTouches = 1
        
        modView.addGestureRecognizer(pan)
        modView.addGestureRecognizer(longPress)
        self.modViewArray.add(modView)
    }
    
    func initLocation(index : Int) {
        let height = self.view.frame.width > self.view.frame.height ? self.view.frame.height : self.view.frame.width
        switch index {
        case 0:
            (self.modArray.object(at: index) as! modEntity).x = 60
            (self.modArray.object(at: index) as! modEntity).y = height / 2
            (self.modArray.object(at: index) as! modEntity).lan = 0
            (self.modArray.object(at: index) as! modEntity).index = 0
        case 1:
            (self.modArray.object(at: index) as! modEntity).x = 150
            (self.modArray.object(at: index) as! modEntity).y = height / 2
            (self.modArray.object(at: index) as! modEntity).lan = 0
            (self.modArray.object(at: index) as! modEntity).index = 1
        case 2:
            (self.modArray.object(at: index) as! modEntity).x = 240
            (self.modArray.object(at: index) as! modEntity).y = height * 0.2
            (self.modArray.object(at: index) as! modEntity).lan = 1
            (self.modArray.object(at: index) as! modEntity).index = 0
            
        case 3:
            (self.modArray.object(at: index) as! modEntity).x = 330
            (self.modArray.object(at: index) as! modEntity).y = height * 0.2
            (self.modArray.object(at: index) as! modEntity).lan = 1
            (self.modArray.object(at: index) as! modEntity).index = 1
            
        case 4:
            (self.modArray.object(at: index) as! modEntity).x = 420
            (self.modArray.object(at: index) as! modEntity).y = height * 0.2
            (self.modArray.object(at: index) as! modEntity).lan = 1
            (self.modArray.object(at: index) as! modEntity).index = 2
        case 5:
            (self.modArray.object(at: index) as! modEntity).x = 240
            (self.modArray.object(at: index) as! modEntity).y = height * 0.8
            (self.modArray.object(at: index) as! modEntity).lan = 2
            (self.modArray.object(at: index) as! modEntity).index = 0
        case 6:
            (self.modArray.object(at: index) as! modEntity).x = 330
            (self.modArray.object(at: index) as! modEntity).y = height * 0.8
            (self.modArray.object(at: index) as! modEntity).lan = 2
            (self.modArray.object(at: index) as! modEntity).index = 1
        case 7:
            (self.modArray.object(at: index) as! modEntity).x = 510
            (self.modArray.object(at: index) as! modEntity).y = height / 2
            (self.modArray.object(at: index) as! modEntity).lan = 3
            (self.modArray.object(at: index) as! modEntity).index = 0
        case 8:
            (self.modArray.object(at: index) as! modEntity).x = 600
            (self.modArray.object(at: index) as! modEntity).y = height / 2
            (self.modArray.object(at: index) as! modEntity).lan = 3
            (self.modArray.object(at: index) as! modEntity).index = 1
        default:
            
            return
        }
    }
    
    func parseData (xml : String) {
        let url = URL.init(string: xml)!
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("data.json")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        Alamofire.download(url, to: destination).responseJSON { (response) in
            if let jsonData = response.result.value {
                let json = JSON(jsonData)
                for i in 0 ..< json["sigPath"]["blocks"].count {
                    if let name = json["sigPath"]["blocks"][i]["name"].string {
                        let mod = modEntity.init()
                        mod.name = name
                        mod.imageURL =  json["sigPath"]["blocks"][i]["img"].string!
                        mod.type =  json["sigPath"]["blocks"][i]["type"].int!
                        self.modArray.add(mod)
                        self.initLocation(index: i)
                        self.initModView(view: self.view, number: i)
                    }else {
                        print(json)
                    }
                }
                self.caculateLanView(timeInterval: 0)
            }
        }
    }
    
    func addDeleteButton(view: UIView) {
        self.deleteBtn = UIButton(frame: CGRect(x: 50, y: 0, width: 10, height: 10))
        self.deleteBtn.setTitle("x", for: UIControlState.normal)
        self.deleteBtn.addTarget(self, action: #selector(PanViewController.deleteView), for: UIControlEvents.touchUpInside)
        view.addSubview(self.deleteBtn)
    }
    
    //MARK: - GestureRecognizer
    
    func pan(recognizer:UIPanGestureRecognizer) {
        if self.indexOfMod == -1 {
            return
        }
        let modOfSource = self.modArray.object(at: self.indexOfMod) as! modEntity
        var xOfLastIndex:CGFloat = 0
        var yOfLastIndex:CGFloat = 0
        let point = recognizer.location(in: self.view)
        for i in 0 ..< self.modViewArray.count  {
            if self.indexOfMod == i {
                continue
            }
            let modView = self.modViewArray.object(at: i) as! UIView
            if point.x > modView.center.x - 20 && point.x < modView.center.x + 20 && point.y > modView.center.y - 20 && point.y < modView.center.y + 20 {
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    if point.x > modView.center.x {
                        self.setModViewIndex(index: self.indexOfMod, toIndex: i, isMoveLeft: false)
                        self.setModViewLocation()
                        self.caculateLanView(timeInterval: 0)
                    } else {
                        self.setModViewIndex(index: self.indexOfMod, toIndex: i, isMoveLeft: true)
                        self.setModViewLocation()
                        self.caculateLanView(timeInterval: 0)
                    }
                }, completion: nil)
            }
        }
        if caculateLanCount(index: 2) > caculateLanCount(index: 1) {
            let length: CGFloat = CGFloat(caculateLanCount(index: 2) - caculateLanCount(index: 1))
            for i in 0 ..< self.modArray.count {
                let mod = self.modArray.object(at: i) as! modEntity
                if mod.lan == 1 && mod.index == caculateLanCount(index: 1) - 1 {
                    xOfLastIndex = mod.x + CGFloat(30)
                    yOfLastIndex = mod.y
                    break
                }
            }
            if point.x > xOfLastIndex && point.x < xOfLastIndex + 90 * length && point.y < yOfLastIndex + 20 && point.y > yOfLastIndex - 20 {
                if caculateLanCount(index: 1) == 0 {
                    xOfLastIndex = CGFloat(caculateLanCount(index: 0) * 90 + 30)
                    yOfLastIndex = self.view.frame.height * 0.2
                }else {
                    for i in 0 ..< self.modArray.count {
                        let mod = self.modArray.object(at: i) as! modEntity
                        if mod.lan == modOfSource.lan && mod.index > modOfSource.index {
                            mod.index = mod.index - 1
                        }
                    }
                }
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    modOfSource.lan = 1
                    modOfSource.index = self.caculateLanCount(index: 1) - 1
                    self.setModViewLocation()
                    self.caculateLanView(timeInterval: 0)
                }, completion: nil)
            }
        } else if caculateLanCount(index: 1) > caculateLanCount(index: 2) {
            let length: CGFloat = CGFloat(caculateLanCount(index: 1) - caculateLanCount(index: 2))
            if caculateLanCount(index: 2) == 0 {
                xOfLastIndex = CGFloat(caculateLanCount(index: 0) * 90 + 30)
                yOfLastIndex = self.view.frame.height * 0.8
            }else {
                for i in 0 ..< self.modArray.count {
                    let mod = self.modArray.object(at: i) as! modEntity
                    if mod.lan == 2 && mod.index == caculateLanCount(index: 2) - 1 {
                        xOfLastIndex = mod.x + CGFloat(30)
                        yOfLastIndex = mod.y
                        break
                    }
                }
            }
            if point.x > xOfLastIndex && point.x < xOfLastIndex + 90 * length && point.y < yOfLastIndex + 20 && point.y > yOfLastIndex - 20 {
                for i in 0 ..< self.modArray.count {
                    let mod = self.modArray.object(at: i) as! modEntity
                    if mod.lan == modOfSource.lan && mod.index > modOfSource.index {
                        mod.index = mod.index - 1
                    }
                }
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    modOfSource.lan = 2
                    modOfSource.index = self.caculateLanCount(index: 2) - 1
                    self.setModViewLocation()
                    self.caculateLanView(timeInterval: 0)
                }, completion: nil)
            }
        }
        if recognizer.state == UIGestureRecognizerState.ended {
            self.setModViewLocation()
        } else {
            (self.modViewArray.object(at: self.indexOfMod) as! UIView).center = point
        }
    }
    
    func longPress(recognizer: UILongPressGestureRecognizer) {
        self.deleteBtn.removeFromSuperview()
        let point = recognizer.location(in: self.view)
        for i in 0 ..< self.modViewArray.count  {
            let modView = self.modViewArray.object(at: i) as! UIView
            if point.x > modView.center.x - 30 && point.x < modView.center.x + 30 && point.y > modView.center.y - 40 && point.y < modView.center.y + 40 {
                self.indexOfMod = i
                self.tmpEntity.x = modView.center.x
                self.tmpEntity.y = modView.center.y
            }else {
                modView.layer.removeAllAnimations()
            }
        }
        let myAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init() //创建动画
        myAnimation.isRemovedOnCompletion = false //设置这个属性为false,当应用退到后台再进来的时候保证动画还存在
        let left: CGFloat = CGFloat(Double.pi / 2) * 0.01 //这个值控制动画的抖动范围(振幅)
        let right: CGFloat = CGFloat( -Double.pi / 2) * 0.01
        
        myAnimation.keyPath = "position" //设置动画的样式
        myAnimation.keyPath = "transform.rotation"
        
        myAnimation.values = [(left),(right),(left)]
        myAnimation.duration = 0.3 //执行一次动画的时间
        myAnimation.repeatCount = MAXFLOAT //执行无限次
        
        (self.modViewArray.object(at: self.indexOfMod) as! UIView).layer.add(myAnimation, forKey: nil) //添加动画到控件的layer层
        self.addDeleteButton(view: (self.modViewArray.object(at: self.indexOfMod) as! UIView))
    }
    
    func tap(recognizer: UILongPressGestureRecognizer) {
        self.deleteBtn.removeFromSuperview()
        self.indexOfMod = -1
        for i in 0 ..< self.modViewArray.count  {
            let modView = self.modViewArray.object(at: i) as! UIView
            modView.layer.removeAllAnimations()
        }
    }
    
    //MARK: - Caculate Mod

    func changeView(leftLocation: CGFloat,middleLocation: CGFloat, rightLocation: CGFloat, timeInterval: TimeInterval) {
        UIView.animate(withDuration: timeInterval, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.rightLanView.frame = CGRect(x: middleLocation, y: 0, width: rightLocation - middleLocation, height: self.view.frame.height)
        }, completion: nil)
        UIView.animate(withDuration: timeInterval, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.middleLanView.frame = CGRect(x: leftLocation, y: 0, width: middleLocation - leftLocation, height: self.view.frame.height)
        }, completion: nil)
        UIView.animate(withDuration: timeInterval, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.leftLanView.frame = CGRect(x: 0, y: 0, width: leftLocation, height: self.view.frame.height)
        }, completion: nil)
    }
    
    func deleteView() {
        let modSource =  self.modArray.object(at: self.indexOfMod) as! modEntity
        for i in 0 ..< self.modArray.count {
            let mod = self.modArray.object(at: i) as! modEntity
            if mod.lan == modSource.lan  && mod.index > modSource.index{
                mod.index = mod.index - 1
            }
        }
        self.modArray.removeObject(at: self.indexOfMod)
        (self.modViewArray.object(at: self.indexOfMod) as! UIView).removeFromSuperview()
        self.modViewArray.removeObject(at: self.indexOfMod)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.setModViewLocation()
            self.caculateLanView(timeInterval: 0)
        }, completion: nil)
    }
    
    func caculateLanCount(index: Int) -> Int {
        var result = 0
        for item in self.modArray {
            let object = item as! modEntity
            if object.lan == index {
                result = result + 1
            }
        }
        return result
    }
    
    func caculateLanView(timeInterval : TimeInterval) {
        let middleLineCount = caculateLanCount(index: 1) > caculateLanCount(index: 2) ? caculateLanCount(index: 1) : caculateLanCount(index: 2)
        let leftLanLength = caculateLanCount(index: 0) > 0 ? caculateLanCount(index: 0) * 90 - 30 : 30
        let middleLanLength = middleLineCount > 0 ? middleLineCount * 90 + 90 : 60
        let rightLanLength = caculateLanCount(index: 3) * 90 + 30
        self.changeView(leftLocation: CGFloat(leftLanLength),middleLocation: CGFloat(leftLanLength + middleLanLength), rightLocation: CGFloat(leftLanLength + middleLanLength + rightLanLength), timeInterval: timeInterval)
    }
    
    func setModViewIndex(index: Int, toIndex: Int, isMoveLeft: Bool) {
        let modViewSource = self.modArray.object(at: index) as! modEntity
        let modViewDestination = self.modArray.object(at: toIndex) as! modEntity
        
        if modViewSource.lan == modViewDestination.lan {
            let tmp = modViewSource.index
            modViewSource.index = modViewDestination.index
            modViewDestination.index = tmp
        } else {
            for i in 0 ..< self.modArray.count {
                let mod = self.modArray.object(at: i) as! modEntity
                if i == index { //skip self
                    continue
                } else if mod.lan == modViewDestination.lan { //計算detination index
                    if isMoveLeft && mod.index > modViewDestination.index {
                        mod.index = mod.index + 1
                    } else if !isMoveLeft && mod.index >= modViewDestination.index {
                        mod.index = mod.index + 1
                    }
                } else if mod.lan == modViewSource.lan { //計算source index
                    if mod.index > modViewSource.index {
                        mod.index = mod.index - 1
                    }
                }
            }
            modViewSource.lan = modViewDestination.lan
            if isMoveLeft {
                modViewSource.index = modViewDestination.index + 1
            } else {
                modViewSource.index = modViewDestination.index - 1
            }
        }
    }
    
    func reloadView(){
        for i in 0 ..< self.modViewArray.count {
            let view =  self.modViewArray.object(at: i) as! UIView
            let mod = self.modArray.object(at: i) as! modEntity
            view.center.x = mod.x
            view.center.y = mod.y
        }
    }
    
    func setModViewLocation() {
        
        let middleLineCount = caculateLanCount(index: 1) > caculateLanCount(index: 2) ? caculateLanCount(index: 1) : caculateLanCount(index: 2)
        let leftLanLength = caculateLanCount(index: 0) > 0 ? caculateLanCount(index: 0) * 90 - 30 : 30
        let middleLanLength = middleLineCount > 0 ? middleLineCount * 90 + 90 : 60
        let height = self.view.frame.width > self.view.frame.height ? self.view.frame.height : self.view.frame.width
        for i in 0 ..< self.modArray.count {
            let object = self.modArray.object(at: i) as! modEntity
            switch object.lan {
            case 0:
                object.x = CGFloat(90 * object.index + 60)
                object.y = height * 0.5
            case 1:
                object.x = CGFloat(90 + 90 * object.index + leftLanLength)
                object.y = height * 0.2
            case 2:
                object.x = CGFloat(90 + 90 * object.index + leftLanLength)
                object.y = height * 0.8
            case 3:
                object.x = CGFloat(90 * object.index + leftLanLength + middleLanLength)
                object.y = height * 0.5
            default:
                break
            }
        }
        for i in 0 ..< self.modViewArray.count {
            let view =  self.modViewArray.object(at: i) as! UIView
            let mod = self.modArray.object(at: i) as! modEntity
            view.center.x = mod.x
            view.center.y = mod.y
        }
    }

}

class Draw: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext()
        {
            context.saveGState()
            var  t = context.ctm
            t = t.inverted()
            context.concatenate(t)
            self.drawLine(in: context)
        }
    }
    
    func drawLine(in context: CGContext) {
        context.setLineWidth(10)
        context.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        context.move(to: CGPoint(x: 0, y: context.height / 2 - 5))
        context.addLine(to: CGPoint(x: context.width, y: context.height / 2 - 5))
        context.drawPath(using: .stroke)
    }
}

class Draw2: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        let x = rect.minX
        let color:UIColor = UIColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        let drect = CGRect(x: x , y: h * 0.2 ,width: w,height: h * 0.6)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        bpath.lineWidth = 10
        color.set()
        bpath.stroke()
    }
    
}
