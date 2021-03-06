
import-module smlets
$Date = (get-date);

$Now = $Date.ToUniversalTime();

$NowMinusFourHours = $Now.AddHours(-4).ToString("yyyy-MM-dd HH:mm:ss");

$CId = (Get-SCSMEnumeration IncidentStatusEnum.Closed$).id;

$RId = (Get-SCSMEnumeration IncidentStatusEnum.Resolved$).id;

$Class = Get-SCSMClass System.WorkItem.Incident$;

$cType = "Microsoft.EnterpriseManagement.Common.EnterpriseManagementObjectCriteria";

$cString = "Status != '$CId' and Status != '$RId' and TimeAdded > '$NowMinusFourHours'";


$crit = new-object $cType $cString,$Class;

Get-SCSMObject -criteria $crit

remove-module smlets
