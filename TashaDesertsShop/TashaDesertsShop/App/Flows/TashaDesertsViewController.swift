import UIKit

class TashaDesertsShopViewController: UIViewController {
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAuthRequest()
    }
    
    // MARK: Request methods
    
    func makeAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(login: "Login", password: "Password")
        factory.login(userName: user.login ?? "", password: user.password ?? "") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Reviews requests.
    func makeGetReviewsRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.getReviews(productId: 123) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeAddReviewRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
    let review = Review(reviewText: "Плохой товар, брать не советую, 1 звезда!", userId: 123, productId: 666)
        
        factory.addReview(review: review){ response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeRemoveReviewRequest() {
        let factory = requestFactory.makeReviewRequestFactory()
        
        factory.removeReview(reviewId: 123){ response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
