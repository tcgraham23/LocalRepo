
	select 
		distinct 
		i.InstitutionID as ATIInstID
	,	n.*
	from NCLEXPassRates2017 n
		left join NCLEXInstitutionPassRate_AllStates i
		on n.InstName = i.InstitutionName
	Where i.InstitutionID is not null
	and i.PassRateYear =2016