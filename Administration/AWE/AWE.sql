On the Start menu, click Run. In the Open box, type gpedit.msc. 

The Group Policy dialog box opens. 

On the Group Policy console, expand Computer Configuration, and then expand Windows Settings.

Expand Security Settings, and then expand Local Policies.

Select the User Rights Assignment folder. 

The policies will be displayed in the details pane. 

In the pane, double-click Lock pages in memory.

In the Local Security Policy Setting dialog box, click Add.

In the Select Users or Groups dialog box, add an account with privileges to run sqlservr.exe.

--------------------------------------------------------------------------------------------


 sp_configure 'show advanced options', 1
RECONFIGURE
GO
sp_configure 'awe enabled', 1
RECONFIGURE
GO
sp_configure 'max server memory', 6144
RECONFIGURE
GO
		