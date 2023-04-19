**Purpose/Overview**

Standardize the naming scheme in NIM implementations for ease of support.

**Configuration**

**Systems**

- \<Vendor\>
  - Google
- \<Product\>
  - Workspace
- \<Vendor\>\<Product\>
  - Google Workspace

**Filter**

- \<Type\>\_\<System\>\_\<Resource\>\_\<Verb\>
  - Employee\_Google\_Users\_Create
- \<Type\>\_\<System\>\_\<Resource\>\_\<Verb\>\_P\_\<Parameter\>
  - Employee\_Google\_Users\_Update\_P\_Dept

**Name Generation**

\<Comment\> is optional

- ng\<Type\>
  - ngEmployee
- ng\<Type\>\_\<Comment\>
  - ngEmployee\_NewFormat

**Password Generation**

\<Comment\> is optional

- \<Type\>
  - Employee
- \<Type\>\_\<Comment\>
  - Employee\_v2

**Mapping**

- \<Type\>\_\<System\>\_\<Resource\>\_\<Verb\>
  - Employee\_Google\_Users\_Create

**Jobs**

- \<Type\>\_\<System\>
  - Employee\_Google

**Types**

Here are the suggested types

- Employee
- Student
- Parent
- Substitute
- Contractor

**Systems**

System names should try to stick to \<Vendor\>\<Product\> sometimes \<Vendor\> or \<Product\> are not necessary though.

- Google Workspace = Google
- Microsoft Azure AD = AzureAD

There are cases were abbreviations make sense

- Active Directory = AD
- File System (Home Dir Folder) = FS

 In cases where source systems need to be split for scheduling purposes

- Skyward Qmlativ (Employees) – SkywardQmlativEmployee
- Skyward Qmlativ (Students) – SkywardQmlativStudent

**Verbs**

- View
- Create
- Update
- Delete
- Enable
- Disable
- NameChange
- GradeChange

**Resource**

Here are some examples of resources

- User
- Group
- \<Google Extension Name\>
  - ExternalId
  - Organizations
  - Phone
- Membership
- Password

**Parameter**

Parameters are mainly used when you need filters with parameters for Role assignment. Examples below

- Grade
- Location
- GradeLocation

**Jobs**

Jobs are useful to group crud tasks together. Here is some recommendations for configuration. It's always suggested to do conditional updates before a regular update. (e.g. Grade Change before Update)

Sample AD Configuration

1. Create
2. Enable
3. GradeChange
4. NameChange
5. Update
6. Disable
7. Sync Group Memberships