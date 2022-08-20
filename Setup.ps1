# Micah Pennington
# June 30 2022 ©

# Set background color
$Host.UI.RawUI.BackgroundColor = "White"
$Host.UI.RawUI.ForegroundColor = "DarkCyan"
Clear-Host

Write-Host "Welcome to the interactive TSS computer setup!`nPlease make sure to run windows and harware updates before running this program!`nThis program was created by Micah Pennington. ©"


# Log
Start-Transcript -Append "C:\Deploy\TSS Setup Script\log.txt"


##################################################
############## User Account Options ##############
##################################################


# Enable and setup Admin Account
do {
    $input = Read-Host "Do you want to activate the Administrator account?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        $pass = Read-Host "Enter a password" -AsSecureString
        Enable-LocalUser -Name "Administrator"
        Set-LocalUser -Password $pass -PasswordNeverExpires $true
        Write-Host "Enabled Administrator account with custom password!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Administrator account has not been activated."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Require CTRL-ALT-DEL at login
do {
    $input = Read-Host "Do you want to require CTRL-ALT-DEL at login?`n[Yes, require]Y / [No, don't require]N / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DisableCAD" -value 0
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DisableCAD" -value 0
        }
        Write-Host "CTRL-ALT-DEL is now required at login!"
    }

    # No
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DisableCAD" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DisableCAD" -value 1
        }
        Write-Host "CTRL-ALT-DEL is NOT required at login."
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has not been changed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Disable first sign-in animation
do {
    $input = Read-Host "Do you want to disable the first sign-in animation?`n[Yes, disable]Y / [No, enable]N / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -value 0
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -value 0
        }
        Write-Host "The first sign-in animation is now disabled!"
    }

    # No
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -value 1
        }
        Write-Host "The first sign-in animation is now enabled!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Hide the last signed-in user
do {
    $input = Read-Host "Do you want to hide the last signed in user?`n[Yes, hide]Y / [No, show]N / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "dontdisplaylastusername" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "dontdisplaylastusername" -value 1
        }
        Write-Host "The last signed in user will now be hidden!"
    }
    
    # No
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "dontdisplaylastusername" -value 0
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "dontdisplaylastusername" -value 0
        }
        Write-Host "The last signed in user will be shown."
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Disable UAC
do {
    $input = Read-Host "Do you want to disable user account control? (The `"do you want this app to make changes to your PC popup`")`n[Yes, disable]Y / [No, enable]N / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -value 0
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -value 0
        }
        Write-Host "User Account Control is now disabled!"
    }

    # No
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -value 1
        }
        Write-Host "User Account Control is now enabled!"
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Disable user switching
do {
    $input = Read-Host "Do you want to disable the switch user button?`n[Yes, disable]Y / [No, enable]N / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -value 1
        }
        Write-Host "The switch user button is now disabled!"
    }

    # No
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -value 0
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -value 0
        }
        Write-Host "The switch user button is now enabled!"
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Auto Login Student
do {
    $input = Read-Host "Do you want to enable auto login for the student account?(Won't work correctly untill connected to domain, may lock you out of the computer if you restart before connected, be careful)`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        ##################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -value "sp.student"
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -value "sp.student"
        }
        ##################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultDomainName" -value "ACAD"
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultDomainName" -value "ACAD"
        }
        #############################################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "CachePrimaryDomain" -value "ACAD"
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "CachePrimaryDomain" -value "ACAD"
        }
        #############################################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword" -value "password"
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultPassword" -value "password"
        }
        #############################################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -value 1
        }
        #############################################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AltDefaultDomainName" -value "ACAD"
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AltDefaultDomainName" -value "ACAD"
        }
        #############################################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AltDefaultUserName" -value "sp.student"
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AltDefaultUserName" -value "sp.student"
        }
        Write-Host "Auto login for the student account is now enabled!"
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)

##################################################
################### PC Options ###################
##################################################


