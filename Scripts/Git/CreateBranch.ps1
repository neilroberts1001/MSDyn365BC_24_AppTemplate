# Prompt the developer for the new branch name
Clear-Host
Write-Host "This script will create a new branch from the current branch. Before creating the branch the script will first pull from the remote branch." -ForegroundColor Green
Write-Host
$branchName = Read-Host "Enter the name for the new branch (e.g. <TaskId>-TaskDesc)"

$branchName = "wip/$branchName"
Write-Host "The branch " -NoNewline
Write-Host $branchName -ForegroundColor Yellow -NoNewline
# Ask the developer if they want to proceed
$confirmation = Read-Host " will be created locally. Would like to proceed (y/n)?"

if ($confirmation -ne "y") {
    Write-Host "Operation cancelled because you selected $confirmation." -ForegroundColor DarkMagenta
    return  # Terminate the script without an error
}
# Pull changes from the remote  branch
Write-Host "Pulling from origin..." -ForegroundColor Cyan
git pull origin

# Create a new branch based on the current branch
Write-Host "Creating new branch locally..." -ForegroundColor Cyan
git checkout -b $branchName

# Display a success message
Write-Host 
Write-Host "You have been switched to the new branch " -NoNewline -ForegroundColor Green
Write-Host $branchName -NoNewline -ForegroundColor Yellow
Write-Host ", which has been created locally. The branch has not yet been pushed to the remote." -ForegroundColor Green