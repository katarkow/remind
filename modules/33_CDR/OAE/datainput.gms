*** |  (C) 2006-2022 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/33_CDR/OAE/datainput.gms

s33_oae_rock_demand = 1.7; !! limestone from Renforth et al. 2013 TODO document other rock types
s33_CO2_chem_decomposition = 1.0; !! can be set to zero if no calcination is considered

!! TODO describe the sources, plug in the right numbers
!! feels from OL csv: 1.251753282
!! fehes from OL csv: 4.385187431
!! fedie from OL csv: 0.131163399 (for distribution) / total fuel: 0.187017546 per 1tCO2 seq 

p33_FEdemand("oae", "feels") = 1.8 * 3.67; !! TODO change this to s33_oae_rock_demand * energy demand per 1t rock
p33_FEdemand("oae", "fehes") = 5.4 * 3.67; !! TODO change this to s33_oae_rock_demand * energy demand per 1t rock
p33_FEdemand("oae", "fedie") = 0.1 * s33_oae_rock_demand * 3.67; !! 0.1EJ / 1 Gt rock

*** EOF ./modules/33_CDR/OAE/datainput.gms
