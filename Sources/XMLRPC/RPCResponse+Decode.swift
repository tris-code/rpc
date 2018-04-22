/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

import XML
import Stream

extension RPCResponse {
    public init<T: StreamReader>(from stream: T) throws {
        let document = try XML.Document(from: stream)
        guard let root = document.root, root.name == "methodResponse" else {
            throw RPCError.invalidXML
        }

        var params = [RPCValue]()

        for param in root["params"].children {
            guard let value = param["value"].children.first else {
                throw RPCValueError(
                    reason: .empty,
                    description: "xml element has no content")
            }
            guard let element = XML.Element(value) else {
                throw RPCValueError(
                    reason: .invalidValue,
                    description: "xml element was expected")
            }
            params.append(try RPCValue(from: element))
        }
        self.params = params
    }
}
