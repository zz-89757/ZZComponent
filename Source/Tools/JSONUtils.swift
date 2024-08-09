import Foundation

public extension NSString {
    @objc func jsonDictionary() -> NSDictionary? {
        guard let data = self.data(using: String.Encoding.utf8.rawValue) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
    }

    @objc func jsonArray() -> NSArray? {
        guard let data = self.data(using: String.Encoding.utf8.rawValue) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSArray
    }
}

public extension NSDictionary {
    @objc func jsonData() -> NSData? {
        return try? JSONSerialization.data(withJSONObject: self, options: []) as NSData
    }

    @objc func jsonString() -> NSString? {
        guard let data = self.jsonData() else { return nil }
        return NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
    }
}

public extension NSArray {
    @objc func jsonData() -> NSData? {
        return try? JSONSerialization.data(withJSONObject: self, options: []) as NSData
    }

    @objc func jsonString() -> NSString? {
        guard let data = self.jsonData() else { return nil }
        return NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
    }
}

public extension String {
    func jsonDictionary() -> [String: Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }

    func jsonArray() -> [Any]? {
        guard let data = self.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any]
    }
}

public extension Dictionary {
    func jsonData() -> Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [])
    }

    func jsonString() -> String? {
        guard let data = self.jsonData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

public extension Array {
    func jsonData() -> Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [])
    }

    func jsonString() -> String? {
        guard let data = self.jsonData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
