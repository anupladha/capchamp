namespace sap.cap.prodshop;

using
{
    cuid,
    managed
}
from '@sap/cds/common';

aspect carbonemission
{
    emission : Integer;
    rating : String;
}

type pricecost
{
    price : Integer;
    stock : Integer;
}

entity Product : cuid, managed, carbonemission
{
    name : String;
    category : String;
    cost : pricecost;
    supplier : Association to one Supplier;
}

entity Supplier : cuid
{
    name : String(100);
    city : String(100);
    phone : String(100);
    product : Association to many Product on product.supplier = $self;
}
