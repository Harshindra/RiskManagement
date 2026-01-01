using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';
namespace RiskManagement;

entity Risks {
    key ID           : UUID;
        title        : String;
        prio         : String;
        descr        : String;
        impact       : Integer;
        criticallity : Integer;
        miti: Association to Mitigations;
        Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;

}

entity Mitigations {

    createdAt   : String;
    createdBy   : String;
    description : String;
    owner       : String;
    timeline    : String;
    risks : Association to many Risks on risks.miti = $self;

}
