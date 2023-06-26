# NIM-Framework-Baseline

# Purpose
The purpose of this repository to build a framework that can be used as a jump off point to build a lifecycle automation in NIM. This will also contain other useful tools to help you enhance you experience with NIM.

# Installation
- Install Latest Framework


`
	iex (iwr https://raw.githubusercontent.com/Tools4ever-NIM/NIM-Framework-Baseline/main/Tools4ever/scripts/Install_Framework.ps1).Content
`

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
- T4E Template
- Override Flags

## Filters
- AD Group Management
    - app_adgroupmanagement_listgroups
	- app_adgroupmanagement_members
	- app_adgroupmanagement_members_available
- AD User Correlation
    - app_adusercorrelation_listusers
- AD User Create
    - app_adusercreate_listusers.json
- AD User Duplicates
    - app_aduserduplicates_list_users
- AD User Password Expiry
    - app_report_users_passwordexpiry
- AD NIM Sync
    - ad_nim_users_active
    - ad_nim_users_disable
- Google User Correlation
    - apps_googleusercorrelation_listusers
- Google User Duplicates
    - apps_googleusersduplicates_listusers
- NIM User Management
    - app_nimmgmt_listusers
    - app_nimmgmt_memberships
    - app_nimmgmt_membership_available
- Override Flags
	- app_override_users
	- app_override_users_available

## Name Generation
- AD User Create
    - app_adusercreate

## Mappings
- AD NIM Sync
    - ad_nim_user_create
    - ad_nim_user_update
    - ad_nim_user_disable

## Jobs
- AD NIM Sync
    - ad_nim_user_sync

## Audit Queries
- AD User Duplicates
    - aduserduplicates_duplicateusersbyid
- Audit App
    - auditapp_creates
    - auditapp_deletes
    - auditapp_last7days
    - auditapp_updates
- Google User Duplicates
    - googleuserduplicates_duplicatesusersbyid 

## Notification Templates
- AD User Password Expiry
	- ad_user_passwordexpiry

## Scheduler
- AD NIM Sync
	- Syncs Domain Admins from AD to NIM Internal Users
- AD User Password Expiry
	- Notifies user by email when password is expiring in 15, 7, 3, 2, 1 day(s)
- Retention
	- Cleans up logging data
    
## REST Connectors
- Custom Schemas
    - ```Google``` = Google Workspace
    - ```MembersAPI``` = South Dakota Members API
    - ```OneRosterInfiniteCampus``` = Infinite Campus OneRoster v1.2

# Scripts Included
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
- Backup NIM Service
    - Backup_NIM_Service.ps1
        - Back up Program Files and Program Data for NIM
- Upgrade NIM
	- Upgrade_NIM.ps1
 		- Backup and upgrade NIM
		

# Framework Documentation
- [Recommended Naming Conventions](Tools4ever/docs/NamingConventions.md)

# Product Documentation
The official NIM documentation can be found at: https://docs.nimsuite.com
