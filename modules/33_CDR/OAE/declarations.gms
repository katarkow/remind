*** |  (C) 2006-2022 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/33_CDR/weathering/declarations.gms
scalars
s33_oae_rock_demand "the amount of rock required to sequester 1GtC [Gt rock / GtC]"
s33_CO2_chem_decomposition  "the fraction of CO2 that comes from chemical decomposition in the calcination process"
;

parameters
p33_FEdemand(all_te,all_enty)  "final energy demand [TODO unit / GtC]"
;

positive variables
v33_FEdemand(ttot,all_regi,all_te,all_enty,all_enty) "final energy demand for CDR deployment [TODO unit / a]"
vm_ccs_cdr(ttot,all_regi,all_enty,all_enty,all_te,rlf)  "CCS emissions from CDR [GtC / a]"
;

negative variables
v33_emi(ttot,all_regi,all_te)        "negative CO2 emission from CDR [GtC / a]"
;

equations
q33_demFeCDR(ttot,all_regi,all_enty)                   "CDR demand balance for final energy"
q33_FEdemand(ttot,all_regi,all_te,all_enty)            "final energy demand equation" 
q33_emi(ttot,all_regi)                                 "CDR emissions" 
q33_capconst(ttot,all_regi)                            "Capacity"
q33_ccsbal(ttot,all_regi,all_enty,all_enty,all_te)     "CCS chain" 
q33_H2bio_lim(ttot,all_regi,all_te)                    "limits H2 from bioenergy to FE - otherFEdemand, i.e. no H2 from bioenergy for DAC"
;

*** EOF ./modules/33_CDR/weathering/declarations.gms
