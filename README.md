# NIM-Framework-Baseline

# Status 
![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) In Development

# Purpose
The purpose of this repository to build a framework that can be used as a jump off point to build a lifecycle automation in NIM. This will also contain other useful tools to help you enhance you experience with NIM.

# Features 

## Apps
- AD Group Management v1.0
- AD User Create v1.0
- Audit App v1.0
- Dashboard
- NIM User Management v1.0
- T4E Template v1.0

## Filters
- AD Group Management v1.0
    - app_adgroupmanagement_listgroups
	- app_adgroupmanagement_members
	- app_adgroupmanagement_members_available
- AD User Create
    - app_adusercreate_listusers.json
- AD NIM Sync
    - ad_nim_users_active
    - ad_nim_users_disable
- NIM User Management
   - app_nimmgmt_listusers
   - app_nimmgmt_memberships
   - app_nmimgmt_membership_available

## Mappings
- AD NIM Sync
    - ad_nim_user_create
    - ad_nim_user_update
    - ad_nim_user_disable

## Jobs
- AD NIM Sync
    - ad_nim_user_sync

## Audit Queries
- Audit App
    - auditapp_creates
    - auditapp_deletes
    - auditapp_last7days
    - auditapp_updates
    
    
## REST Connectors
- Custom Schemas
    - ```Google``` = Google Workspace
    - ```MembersAPI``` = South Dakota Members API
    - ```OneRosterInfiniteCampus``` = Infinite Campus OneRoster v1.2


# Framework Documentation
- [Recommended Naming Conventions](Tools4ever/docs/NamingConventions.MD)

# Product Documentation
The official NIM documentation can be found at: https://docs.nimsuite.com
