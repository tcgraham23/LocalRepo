select
	 distinct 
		n.*, f.InstitutionID
from NCLEXPassRates2017v2 n
		join NCLEXInstitutionPassRate_AllStates f
	on n.Name = f.InstitutionName
	--where n.RNPN = f.NCLEXType
	where n.Type = f.NCLEXType 
order by n.Name


Update NCLEXPassRates2017v2
set InstitutionID = f.InstitutionID
from NCLEXPassRates2017v2 n 
		join NCLEXInstitutionPassRate_AllStates f
		on n.Name = f.InstitutionName
	--where n.RNPN = f.NCLEXType
	where n.Type = f.NCLEXType 