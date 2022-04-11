import UIKit

class TashaDesertsShopViewController: UIViewController {
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAuthRequest()
        makeSignupRequest()
        makeChangeUserDataRequest()
        makeLogoutRequest()
        makeGetReviewsRequest()
        makeAddReviewRequest()
        makeRemoveReviewRequest()
        makeGetCartRequest()
        makePayCartRequest()
        makeAddToCartRequest()
        makeDeleteFromCartRequest()
    }
    
    // MARK: - Auth, signup, change user data & logout requests.
    
    func makeAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(login: "rakodill", password: "mypass")
        
        factory.login(user: user) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeSignupRequest() {
        let factory = requestFactory.makeSignupRequestFactory()
        let user = User(login: "rakodill",
                        password: "mypass",
                        email: "evstarshov@icloud.com",
                        gender: "f",
                        creditCard: "2344-4324-2344-1233-1234",
                        bio: "Nothin intersting here",
                        name: "Eugene",
                        lastname: "Starshov")
        
        factory.signup(user: user) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeChangeUserDataRequest() {
        let factory = requestFactory.makeChangeUserDataRequestFactory()
        let user = User(id: 123,
                        login: "Vadim",
                        password: "mypassword",
                        email: "vadim@gmail.com",
                        gender: "f",
                        creditCard: "2344-4324-2344-1233-1234",
                        bio: "Nothin to tell ya folks %)",
                        name: "Vadim",
                        lastname: "Kichuk")
        
        factory.changeUserData(user: user) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeLogoutRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(id: 123)
        
        factory.logout(user: user) { response in
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
        let review = ReviewRequest(reviewText: "Плохой товар, брать не советую, 1 звезда!", userId: 123, productId: 666)
        
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
    
    
    //MARK: Cart Requsts
    
    func makeGetCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.getCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makePayCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.payCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeAddToCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        let cart = CartRequest(productId: 666, quantity: 1)
        
        factory.addToCart(cart: cart){ response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeDeleteFromCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        let cart = CartRequest(productId: 666)
        
        factory.deleteFromCart(cart: cart){ response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

