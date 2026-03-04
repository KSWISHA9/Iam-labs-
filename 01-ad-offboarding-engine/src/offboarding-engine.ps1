Import-Module ActiveDirectory

$TerminatedOU = "OU=Terminated,DC=contoso,DC=local"
$UserList = ".\terminated-users.txt"

$users = Get-Content $UserList

foreach ($user in $users) {

    Write-Host "Processing $user"

    Disable-ADAccount -Identity $user

    $groups = Get-ADPrincipalGroupMembership $user

    foreach ($group in $groups) {
        Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false
    }

    $dn = (Get-ADUser $user).DistinguishedName
    Move-ADObject -Identity $dn -TargetPath $TerminatedOU
}
