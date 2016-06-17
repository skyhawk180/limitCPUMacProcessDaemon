# limitCPUMacProcessDaemon
Initial Release: 

Installation Instructions:

- Download and unzip cputhrottle from http://www.willnolan.com/cputhrottle/cputhrottle.html (Alternatively you can use MacPorts or Brew for the package)
- Download the simple shell script from this repository:  limitCPUOSXDaemons.sh 
- Usage: limitCPUOSXDaemons.sh ProcessName Limit%
- I have used CarboniteDaemon as the process name since its become a resource hog on OSX El Capitan running constantly at 100% but you can extend it to any process you are having problems with. 
- The max cpu limit can be assigned as CLI parameter. I chose 25% for Carbonite as a reasonable CPU utilization and The script is run constantly as a background process.
- My crontab entry looks something like this: @reboot /Users/user1/limitCPUOSXDaemons.sh CarboniteDaemon 25 &
- Note you may have to update user's SUDO privileges to NOPASSWD (ALL) for this script to execute without error via cron.

In the pipeline:
- Add power management /auto throttling options (limit dynamically) for Macbook Pro when running on battery vs ac power. 
