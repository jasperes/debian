& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:HOME/.oh-my-posh/themes/dracula-powerlevel10k/powerlevel10k_dracula.omp.json" --print) -join "`n"))

Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadlineKeyHandler -Key Ctrl+Spacebar -Function MenuComplete
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
