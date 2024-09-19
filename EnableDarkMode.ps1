# Enable Dark Mode
$key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
Set-ItemProperty -Path $key -Name "AppsUseLightTheme" -Value 0
Set-ItemProperty -Path $key -Name "SystemUsesLightTheme" -Value 0

# Enable Night Light (Direct Method)
try {
    # Night Light Toggle (using Windows API)
    $nightLightSetting = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" -ErrorAction Stop
    if ($nightLightSetting) {
        Write-Output "Night Light settings found."
        # Attempt to enable Night Light (simplified method)
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" -Name "NightLight" -Value 1
        Write-Output "Night Light enabled."
    } else {
        Write-Output "Night Light settings not found."
    }
} catch {
    Write-Error "Failed to enable Night Light. Error: $_"
}

# Open Night Light settings
Start-Process ms-settings:nightlight
