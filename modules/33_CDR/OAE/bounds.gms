*** |  (C) 2006-2022 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/33_CDR/OAE/bounds.gms
vm_emiCdr.fx(t,regi,emi)$(not sameas(emi,"co2")) = 0.0;
vm_ccs_cdr.fx(t,regi,enty,enty2,te,rlf)$ccs2te(enty,enty2,te) = 0;
v33_emi.lo(t,regi,"oae") = -1 / 3.67;
*** EOF ./modules/33_CDR/OAE/bounds.gms
