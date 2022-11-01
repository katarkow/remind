*** |  (C) 2006-2022 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/33_CDR/all/sets.gms
sets

te_dyn33(all_te)  "all technologies"
/
      oae
/

teNoTransform_dyn33(all_te) "all technologies that do not transform energy but still have investment and O&M costs (like storage or grid)"
/
      oae
/

teNoTransform2rlf_dyn33(all_te,rlf)      "TODO correct? : mapping for final energy to grades"
/
      (oae) . 1
/

adjte_dyn33(all_te)           "technologies with linearly growing constraint on control variable"
/
      oae
/

fe2cdr(all_enty,all_enty,all_te)
/
      feels.feels.oae
      fegas.fehes.oae
      feh2s.fehes.oae
/
;

***-------------------------------------------------------------------------
***  add module specific sets and mappings to the global sets and mappings
***-------------------------------------------------------------------------
te(te_dyn33)                                   = YES;
teNoTransform(teNoTransform_dyn33)             = YES;
teNoTransform2rlf(teNoTransform2rlf_dyn33)     = YES;
teAdj(adjte_dyn33)                             = YES;

*** EOF ./modules/33_CDR/all/sets.gms
