<#
.SYNOPSIS
Makes a random generated password with a default string length of 15
.DESCRIPTION
Makes a random generated password with a default string length of 15
.PARAMETER s
Specifies that special characters will be used to generate the password. Parameter is not mandatory.
.PARAMETER count
Specifies the number of characters for the generated password. Could use a pipeline to pipe the value into count variable.
Parameter is not mandatory.
.INPUTS
System.Integer. Get-PasswordNumber can accept an int value to
determine the count parameter.
.OUTPUTS
System.String. New-Password returns the password.

.EXAMPLE
new-password -s
xl5OhXJ9an5E"qU
.EXAMPLE
new-password
HD4BK3wa4pb4PK9
.EXAMPLE
new-password -s 20 
$qxE%j5bCcAwo2gJ2C$6
.EXAMPLE
new-password -count 10 -s
7A#!gu&$!a
.EXAMPLE
1..10 | New-Password -s
k
DE
37M
$%41
8#lGj
5"#8O9
dh5#1%Q
"vte6H5&
9y8$xx%N%
#yPDUVX%4H

#>
function New-Password
{

  [cmdletbinding()]
  param([switch]$s,
  [Parameter(ValueFromPipeline=$true)][int]$count = 15)
  
  BEGIN {[string]$pass=""}
  PROCESS{if($s){
    for ($i = 1; $i -le $Count; $i+=1)
    {
      [string]$var = New-RandomChar -s
      $pass=$pass+$var
    }
    $pass=$pass -replace "`r`n", ""
  }
  else{
    for ($i = 1; $i -le $Count; $i+=1)
    {
      [string]$var = New-RandomChar
      $pass=$pass+$var
    }
    $pass=$pass -replace "`r`n", ""
  }
  $pass=$pass+"`n"
}
  END{return $pass}
}
function New-RandomChar
{
  param(
    [switch]$s
  )
  $numarr=1..9
  $bigarr=[char[]]([int][char]'A'..[int][char]'Z')
  $smollarr=[char[]]([int][char]'a'..[int][char]'z')
  $sarr=[char[]]([int][char]'!'..[int][char]'&')
  if($s){
    $tipas=get-random -maximum 4
    switch($tipas){
      0 {$n= Get-Random $numarr 
        $n=$n |Out-String
        return $n}
      1 {$n=Get-Random -maximum 26
        $n=$bigarr[$n] | Out-String
        return $n}
      2 {$n=Get-Random -maximum 26
        $n=$smollarr[$n] | Out-String
        return $n}
      3 {$n=Get-Random -maximum 6
        $n=$sarr[$n] | Out-String
        return $n}
    }
  }
  else {
    $tipas=get-random -maximum 3
    switch($tipas){
      0 {$n= Get-Random $numarr 
        $n=$n |Out-String
        return $n}
      1 {$n=Get-Random -maximum 26
        $n=$bigarr[$n] | Out-String
        return $n}
      2 {$n=Get-Random -maximum 26
        $n=$smollarr[$n] | Out-String
        return $n}
    }
  }
}
