# Unpack

[![Version](https://img.shields.io/cocoapods/v/Unpack.svg?style=flat)](http://cocoapods.org/pods/Unpack)
[![License](https://img.shields.io/cocoapods/l/Unpack.svg?style=flat)](http://cocoapods.org/pods/Unpack)
[![Platform](https://img.shields.io/cocoapods/p/Unpack.svg?style=flat)](http://cocoapods.org/pods/Unpack)

## About Unpack

Unpack is a simple library which wraps `Codable` protocols and allows easy encoding/decoding of you objects, levaraging the power of protocol and protocol extensions.

It takes away the need for the common boilertplate and leaves you with a clean, readable code.

There are many different ways to pack/unpack your object.

All you need to do is conform to `Packable` (for encoding), `Unpackable` (for decoding) or `UnPacked` (for both) and you're good to go.

In it's easiest form, it uses a default `JSONEncoder` / `JSONDecoder` to perform the conversion. If you'd like to provide your own settings, you could implement the getter in your class or use one of the functions that takes it as an argument.

### Some examples

instead of writing this for every conversion:

```swift
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let myObject: MyObject? = try? decoder.decode(MyObject.self, from: data)
```

Wouldn't it be easier to just do this?
```swift
        let myObject = try? MyObject.unpack(data: data)
```
Or this?
```swift
        let myObject: MyObject? = try? data.unpack()
```
It is for me.

How about the other way?
Convert this: 
```swift
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data: Data? = try? encoder.encode(myObject)
```
To this:
```swift
        let data: Data? = try? myObject.pack()
```
Simple, right?
It works just the same for arrays.

There are many other ways to do it.
Here's some examples:

```swift
let user: User? = try? unpack(data: data)
let data: Data? = try? pack(user)

let userDictionary = ["name" : "Walter White", "job" : "Chemistry teacher", "hidden_identity" : "Heisenberg"]
var unpacker = Unpacker<Person>(decoder: customDecoder)
let character = try? unpacker.unpack(json: userDictionary)
// The unpacker will get hold of your possible error (if you don't want to do-try-catch)
if let error = unpacker.error {
    print(error)
}
```
So easy it doesn't requires explanations. 

Go ahead and explore!


## Installation

Unpack is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod 'Unpack'
```

## Author

Oren Farhan


## License

Unpack is available under the MIT license. See the LICENSE file for more info.