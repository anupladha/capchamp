using productshop as service from '../../srv/product-service';
using from '../../db/schema';

annotate service.Product with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : cost_price,
                Label : '{i18n>Price}',
            },
            {
                $Type : 'UI.DataField',
                Value : cost_stock,
                Label : '{i18n>Stock}',
            },
            {
                $Type : 'UI.DataField',
                Value : rating,
                Label : '{i18n>Rating}',
            },
            {
                $Type : 'UI.DataField',
                Value : category,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Supplier Information',
            ID : 'SupplierInformation',
            Target : '@UI.FieldGroup#SupplierInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversation',
            ID : 'Conversation',
            Target : 'conversation/@UI.LineItem#Conversation',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.fingerprint',
            Label : '{i18n>Fingerprint}',
            Inline : true,
            Criticality : #Positive,
            IconUrl : 'sap-icon://biometric-thumb',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Product}',
            Value : name,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : '{i18n>OrderProduct}',
            Inline : true,
            Criticality : #Negative,
        },
        {
            $Type : 'UI.DataField',
            Value : category,
            Label : '{i18n>Category}',
        },
        {
            $Type : 'UI.DataField',
            Value : cost_stock,
            Label : '{i18n>Stock}',
        },
        {
            $Type : 'UI.DataField',
            Value : cost_price,
            Label : '{i18n>Price}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.createPO',
            Label : '{i18n>PurchaseOrder}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#criticality',
            Label : '{i18n>5starRating}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#emission1',
            Label : '{i18n>Emission}',
        },
    ],
    UI.SelectionFields : [
        name,
        category,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : supplier.name,
        },
        TypeImageUrl : 'sap-icon://car-rental',
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : '{i18n>OrderProduct}',
            Criticality : #Negative,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.fingerprint',
            Label : '{i18n>Fingerprint}',
            Determining : true,
            Criticality : #Positive,
        },
    ],
    UI.FieldGroup #SupplierInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : supplier.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.name,
                Label : '{i18n>Name}',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.city,
                Label : '{i18n>City}',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.phone,
                Label : '{i18n>Phone}',
            },
        ],
    },
    UI.DataPoint #emission : {
        Value : emission,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.DataPoint #criticality : {
        Value : criticality,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.DataPoint #emission1 : {
        Value : emission,
        Visualization : #Progress,
        TargetValue : 100,
        Criticality : criticality,
    },
);

annotate service.Product with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Supplier',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'city',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};

annotate service.Product with {
    name @Common.Label : '{i18n>Product}'
};

annotate service.Product with {
    category @Common.Label : '{i18n>Category}'
};

annotate service.Product.conversation with @(
    UI.LineItem #Conversation : [
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.message,
            Label : '{i18n>Message}',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.processor,
            Label : '{i18n>Processor}',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.timestamp,
            Label : '{i18n>Timestamp}',
        },
    ]
);

annotate service.Supplier with {
    name @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Supplier',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'city',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'phone',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
)};

annotate service.Supplier with {
    ID @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Supplier',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextFirst,
)};