# Set Time Zone
do {
    $input = Read-Host "Do you want to set the time zone to EST?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        Set-TimeZone -id "Eastern Standard Time"
        Write-Host "Time zone has been set!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Time zone has not been changed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Set Wallpaper and Lock Screen background
do {
    $input = Read-Host "Do you want to set and lock the wallpaper and lock screen background?`n[Yes]Y / [Yes, let me specify the file]C / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        ###################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenImage" -value "C:\Deploy\TSS Setup Script\Images\Wallpaper.png"
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenImage" -value "C:\Deploy\TSS Setup Script\Images\Wallpaper.png"
        }
        ###################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenOverlaysDisabled" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenOverlaysDisabled" -value 1
        }
        ###################################################################################################################
        if (Test-Path "HKCU:\Control Panel\Desktop") {
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value "C:\Deploy\TSS Setup Script\Images\Wallpaper.png"
        }
        else {
            New-Item -Path "HKCU:\Control Panel\Desktop"
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value "C:\Deploy\TSS Setup Script\Images\Wallpaper.png"
        }
        ###################################################################################################################
        if (Test-Path "HKCU:\Control Panel\Desktop") {
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -name "WallpaperStyle" -value 10
        }
        else {
            New-Item -Path "HKCU:\Control Panel\Desktop"
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -name "WallpaperStyle" -value 10
        }
        Write-Host "Desktop and lock screen set!"
    }

    # Custom file
    if ($input -eq "C") {
        $correctInput = $true
        $fileLocation = Read-Host "Please specify the file location"
        ###################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenImage" -value $fileLocation
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenImage" -value $fileLocation
        }
        ###################################################################################################################
        if (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization") {
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenOverlaysDisabled" -value 1
        }
        else {
            New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
            Set-Itemproperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenOverlaysDisabled" -value 1
        }
        ###################################################################################################################
        if (Test-Path "HKCU:\Control Panel\Desktop") {
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $fileLocation
        }
        else {
            New-Item -Path "HKCU:\Control Panel\Desktop"
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $fileLocation
        }
        ###################################################################################################################
        if (Test-Path "HKCU:\Control Panel\Desktop") {
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -name "WallpaperStyle" -value 10
        }
        else {
            New-Item -Path "HKCU:\Control Panel\Desktop"
            Set-Itemproperty -path "HKCU:\Control Panel\Desktop" -name "WallpaperStyle" -value 10
        }
        Write-Host "Desktop and lock screen set!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Desktop and lock screen have not been changed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Enable Remote Desktop
do {
    $input = Read-Host "Do you want to enable Remote Desktop?`n[Yes, enable]Y / [No, disable]N / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\System\CurrentControlSet\Control\Terminal Server") {
            Set-Itemproperty -path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -name "fDenyTSConnections" -value 0
        }
        else {
            New-Item -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server"
            Set-Itemproperty -path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -name "fDenyTSConnections" -value 0
        }
        Write-Host "Remote Desktop is now enabled!"
    }
    
    # No
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\System\CurrentControlSet\Control\Terminal Server") {
            Set-Itemproperty -path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -name "fDenyTSConnections" -value 1
        }
        else {
            New-Item -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server"
            Set-Itemproperty -path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -name "fDenyTSConnections" -value 1
        }
        Write-Host "Remote Desktop is now disabled."
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Prevent this computer from helping others with windows updates
do {
    $input = Read-Host "Do you want to prevent this computer from helping others with windows updates?`n[Yes, disable]Y / [No, enable]N / [Skip]S"
    $correctInput = $false

    # Disable
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc") {
            Set-Itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc" -name "start" -value 4
        }
        else {
            New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc"
            Set-Itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc" -name "start" -value 4
        }
        Write-Host "This PC won't help others with updates!"
    }

    # Enable
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc") {
            Set-Itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc" -name "start" -value 2
        }
        else {
            New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc"
            Set-Itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\DoSvc" -name "start" -value 2
        }
        Write-Host "This PC will help others with updates!"
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Set Sleep
do {
    $input = Read-Host "Do you want to set sleep options?`n[Yes, with options]Y / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        # Input
        $monitorTimeout = Read-Host "Monitor sleep time (Minutes, 0 = never)"
        $diskTimeout = Read-Host "Disk sleep time (Minutes, 0 = never)"
        $standbyTimeout = Read-Host "Computer sleep time (Minutes, 0 = never)"
        $hibernateTimeout = Read-Host "Computer hibernate time (Minutes, 0 = never)"
        # Set options
        Powercfg /Change monitor-timeout-ac $monitorTimeout
        Powercfg /Change monitor-timeout-dc $monitorTimeout
        Powercfg /Change disk-timeout-ac $diskTimeout
        Powercfg /Change disk-timeout-dc $diskTimeout
        Powercfg /Change standby-timeout-ac $standbyTimeout
        Powercfg /Change standby-timeout-dc $standbyTimeout
        Powercfg /Change hibernate-timeout-ac $hibernateTimeout
        Powercfg /Change hibernate-timeout-dc $hibernateTimeout
        # Output
        Write-Host "Sleep settings have been set!"
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Turn off notifications
do {
    $input = Read-Host "Do you want to turn off notifications?`n[Yes, disable]Y / [No, enable]N / [Skip]S"
    $correctInput = $false

    # Disable
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications") {
            Set-Itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -name "ToastEnabled" -value 0
        }
        else {
            New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications"
            Set-Itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -name "ToastEnabled" -value 0
        }
        Write-Host "Notifications are now disabled!"
    }

    # Enable
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications") {
            Set-Itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -name "ToastEnabled" -value 1
        }
        else {
            New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications"
            Set-Itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -name "ToastEnabled" -value 1
        }
        Write-Host "Notifications are now enabled!"
    }
    
    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Setting has been left unchanged."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)

