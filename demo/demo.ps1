#xml
"<wibble wobble=`"bobble`"><bibble>dibble</bibble></wibble>" #demo-xml        


([xml]"<wibble wobble=`"bobble`"><bibble>dibble</bibble></wibble>")   

([xml]"<wibble wobble=`"bobble`"><bibble>dibble</bibble></wibble>").wibble  



#more xml
$r=Invoke-WebRequest http://justsomebloke.com/blog/feed/rss #demo get rss 
$r
([xml]$r.Content).rss.channel.item | fl         
([xml]$r.Content).rss.channel.item | ft title, link
([xml]$r.Content).rss.channel.item | select title, link
([xml]$r.Content).rss.channel.item | select title, link | ConvertTo-Json


#json
Invoke-WebRequest https://httpbin.org/get
Invoke-WebRequest https://httpbin.org/get | select -ExpandProperty Content
$j = Invoke-WebRequest https://httpbin.org/get | select -ExpandProperty Content | ConvertFrom-Json
$j.origin
$j.headers
$j.headers.User<TAB>


Invoke-RestMethod https://httpbin.org/get


# Reverse search
# Ctrl+R JSON # look back through commands from the demos

# Azure/posh-HumpCompletion
Get-AzureRmResourceGroup
# Get-ARRG<TAB>
# Select-ARSu<TAB>
Get-AzureRmResourceGroup | ft
New-AzureRmResourceGroup -Name dno -Location "North Europe"
New-AzureRmResourceGroupDeployment -ResourceGroupName dno -TemplateFile template.json -TemplateParameterFile parameters.json

# In second pwsh terminal
Show-AzureRmResourceGroupDeploymentProgress -ResourceGroupName dno



# bonus - grouping etc
Get-Command | % { $_.Name.Split("-")[0] } 
Get-Command | % { @{Prefix=$_.Name.Split("-")[0];Name=$_.Name} } 
Get-Command | % {[PSCustomObject] @{Prefix=$_.Name.Split("-")[0];Name=$_.Name} }  
Get-Command | % {[PSCustomObject] @{Prefix=$_.Name.Split("-")[0];Name=$_.Name} } | group -Property Prefix | Sort-Object -Property Name     




#prompt fun
# function prompt { ".NET Oxford>_ "} 