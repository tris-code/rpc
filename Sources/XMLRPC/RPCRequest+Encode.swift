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

extension RPCRequest {
    public func encode<T: StreamWriter>(
        to stream: T,
        prettify: Bool = false
    ) throws {
        let document = XML.Document(rpcRequest: self)
        try document.encode(to: stream, prettify: prettify)
    }
}
