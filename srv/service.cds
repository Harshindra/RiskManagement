using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using RiskManagement from '../db/schema';

service RiskManagementService
{
    annotate BusinessPartner with @restrict:
    [
        { grant : [ '*' ], to : [ 'RiskManager' ] },
        { grant : [ 'READ' ], to : [ 'Riskviewer' ] }
    ];

    annotate Mitigations with @restrict :
    [
        { grant : [ '*' ], to : [ 'RiskManager' ] },
        { grant : [ 'READ' ], to : [ 'Riskviewer' ] }
    ];

    annotate Risks with @restrict :
    [
        { grant : [ '*' ], to : [ 'RiskManager' ] },
        { grant : [ 'READ' ], to : [ 'Riskviewer' ] }
    ];

    @odata.draft.enabled
    entity Risks as
        projection on RiskManagement.Risks;

    @odata.draft.enabled
    entity Mitigations as
        projection on RiskManagement.Mitigations;

    entity BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName
        };
}

annotate RiskManagementService with @requires :
[
    'Riskviewer',
    'RiskManager'
];
