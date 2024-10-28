# Define the path to the folder you want to delete
$folderPath = "C:\Users\YourUsername\FolderToDelete"  # Replace with the actual path

# Check if the folder exists
if (Test-Path -Path $folderPath) {
    # Remove the folder and its contents
    Remove-Item -Path $folderPath -Recurse -Force
    Write-Host "Folder deleted successfully: $folderPath"
} else {
    Write-Host "Folder not found: $folderPath"
}
