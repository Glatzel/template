$build=27
$version = Get-Date -Format 'yyyy.M'
$tag="v$version.$build"
git tag -a $tag -m "add tag $tag"
git push origin $tag
