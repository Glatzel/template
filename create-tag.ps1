$version = Get-Date -Format 'yyyy.M.d'
$tag="v$version"
if($(gh api /repos/Glatzel/template/tags --jq '.[].name') -contains "$tag")
{
    write-output "tag $tag exists."
    gh release delete $tag --cleanup-tag -y
} else
{
    write-output "tag $tag does not exist."
}
if (git tag --list "<tag-name>") {
    git tag -d "<tag-name>"
}
git tag -a $tag -m "add tag $tag"
git push origin $tag
pinact run -u
