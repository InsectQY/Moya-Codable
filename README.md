# MoyaCodable
An extension for Moya that converts JSON data into Decodable objects.

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

Specify the parse path，Parsed into Array:
```swift
ApiProvider.request(.moive("1764796"), arrayModel: Person.self, path: "directors", success: {
    print("Success...\($0)")
}) {
    print("Error...\($0)")
}
```
Parsed into Object:
```swift
ApiProvider.request(.moive("1764796"), objectModel: Movie.self, success: {
    print("Success...\($0)")
}) {
    print("Error...\($0)")
}
```
# Installation 🔥

## Manually
1. Drag all source files under folder `Extension` to your project.
2. Enjoy.

## CocoaPods
Wait a moment

## Carthage
Wait a moment
