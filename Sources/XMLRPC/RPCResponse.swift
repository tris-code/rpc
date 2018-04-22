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

public struct RPCResponse {
    public let params: [RPCValue]

    public init(params: [RPCValue]) {
        self.params = params
    }
}

extension RPCResponse: Equatable {
    public static func ==(lhs: RPCResponse, rhs: RPCResponse) -> Bool {
        return lhs.params == rhs.params
    }
}
