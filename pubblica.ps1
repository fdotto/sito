$SITO = "C:\Users\dotto\ARCHIVIO_FD\SITO"
$QUARTZ = "C:\Users\dotto\quartz"
$CONTENT = "$QUARTZ\content"
Write-Host "Copio i file da SITO..." -ForegroundColor Yellow
Copy-Item -Path "$SITO\*" -Destination $CONTENT -Recurse -Force
Set-Location $QUARTZ
git add .
$status = git status --porcelain
if ($status) {
    $data = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "aggiornamento sito - $data"
    git push origin main
    Write-Host "Sito aggiornato! https://sito-53u.pages.dev" -ForegroundColor Green
} else {
    Write-Host "Nessuna modifica rilevata." -ForegroundColor Green
}
