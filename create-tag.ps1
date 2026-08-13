$build=1
$version = Get-Date -Format 'yyyy.M.d'
$tag="v$version.$build"
git tag -a $tag -m "add tag $tag"
git push origin $tag
