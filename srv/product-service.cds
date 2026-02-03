using { sap.cap.prodshop as my } from '../db/schema.cds';

service productshop
{
    @odata.draft.enabled
    entity Product as
        projection on my.Product
        actions
        {
            action orderProduct
            (
                @title : 'Product Name'
                name : String,
                @title : 'Stock'
                stock : Integer
            );

            action fingerprint
            (
                username : String
            );

            action createPO
            (
                name : String
            );
        };

    entity Supplier as
        projection on my.Supplier;

    function myFunction
    (
        name : String
    )
    returns String;

    action myAction
    (
        name : String
    )
    returns String;
}

annotate productshop with @(requires: 'productmanager');
