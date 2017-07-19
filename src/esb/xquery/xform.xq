(:: pragma bea:global-element-parameter parameter="$srcdoc1" element="ns0:srcdoc" location="../xsd/source.xsd" ::)
(:: pragma bea:global-element-return element="ns1:destdoc" location="../xsd/dest.xsd" ::)

declare namespace ns0 = "http://esb.irm.state.gov/SR3-15359188721/xsd/source";
declare namespace ns1 = "http://esb.irm.state.gov/SR3-15359188721/xsd/dest";
declare namespace xf = "http://tempuri.org/SR3-15359188721/src/esb/xquery/xform/";

declare function xf:xform($srcdoc1 as element(ns0:srcdoc))
    as element(ns1:destdoc) {
        <ns1:destdoc>
            {
                for $record in $srcdoc1/ns0:record
                return
                    <ns1:entry>
                        <ns1:sid>{ data($record/ns0:id) }</ns1:sid>
                        <ns1:sssss>{ data($record/ns0:str) }</ns1:sssss>
                        <ns1:iiiiii>{ data($record/ns0:num) }</ns1:iiiiii>
                    </ns1:entry>
            }
        </ns1:destdoc>
};

declare variable $srcdoc1 as element(ns0:srcdoc) external;

xf:xform($srcdoc1)
