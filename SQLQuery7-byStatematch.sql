select distinct InstitutionName, InstitutionID, NCLEXType
from NCLEXInstitutionPassRate_AllStates
where NCLEXStateAbbrev = 'FL'
and InstitutionID is not null
order by InstitutionName 