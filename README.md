# limitCPUMacProcessDaemon
Initial Release: 

Installation Instructions:

- Download and unzip cputhrottle from http://www.willnolan.com/cputhrottle/cputhrottle.html (Alternatively you can use MacPorts or Brew for the package)
- Download the shell script from this repository:  limitCPUOSXDaemons.sh 
- I have used CarboniteDaemon as the process name since its become a resource hog on OSX El Capitan running constantly at 100% but you can extend it to any process you are having problems with. 
- I have also hardwired the max cpu limit to 25% and attach the pid and limit to cputhrottle process. The script is run constantly as a background process 
- My crontab entry looks something like this: @reboot /Users/user1/limitCPUOSXDaemons.sh &
- Note you may have to update user's SUDO privileges to NOPASSWD (ALL) to execute without error via cron. 

In the pipeline:
- Add power management options (limit dynamically) for Macbook Pro when running on battery vs ac power. 
