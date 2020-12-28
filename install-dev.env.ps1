#DEVOPS CHALLENGE CAPGEMINI
#TEAM : LOS ANEMOI

#1. =================== TOOLS INSTALLATION ===============

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

#Installation of Docker Desktop
$testdocker = powershell "docker version --format '{{.Server.Version}}'"
if(-not($testdocker)){
    Write-Output "Seems Docker Desktop is not installed, installing now"
    choco install docker-desktop
}
else{
    Write-Output "Docker Desktop version $testdocker is already installed"
}
#TODO : test installation OK
#TODO Docker launch???


#2. =================== CONTAINERS INSTALLATION ===============

#Installation of Postgres and PGAdmin
docker pull postgres
docker pull dpage/pgadmin4
docker network create --driver bridge pgnetwork
docker run --name POSTGRES -e PG_MODE=primary -e PG_PRIMARY_USER=postgres -e PG_PRIMARY_PASSWORD=datalake -e PG_ROOT_PASSWORD=datalake --hostname="postgres" --network="pgnetwork" -p 5432:5432 -d postgres
docker run --name PGADMIN4 -p 5431:80 -e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' -e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' --hostname="pgadmin4" --network="pgnetwork" -d dpage/pgadmin4
#Launch in browser : http://localhost:5431/, with user/pass : user@domain.com/SuperSecret
#Connect new serveur with host=postgres user=posgres password=datalake 