$idx=1
$version = Get-Date -Format 'yyyy.M.'
$tag="v$version$idx"
while($(gh api /repos/Glatzel/template/tags --jq '.[].name') -contains "$tag")
{
    $idx++
    $tag="v$version$idx"
}
write-output "tag $tag"
git tag -a $tag -m "add tag $tag"
git push origin $tag
pinact run --update
