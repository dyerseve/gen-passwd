<#Begin Header#>
#requires -version 2
<#
.SYNOPSIS
  Generates password and puts it in the clipboard
.DESCRIPTION
  Generates a list of passwords from the basic password function on dinopass.com then adds 3 random numbers and capitalizes the first letter to better fit password policies
.PARAMETER 
    None
.INPUTS
  None
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         dyerseve
  Creation Date:  2022-12-06
  Purpose/Change: Initial Dev
  
.EXAMPLE
  None
#>
<#End Header#>

<#Script Specific Variables#>
$filename = ".\passlist.csv"
$Num = Read-Host -Prompt 'How many passwords to generate?'

for ($i=1; $i -le $Num; $i++)
{
    $randompassword = Invoke-WebRequest -UseBasicParsing -Uri https://www.dinopass.com/password/simple | Select-Object -ExpandProperty content
    $randompassword = $randompassword.substring(0,1).toupper() + $randompassword.substring(1).tolower()
    $randompassword = $randompassword + (Get-Random -Minimum 0 -Maximum 9)
    #Add some symbols: ! # $ ^ 
    $randompassword = $randompassword + (33, 35, 36, 37, 46, 94 | Get-Random | % {[char]$_})
    $randompassword
}
