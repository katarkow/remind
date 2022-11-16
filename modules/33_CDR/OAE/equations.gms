*** |  (C) 2006-2022 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/33_CDR/OAE/equations.gms

***---------------------------------------------------------------------------
*'  CDR Final Energy Balance
***---------------------------------------------------------------------------
q33_demFeCDR(t,regi,entyFe)$(entyFe2Sector(entyFe,"cdr")) .. 
	sum((te_dyn33,entyFe2)$fe2cdr(entyFe,entyFe2,te_dyn33),
		v33_FEdemand(t,regi,te_dyn33,entyFe,entyFe2)
	)
	=e=
	sum((entySe,te)$se2fe(entySe,entyFe,te),
  		vm_demFeSector(t,regi,entySe,entyFe,"cdr","ETS")
	);

q33_FEdemand(t,regi,te_dyn33,entyFe2)$(sum(entyFe, fe2cdr(entyFe,entyFe2,te_dyn33)))..
	sum(entyFe$fe2cdr(entyFe,entyFe2,te_dyn33),
		v33_FEdemand(t,regi,te_dyn33,entyFe,entyFe2)
	)
	=e=
	- v33_emi(t,regi,te_dyn33) * sm_EJ_2_TWa * p33_FEdemand(te_dyn33,entyFe2)
	;

q33_emi(t,regi)..
	vm_emiCdr(t,regi,"co2")
	=e=
	sum(te_dyn33, v33_emi(t,regi,te_dyn33))
	;

!! TODO add costs for transport ? 

q33_ccsbal(t,regi,ccs2te(ccsCo2(enty),enty2,te))..
	sum(teCCS2rlf(te,rlf), vm_ccs_cdr(t,regi,enty,enty2,te,rlf))
	=e=
	- s33_CO2_chem_decomposition * v33_emi(t,regi,"oae") !! TODO take a fraction of these emissions
	;

q33_capconst(t,regi)..
	v33_emi(t,regi,"oae")
	=e=
	- sum(teNoTransform2rlf_dyn33("oae",rlf),
		vm_capFac(t,regi,"oae") * vm_cap(t,regi,"oae",rlf)
	);

***---------------------------------------------------------------------------
*'  Limit the amount of H2 from biomass to the demand without DAC.
***---------------------------------------------------------------------------
q33_H2bio_lim(t,regi,te)$pe2se("pebiolc","seh2",te)..	         
	vm_prodSE(t,regi,"pebiolc","seh2",te)
	=l=
    vm_prodFe(t,regi,"seh2","feh2s","tdh2s") - sum(fe2cdr("feh2s",entyFe2,te_dyn33), v33_FEdemand(t,regi,te_dyn33,"feh2s",entyFe2))
	;

*** EOF ./modules/33_CDR/OAE/equations.gms
