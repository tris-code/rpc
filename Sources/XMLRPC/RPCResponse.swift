/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

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
