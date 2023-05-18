# NIM-Framework-Baseline

# Purpose
The purpose of this repository to build a framework that can be used as a jump off point to build a lifecycle automation in NIM. This will also contain other useful tools to help you enhance you experience with NIM.

# Installation
- Copy files to root of installed drive
- Configure AD System
	- See [Baseline Config](https://github.com/Tools4ever-NIM/NIM-System-PowerShell-Microsoft-Active-Directory/blob/main/Config.Baseline.json)
- Configure Internal System
	- Check all tables
	- Add Internal Mamberships Relations<br/>
		![image](https://user-images.githubusercontent.com/24281600/234962252-3b746272-2c8b-47b8-9cc7-b2325e7d64ac.png)
- Setup Override Flags app
    - Implement Override Flags lookup table [see here](https://github.com/Tools4ever-NIM/NIM-App-NIM-OverrideFlags/blob/main/README.md)
- Setup Config Locations app
    - Create "ConfigLocation" lookup table by importing /Tools4ever/data/apps/ConfigLocation/LookupTable_ConfigLocation.csv
	- Configure Internal System > Add "ConfigLocation" Table
- Configure Relations
	- internal.users.ExternalID > AD.Users.objectGUID
	- internal.OverrideFlags.ID > AD.Users.employeeID
- Configure LDAP Server



# Features 

## Apps
- AD Group Management v1.1
- AD User Correlation
- AD User Create v1.1
- AD User Duplicates v1.1
- Audit App v1.0
- Config Locations
- Dashboard
- NIM User Management v1.1
- T4E Template
- Override Flags v1.1

## Filters
- AD Group Management v1.0
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
		

# Framework Documentation
- [Recommended Naming Conventions](Tools4ever/docs/NamingConventions.md)

# Product Documentation
The official NIM documentation can be found at: https://docs.nimsuite.com
