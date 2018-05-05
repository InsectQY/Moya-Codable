# MoyaCodable
An extension for Moya and RxSwift that converts JSON data into Decodable objects.

# Requirements
- Swift 4+
- Xcode 9+

# Usage
Let's decode a simple json file:
```

{
　　"rating":{
　　　　"max":10,
　　　　"average":7.4,
　　　　"stars":"40",
　　　　"min":0
　　},
　　"year":"2009",
　　"id":"1764796",
　　"title":"机器人9号",
　　"genres":[
　　　　"动画",
　　　　"冒险",
　　　　"奇幻"
　　],
　　"directors":[
　　　　{
　　　　　　"alt":"https://movie.douban.com/celebrity/1276787/",
　　　　　　"avatars":{
　　　　　　　　"small":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1351678808.44.webp",
　　　　　　　　"large":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1351678808.44.webp",
　　　　　　　　"medium":"https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1351678808.44.webp"
　　　　　　},
　　　　　　"name":"申·阿克",
　　　　　　"id":"1276787"
　　　　}
　　]
  }
}

```
Create following Swift model:

```swift
struct Movie: Codable {

    var year: String
    var id: String
    var title: String
    var rating: Rating
    var genres: [String]
    var directors: [Person]
}

struct Rating: Codable {
    
    var max: Float
    var min: Float
    var average: Float
    var stars: String
}

struct Images: Codable {
    
    var small: String
    var large: String
    var medium: String
}

struct Person: Codable {
   
    var alt: String
    var name: String
    var id: String
    
    var avatars: Images
}

```
### 1. Without RxSwift

MapObject:
```swift
ApiProvider.request(.moive("1764796")) { (result) in
            
    switch result {

    case let .success(response):

        do {

            let success = try response.mapObject(Movie.self)
            print("Success...\(success)")
        } catch {
            print(error)
        }
    case let .failure(error):
        print("Error...\(error)")
    }
}
```

You can also specify the map path:
```swift
ApiProvider.request(.moive("1764796")) { (result) in
            
    switch result {

    case let .success(response):

        do {

            let success = try response
            .mapArray(Person.self, path: "directors")
            print("Success...\(success)")
        } catch {
            print(error)
        }
    case let .failure(error):
        print("Error...\(error)")
    }
}
```
### 2. With RxSwift
MapObject:
```swift
ApiProvider.rx.request(.moive("1764796"))
    .mapObject(Movie.self)
    .subscribe(onSuccess: {
        print("Success...\($0)")
    }) {
        print("Error...\($0)")
    }.disposed(by: disposeBag)
```

You can also specify the map path:
```swift
ApiProvider.rx.request(.moive("1764796"))
    .mapArray(Person.self, path: "directors")
    .subscribe(onSuccess: {
        print("Success...\($0)")
    }) {
        print("Error...\($0)")
    }.disposed(by: disposeBag)
```

### 3. MoyaProvider
MapObject:
```swift
ApiProvider.request(.moive("1764796"), objectModel: Movie.self, success: {
    print("Success...\($0)")
}) {
    print("Error...\($0)")
}
```

You can also specify the map path:
```swift
ApiProvider.request(.moive("1764796"), arrayModel: Person.self, path: "directors", success: {
    print("Success...\($0)")
}) {
    print("Error...\($0)")
}
```

# Installation 🔥

## Manually
1. Drag all source files under folder `Moya-Codable` to your project.
2. Enjoy.

## CocoaPods
Wait a moment

## Carthage
Wait a moment
