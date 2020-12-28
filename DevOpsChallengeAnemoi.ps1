#DEVOPS CHALLENGE CAPGEMINI

#Installation of chocolatey 
$testchoco = powershell choco -v
if(-not($testchoco)){
    Write-Output "Seems Chocolatey is not installed, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Output "Chocolatey Version $testchoco is already installed"
}
#TODO : test installation OK


#Installation of git
$testgit = powershell git --version
if(-not($testgit)){
    Write-Output "Seems Git is not installed, installing now"
    choco install git.install
}
else{
    Write-Output "$testgit is already installed"
}
#TODO : test installation OK

#Installation of Visual Studio Code
$testvscode = powershell code --version
if(-not($testvscode)){
    Write-Output "Seems Visual Studio Code is not installed, installing now"
    choco install vscode -y
}
else{
    Write-Output "Visual Code version $testvscode is already installed"
}
#TODO : test installation OK
