1. I will provide you with a folder with requests from the old client
2. You will go over those, and firstly create all the types for it (not the reqeust types) - firstly make sure we don't already have the types in the new rewrite/sources/TwitterAPIKit path!
3. Once the types are created you will create the request object types. You will follow public struct & the format in the other rewrite/sources/twitterapikit/apiv2/.*RequestV2.swift files
4. Once those are done you will create the response types, responseTypes should use codingKeys to convert snakecase values to camelcase.
5. Once those are all done, you will write the examples for them following the examples format in rewrite/Sources/Examples/ & add them to the package.swift by following the existing formats