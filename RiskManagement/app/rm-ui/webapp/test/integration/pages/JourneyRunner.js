sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"rmui/test/integration/pages/RisksList",
	"rmui/test/integration/pages/RisksObjectPage"
], function (JourneyRunner, RisksList, RisksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('rmui') + '/test/flp.html#app-preview',
        pages: {
			onTheRisksList: RisksList,
			onTheRisksObjectPage: RisksObjectPage
        },
        async: true
    });

    return runner;
});

