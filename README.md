## Automated Scripts for Java Timezone Updater Tool.

These scripts perform automatic update of the Java time zone using the [Timezone Updater Tool] (http://www.oracle.com/technetwork/java/javase/tzupdater-readme-136440.html) provided by Oracle.
Please download the Timezone Updater Tool from the [Oracle Technology Network] (http://www.oracle.com/technetwork/java/javase/downloads/tzupdater-download-513681.html). Unpack and put the **tzupdater.jar** file in the scripts home directory (beside shell scripts).

## Script files

**tzversion.sh** - Version Checker. Checks the current time zone database version under the indicated directory
**tzupdater.sh** - Time Zone Updater. Performs an automatic update of multiple Java instances under the indicated directory
**tzdownloader.sh** - Time Zone Database Archive Downloader. Downloads the time zone database archive into the "tzdata" directory and prepares it to update

### Version Checker (tzversion.sh)
**Usage:**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzversion.sh <dir>`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**\<dir\>** - indicates a directory as a search path for Java instances.

**Examples:**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzversion.sh /u01` – searches for Java under the base directory for Oracle Database and Grid homes  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzversion.sh /usr` – searches for openjdk

### Time Zone Updater (tzupdater.sh)
**Usage:**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzupdater.sh <dir> <p2> -f(optional)`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**\<dir\>** - indicates a directory as a search path for Java instances  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**\<p2\>** - can be an http/https link to the time zone database archive or a filename of recently downloaded and prepared time zone database archive in "tzdata" directory.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**-f** - Is optional and stands for **force** update, in case of downgrading time zone database version

**Examples:**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzupdater.sh /u01 http://www.iana.org/time-zones/repository/releases/tzdata2016f.tar.gz`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzupdater.sh /u01 tzdata2016f.tar.gz -f`

### Time Zone Database Archive Downloader (tzdownloader.sh)
**Usage:**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzdownloader.sh <http link>`

**Examples:**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./tzdownloader.sh http://www.iana.org/time-zones/repository/releases/tzdata2016f.tar.gz`

### Note
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tested with Timezone Updater Tool version 2.0.3-b01
