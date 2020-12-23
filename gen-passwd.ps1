<# v2 Added UseBasicParsing for systems that don't have IE initial configuration completed #>
$randompassword = Invoke-WebRequest -UseBasicParsing -Uri https://www.dinopass.com/password/simple | Select-Object -ExpandProperty content
$randompassword = $randompassword.substring(0,1).toupper() + $randompassword.substring(1).tolower()
$randompassword = $randompassword + (Get-Random -Minimum 0 -Maximum 9)
$randompassword | clip