Write-Host "Updating Group Policy"
gpupdate /force


##################################################
################# APPLICATIONS ###################
##################################################

# Move to installers locaton
cd "C:\Deploy\TSS Setup Script\Installers"


Write-Host "Select applications to install:"


# Install Chrome
do {
    $input = Read-Host "Do you want to install Google Chrome?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Install
    if ($input -eq "Y") {
        $correctInput = $true
        .\ChromeInstaller.exe /silent /install
        Write-Host "Chrome is now installed with default setting set!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of Google Chrome of has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install Firefox
do {
    $input = Read-Host "Do you want to install Firefox?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Install
    if ($input -eq "Y") {
        $correctInput = $true
        .\FirefoxInstaller.exe -ms
        Write-Host "Firefox is now installed!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of Firefox of has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Disable Internet Explorer
do {
    $input = Read-Host "Do you want to disable Internet Explorer?`n[Yes, disable]Y / [No, enable]N / [Skip]S"
    $correctInput = $false

    # Disabled
    if ($input -eq "Y") {
        $correctInput = $true
        Disable-windowsoptionalfeature -online -featureName Internet-Explorer-Optional-amd64
        Write-Host "Internet explorer has been disabled!"
    }

    # Enabled
    if ($input -eq "N") {
        $correctInput = $true
        Enable-windowsoptionalfeature -online -featureName Internet-Explorer-Optional-amd64
        Write-Host "Internet explorer has been enabled!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Internet explorer has not been changed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install Zoom
do {
    $input = Read-Host "Do you want to install Zoom?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Install
    if ($input -eq "Y") {
        $correctInput = $true
        MsiExec.exe /i ZoomInstaller.msi /qn
        Write-Host "Zoom has been installed!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of Zoom of has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install MS Office
do {
    $input = Read-Host "Do you want to install Microsoft Office 2019? (Install dialog will show)`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Install
    if ($input -eq "Y") {
        $correctInput = $true
        cd "C:\Deploy\TSS Setup Script\Installers\Microsoft Office 2019"
        .\setup.exe /configure SPCOffice2019-64bit.xml
        cd "C:\Deploy\TSS Setup Script\Installers"
        Write-Host "Microsoft Office 2019 has started installing!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of Microsoft Office of has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install VLC
do {
    $input = Read-Host "Do you want to install VLC?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Install
    if ($input -eq "Y") {
        $correctInput = $true
        .\VLCInstaller.exe /L=1033 /S
        Write-Host "VLC has been installed!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of VLC of has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install Notepad++
do {
    $input = Read-Host "Do you want to install Notepad++?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Install
    if ($input -eq "Y") {
        $correctInput = $true
        .\NotepadPlusPlusInstaller.exe /S
        Write-Host "Notepad++ has been installed!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of Notepad++ of has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install Java
do {
    $input = Read-Host "Do you want to install Java?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # install
    if ($input -eq "Y") {
        $correctInput = $true
        .\JavaInstaller.exe /s
        Write-Host "Java has been installed!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of Java of has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install Software Center
do {
    $input = Read-Host "Do you want to install Software Center? (May need to be done after connecting to the domain)`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        cd "C:\Deploy\TSS Setup Script\Installers\Software Center"
        .\ccmsetup.exe /noservice SMSSITECODE=SPP
        cd "C:\Deploy\TSS Setup Script\Installers"
        Write-Host "Giving time to install..."
        Start-Sleep 20
        Write-Host "Software Center has been installed!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Installation of Software Center has been skipped."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Disable Media Player first use dialog
do {
    $input = Read-Host "Do you want to disable the Media Player first use dialog?`n[Yes, disable]Y / [No, enable]N / [Skip]S"
    $correctInput = $false

    # Disable
    if ($input -eq "Y") {
        $correctInput = $true
        if (Test-Path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer") {
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer" -name "DisableAutoUpdate" -value 1
        }
        else {
            New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer"
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer" -name "DisableAutoUpdate" -value 1
        }
        Write-Host "Media Player first use dialog has been disabled!"
    }

    # Enable
    if ($input -eq "N") {
        $correctInput = $true
        if (Test-Path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer") {
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer" -name "DisableAutoUpdate" -value 0
        }
        else {
            New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer"
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsMediaPlayer" -name "DisableAutoUpdate" -value 0
        }
        Write-Host "Media Player first use dialog has been enabled!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Media Player first use dialog has not been changed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Disable the Store Application and activate all the store apps
do {
    $input = Read-Host "Do you want to disable the Store Application and activate all the store apps?`n[Yes, enable apps]Y / [No, disable apps]N / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        ###################################################################################################################
        if (Test-Path "HKLM:\Software\Policies\Microsoft\WindowsStore") {
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "RemoveWindowsStore" -value 1
        }
        else {
            New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore"
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "RemoveWindowsStore" -value 1
        }
        ###################################################################################################################
        if (Test-Path "HKLM:\Software\Policies\Microsoft\WindowsStore") {
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "DisableStoreApps" -value 0
        }
        else {
            New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore"
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "DisableStoreApps" -value 0
        }
        Write-Host "Store Application has been disabled and all store apps have been activated!"
    }

    # No
    if ($input -eq "N") {
        $correctInput = $true
        ###################################################################################################################
        if (Test-Path "HKLM:\Software\Policies\Microsoft\WindowsStore") {
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "RemoveWindowsStore" -value 0
        }
        else {
            New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore"
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "RemoveWindowsStore" -value 0
        }
        ###################################################################################################################
        if (Test-Path "HKLM:\Software\Policies\Microsoft\WindowsStore") {
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "DisableStoreApps" -value 0
        }
        else {
            New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore"
            Set-Itemproperty -path "HKLM:\Software\Policies\Microsoft\WindowsStore" -name "DisableStoreApps" -value 0
        }
        Write-Host "Store Application has been enabled and all store apps have been activated!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Settings have not been changed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Set the layout
do {
    $input = Read-Host "Do you want to set the taskbar and start layout?`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        Import-StartLayout -LayoutPath "C:\Deploy\TSS Setup Script\Handler Scripts\LayoutModification.xml" -MountPath "C:\"
        Write-Host "Layout has been set!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Layout has not been changed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


# Install Deep Freeze seed **WARNING** PC WILL AUTO RESTART
do {
    $input = Read-Host "Do you want to install a Deep Freeze seed? **WARNING** PC WILL AUTO RESTART You may want to wait 5 minutes to make sure everything is done installing.`n[Yes]Y / [Skip]S"
    $correctInput = $false

    # Yes
    if ($input -eq "Y") {
        $correctInput = $true
        .\MASTER-Campus-SEED-v853.exe
        Write-Host "Installed the Deep Freeze seed!"
    }

    # Skip
    if ($input -eq "S") {
        $correctInput = $true
        Write-Host "Skipped installing the Deep Freeze seed."
    }

    # Bad input
    if (-not $correctinput) { Write-Host "Please enter a valid option." }
} until ($correctInput)


Write-Host -NoNewLine "Done!`nPlease restart you PC to make sure all changes take effect.`nPress any key to exit"
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")