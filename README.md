# NIM-Framework-Baseline

# Purpose
The purpose of this repository to build a framework that can be used as a jump off point to build a lifecycle automation in NIM. This will also contain other useful tools to help you enhance you experience with NIM.

# Automated Installation
- Two options available for install
    - Automated (Preferred) - Install Latest Framework (Run as Admin in Powershell)
        
        `
            iex (iwr https://raw.githubusercontent.com/Tools4ever-NIM/NIM-Framework-Baseline/main/Tools4ever/scripts/Install_Framework.ps1 -UseBasicParsing).Content
        `

    - Manual - Download zip and extract. Run scripts\Install_Framework.ps1

- Settings > License > Add License
- Settings > Backup & Restore > Import Backup JSON
- Restore Backup
- Update AD and Google Configuration
- Configure LDAP Server

# Features 

## Apps
- AD Group Management
- AD User Correlation
- AD User Create
- AD User Duplicates
- Audit App
- Config Locations
- Dashboard
- Google User Correlation
- Google User Duplicates
- NIM User Management
- Onboarding
- Override Flags
- Password Reset
- Temporary Elevated Access Management (TEAM)

## Automations
- AD to NIM Sync

## Helper Resources
- Role Model Scoping Filters
- AD Session Filter
- Sample Email Templates
- Standard Scheduler Tasks
- Global Variables (including [NIM Helper Function Library](https://github.com/Tools4ever-NIM/NIM-LIB-HelperFunctions) )
- Custom Schemas
    - ```Google``` = Google Workspace
    - ```MembersAPI``` = South Dakota Members API
    - ```OneRosterInfiniteCampus``` = Infinite Campus OneRoster v1.2 

    
## Scripts Included
- Install Framework
    - Install_Framework.ps1
- Proxy Settings
    - Delete_NIM_Proxy_Settings.reg
	    - Remove all registry settings that allow proxy
	- Set_NIM_Proxy_Settings.reg
	    - Preconfigures ability to use Fiddler proxy with NIM. Certificate is expected to be placed in "C:\\Tools4ever\certs\FiddlerRoot.cer"
- Memory
    - Set_NIM_Memory_16gb.reg
	    - Set NIM Service memory usage to 16gb maximum
- Windows Defender
    - Set_Windows_Defender_Exclusions.ps1
	    - Configure the Windows Defender exclusions for the NIM Service.
- AD Tools
    - Install_AD_Tools.ps1
        - Install Active Directory Tools



# Product Documentation
The official NIM documentation can be found at: https://docs.nimsuite.com
