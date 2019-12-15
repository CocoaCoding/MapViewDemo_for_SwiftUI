import UIKit

extension Bundle
{
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Error locating \(file) in bundle.")
        }

        guard let loadedData = try? Data(contentsOf: url) else {
            fatalError("Error loading \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(T.self, from: loadedData) else {
            fatalError("Error decoding \(file) from bundle.")
        }

        return decodedData
    }
}
