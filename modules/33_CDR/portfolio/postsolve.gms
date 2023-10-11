$ifthen.oae_glo_limit not %cm_33_OAE_lim% == "off" !! a temporary solution to set global OAE limits from shares from previous runs
    v33_emi.lo(t,"LAM","oae") = - 0.075888 * s33_oae_glo_limit;
    v33_emi.lo(t,"OAS","oae") = - 0.037646 * s33_oae_glo_limit;
    v33_emi.lo(t,"SSA","oae") = - 0.052321 * s33_oae_glo_limit;
    v33_emi.lo(t,"EUR","oae") = - 0.003885 * s33_oae_glo_limit;
    v33_emi.lo(t,"NEU","oae") = - 0.000235 * s33_oae_glo_limit;
    v33_emi.lo(t,"MEA","oae") = - 0.180761 * s33_oae_glo_limit;
    v33_emi.lo(t,"REF","oae") = - 0.343454 * s33_oae_glo_limit;
    v33_emi.lo(t,"CAZ","oae") = - 0.108662 * s33_oae_glo_limit;
    v33_emi.lo(t,"CHA","oae") = - 0.011272 * s33_oae_glo_limit;
    v33_emi.lo(t,"IND","oae") = - 0.066705 * s33_oae_glo_limit;
    v33_emi.lo(t,"JPN","oae") = - 0.004402 * s33_oae_glo_limit;
    v33_emi.lo(t,"USA","oae") = - 0.114769 * s33_oae_glo_limit;
$endif.oae_glo_limit