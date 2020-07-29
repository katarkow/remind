*** |  (C) 2006-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
***-----------------------------------------------------------
***                  module specific bounds
***------------------------------------------------------------

*** Fix capacity factors to the standard value from data
vm_capFac.fx(t,regi,te) = pm_cf(t,regi,te);

*** FS: for historically limited biomass production scenario (cm_bioprod_histlim >= 0)
*** to avoid infeasibilities with vintage biomass capacities
*** allow bio techs to reduce capacity factor
if ( cm_bioprod_histlim ge 0,
	vm_capFac.lo(t,regi_sensscen,teBioPebiolc)$(t.val ge 2030) = 0;
);

*** FS: if flexibility tax on
*** decrease capacity factor of electrolysis to 0.5
*** as capacities run on lower-than-average electricity price
if ( cm_flex_tax eq 1,
	vm_capFac.fx(t,regi,"elh2")$(t.val ge 2010) = 0.5;
);

*** Lower bounds on VRE use (more than 0.01% of electricity demand) after 2015 to prevent the model from overlooking solar and wind
loop(regi,
  loop(te$(teVRE(te)),
    if ( (sum(rlf, pm_dataren(regi,"maxprod",rlf,te)) > 0.01 * pm_IO_input(regi,"seel","feels","tdels")) ,
         v32_shSeEl.lo(t,regi,te)$(t.val>2015) = 0.01; 
    );
  );
);

*RP* upper bound of 90% on share of electricity produced by a single VRE technology, and lower bound on usablese to prevent the solver from dividing by 0
v32_shSeEl.up(t,regi,teVRE) = 90;

vm_usableSe.lo(t,regi,"seel")  = 1e-6;

*** Fix capacity for h2curt technology (modeled only in RLDC)
vm_cap.fx(t,regi,"h2curt",rlf) = 0;


*RP To ensure that the REMIND model doesn't overlook CSP due to gdx effects, ensure some minimum use in regions with good solar insolation, here proxied from the csp storage factor:
loop(regi$(p32_factorStorage(regi,"csp") < 1),
  v32_shSeEl.lo(t,regi,"csp")$(t.val > 2025) = 0.5;
  v32_shSeEl.lo(t,regi,"csp")$(t.val > 2050) = 1;
  v32_shSeEl.lo(t,regi,"csp")$(t.val > 2100) = 2;
);




