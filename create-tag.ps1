$version = Get-Date -Format 'yyyy.M.d'
$tag="v$version"
if($(gh api /repos/Glatzel/template/tags --jq '.[].name') -contains "$tag")
{
    write-output "tag $tag exists."
    git push origin --delete $tag
} else
{
    write-output "tag $tag does not exist."
}
if (git tag --list "$tag") {
    git tag -d "$tag"
}
git tag -a $tag -m "add tag $tag"
git push origin $tag
pinact run -u
