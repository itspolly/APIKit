# APIKit
##### ⚠️ Highly Experimental ⚠️

A lightweight and easy to use generic API client written in Swift. This only supports JSON responses which can be represented with codable for now.

## Basic Use

The API is built around a client, which can be created with a base API endpoint.

```swift
let client = APIClient(baseURL: URL(string: "http://example.com/v0/")!)
```

To create a request, conform a struct to `APIRequest`, and pass it to the client's send method.

## Example

An example can be found in `APIKit macOS Test`. The example uses [this API](https://github.com/rwieruch/node-express-server-rest-api) for testing.
