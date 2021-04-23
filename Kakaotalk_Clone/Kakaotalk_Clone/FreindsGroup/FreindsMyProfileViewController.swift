import UIKit

class FreindsMyProfileViewController:
    UIViewController {
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGestureRecognizer!)
    }
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func panGestureAction(_ panGesture: UIPanGestureRecognizer){
            let translation = panGesture.translation(in: view)
            if panGesture.state == .began{ // 터치한 후 좌표가 바뀌는 순간
            originalPosition = view.center //원래 있던 위치
            currentPositionTouched = panGesture.location(in: view)
        }
        else if panGesture.state == .changed{
            let velocity_s = panGesture.velocity(in: view)
            if velocity_s.y < 0{
                panGesture.state = .ended
                UIView.animate(withDuration: 0, animations: {self.view.center = self.originalPosition!})
            }
            view.frame.origin = CGPoint(x: 0, y: translation.y)
        }
        else if panGesture.state == .ended{
            let velocity = panGesture.velocity(in: view)
            if velocity.y >= 1500{
                UIView.animate(withDuration: 0.2, animations: {self.view.frame.origin = CGPoint(x: self.view.frame.origin.x, y: self.view.frame.size.height)}, completion: { (isCompleted) in if isCompleted{self.dismiss(animated: false, completion: nil)
                }
            })
            }
                else {
                    UIView.animate(withDuration: 0.2, animations: {self.view.center = self.originalPosition!})
                }
            }
            
        }
}
