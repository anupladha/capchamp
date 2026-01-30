namespace sap.cap.prodshop;

entity Product {
    key ID       : Integer;
        name     : String;
        stock    : Integer;
        price    : Integer;
        category : String;
}

entity Supplier {
    key ID    : String;
        name  : String(100);
        city  : String(100);
        phone : String(100);
}
