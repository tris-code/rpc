/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Test
import XML
import Stream
@testable import XMLRPC

class XMLRPCTests: TestCase {
    func streamWith(_ string: String) -> BufferedInputStream<InputByteStream> {
        let bytes = [UInt8](string.utf8)
        let stream = InputByteStream(bytes)
        return BufferedInputStream(baseStream: stream)
    }

    func testRequest() {
        do {
            let stream = streamWith("""
                <?xml version="1.0" encoding="utf-8" standalone="no"?>
                <methodCall>
                    <methodName>TestMethod</methodName>
                    <params>
                        <param>
                            <value><int>1</int></value>
                        </param>
                        <param>
                            <value><string>two</string></value>
                        </param>
                        <param>
                            <value><double>3.3</double></value>
                        </param>
                        <param>
                            <value><boolean>1</boolean></value>
                        </param>
                    </params>
                </methodCall>
                """)

            let expected = try XML.Document(from: stream).xmlCompact

            let request = RPCRequest(methodName: "TestMethod", params: [
                .int(1),
                .string("two"),
                .double(3.3),
                .bool(true)
            ])
            assertEqual(request.xmlCompact, expected)
        } catch {
            fail(String(describing: error))
        }
    }

    func testResponse() {
        let stream = streamWith("""
             <?xml version="1.0" encoding="utf-8"?>
             <methodResponse>
                 <params>
                     <param>
                         <value>
                             <struct>
                                 <member>
                                     <name>first</name>
                                     <value>
                                         <string>one</string>
                                     </value>
                                 </member>
                                 <member>
                                     <name>second</name>
                                     <value>
                                         <int>2</int>
                                     </value>
                                 </member>
                                 <member>
                                     <name>third</name>
                                     <value>
                                         <double>3.3</double>
                                     </value>
                                 </member>
                             </struct>
                         </value>
                     </param>
                 </params>
             </methodResponse>
             """)
        do {
            let response = try RPCResponse(from: stream)
            assertEqual(response, RPCResponse(params: [
                RPCValue.struct([
                    "first": .string("one"),
                    "second": .int(2),
                    "third": .double(3.3)
                ])
            ]))
        } catch {
            fail(String(describing: error))
        }
    }


    static var allTests = [
        ("testRequest", testRequest),
        ("testResponse", testResponse),
    ]
}
