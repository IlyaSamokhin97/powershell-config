function Prompt {
    $gray = "`e[90m"
    $reset = "`e[0m"

    "$gray$((Get-Date).ToString("yy/MM/dd HH:mm:ss"))$reset PS $(Get-Location)>`r`n"
}

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}
