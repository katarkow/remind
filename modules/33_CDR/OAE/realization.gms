*** |  (C) 2006-2022 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/33_CDR/OAE/realization.gms

*' @description 
*' TODO description of OAE 

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/33_CDR/OAE/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/33_CDR/OAE/declarations.gms"
$Ifi "%phase%" == "datainput" $include "./modules/33_CDR/OAE/datainput.gms"
$Ifi "%phase%" == "equations" $include "./modules/33_CDR/OAE/equations.gms"
$Ifi "%phase%" == "bounds" $include "./modules/33_CDR/OAE/bounds.gms"
*######################## R SECTION END (PHASES) ###############################
*** EOF ./modules/33_CDR/OAE/realization.gms
