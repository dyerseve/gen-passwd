<#Begin Header#>
#requires -version 2
<#
.SYNOPSIS
  Generates password and puts it in the clipboard
.DESCRIPTION
  Generates a password from the basic password function on dinopass.com then adds 3 random numbers and capitalizes the first letter to better fit password policies
.PARAMETER 
    None
.INPUTS
  None
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         dyerseve
  Creation Date:  2020-12-23
  Purpose/Change: Initial script development
  
.EXAMPLE
  None
#>
<#End Header#>

<#Script Specific Variables#>
$Exclude = "Company1","Company2"
$Prompt = "Testing Dialog"


<# v2 Added UseBasicParsing for systems that don't have IE initial configuration completed #>
$randompassword = Invoke-WebRequest -UseBasicParsing -Uri https://www.dinopass.com/password/simple | Select-Object -ExpandProperty content
$randompassword = $randompassword.substring(0,1).toupper() + $randompassword.substring(1).tolower()
$randompassword = $randompassword + (Get-Random -Minimum 0 -Maximum 9)
$randompassword | clip
