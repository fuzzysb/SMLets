import-module smlets
$Date = (get-date);

$Now = $Date.ToUniversalTime();

$NowPlusFourHours = $Now.AddHours(40000).ToString("yyyy-MM-dd HH:mm:ss");
$nowPlusFourHours
$CId = (Get-SCSMEnumeration IncidentStatusEnum.Closed$).id;

$RId = (Get-SCSMEnumeration IncidentStatusEnum.Resolved$).id;

$Class = Get-SCSMClass System.WorkItem.Incident$;

$cType = "Microsoft.EnterpriseManagement.Common.EnterpriseManagementObjectCriteria";

$cString = "Status != '$CId' and Status != '$RId' and TargetResolutionTime Is Not Null and TargetResolutionTime < '$NowPlusFourHours'";


$crit = new-object $cType $cString,$Class;

Get-SCSMObject -criteria $crit

remove-module smlets