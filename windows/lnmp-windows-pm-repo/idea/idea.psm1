Import-Module downloader
Import-Module unzip

$lwpm=ConvertFrom-Json -InputObject (get-content $PSScriptRoot/lwpm.json -Raw)

$stableVersion=$lwpm.version
$preVersion=$lwpm.preVersion
$githubRepo=$lwpm.github
$homepage=$lwpm.homepage
$releases=$lwpm.releases
$bug=$lwpm.bug
$name=$lwpm.name
$description=$lwpm.description

Function install($VERSION=0,$isPre=0){
  if(!($VERSION)){
    $VERSION=$stableVersion
  }

  if($isPre){
    $VERSION=$preVersion
  }

  $url="https://download.jetbrains.com/toolbox/jetbrains-toolbox-${VERSION}.exe"
  $filename="jetbrains-toolbox-${VERSION}.exe"
  $unzipDesc="jetbrains-toolbox"

  # 下载原始 zip 文件，若存在则不再进行下载

  _downloader `
    $url `
    $filename `
    $name `
    $VERSION

  # 验证原始 zip 文件 Fix me

  # 解压 zip 文件 Fix me
  # _unzip $filename $unzipDesc
  # 安装 Fix me
  # Copy-item "" ""

  Start-Process -FilePath $filename -wait

  "==> Checking ${name} ${VERSION} install ..."
  # 验证 Fix me
  ""
}

Function uninstall(){
  ""
  # Remove-item
}
