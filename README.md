# NIM-Framework-Baseline

# Purpose
The purpose of this repository to build a framework that can be used as a jump off point to build a lifecycle automation in NIM. This will also contain other useful tools to help you enhance you experience with NIM.

# Installation
- Install Latest Framework


	`
		iex (iwr https://raw.githubusercontent.com/Tools4ever-NIM/NIM-Framework-Baseline/main/Tools4ever/scripts/Install_Framework.ps1 -UseBasicParsing).Content
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
- Onboarding
- Override Flags
- T4E Template


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
    - ad_nim_users_delete
- Audit App
    - app_auditapp_persons  
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
- Role Model Scoping
    - rolemodel_scope_ad_exclude
    - rolemodel_scope_ad_include
    - rolemodel_scope_google_exclude
    - rolemodel_scope_google_include
    - rolemodel_scope_nim_exclude
- Session
    - session_ad_user_view 

## Name Generation
- AD User Create
    - app_adusercreate

## Password Generation
- Random Complex
- Random Simple

## Mappings
- AD NIM Sync
    - ad_nim_user_create
    - ad_nim_user_update
    - ad_nim_user_disable
    - ad_nim_user_delete

## Roles
- Active
    - NIM_Admins

## Jobs
- AD NIM Sync
    - ad_nim_user_sync

## Audit Queries
- AD User Duplicates
    - aduserduplicates_duplicateusersbyid
- Audit App
    - auditapp_attributes_recentchanges
    - auditapp_attributes_search
    - auditapp_log_search
    - auditapp_memberships_recentchanges
    - auditapp_memberships_search
- Google User Duplicates
    - googleuserduplicates_duplicatesusersbyid 

## Notification Templates
- AD User Password Expiry
    - ad_user_passwordexpiry
- Sync AD NIM
    - sync_ad_nim 

## Scheduler
- AD NIM Sync
    - Syncs Domain Admins from AD to NIM Internal Users
- AD User Password Expiry
    - Notifies user by email when password is expiring in 15, 7, 3, 2, 1 day(s)
- Import Data
    - Imports AD and Google
- Retention
    - Cleans up logging data

## Global Variables
- Global_AD_DeletePrefixAttribute
    - Attribute used to tag delete dates for AD
- Global_DeleteAfterDays
    - Number of days in future to mark as delete
- Global_AD_DeletePrefixValue
    - Value given before delete date for AD
- T4ELib
    - [NIM Helper Function Library](https://github.com/Tools4ever-NIM/NIM-LIB-HelperFunctions)
    
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
