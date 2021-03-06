# dynmotd

### [CHANGELOG](https://github.com/nyokinyoki/dynmotd/blob/master/CHANGELOG.md)

Dynamic MOTD for RHEL/Debian-based Linux distros

This is a forked project [Neutrollized/dynmotd](https://github.com/Neutrollized/dynmotd).

I've added support for Oracle Linux and automatic mountpoint parsing. I might consolidate it back to just one script, to make deployments easier.

## Installation:

You can run the `install.sh` script as root/with sudo or if you prefer manually:

```
 1.   vi /etc/ssh/sshd_config  (this is optional; if you have `PrintMotd yes`, then you'll get the static motd as well as the `dynmotd` output)
      PrintMotd no

 2.   vi /etc/pam.d/login  (if applicable)
      # session optional pam_motd.so

 3.   vi /etc/profile.d/dynmotd.sh (chmod: 644)
      /usr/local/bin/dynmotd

 4.   Then of course drop this file in (chmod 755):
      /usr/local/bin/

 5.   Create an optional folder (default: /etc/dynmotd.d) in which you can place custom scripts for checking additional items (file system, services, ports, etc. -- this is optional)
```


## Sample output:

```
==============================================================================
 -- Hostname...........:  ip-123-45-67-89 (123.45.67.89)
 -- OS version.........:  Ubuntu 18.04.2 LTS
 -- Kernel release.....:  4.15.0-1043-aws
 -- Instance ID........:  i-a1b2c3d4e5f6g7h8i9
 -- Users..............:  Currently 1 user(s) logged on
==============================================================================
 -- Instance type......:  t3.small
 -- CPUs...............:  2 x Intel(R) Xeon(R) Platinum 8175M CPU @ 2.50GHz
 -- Load average.......:  0.08 - 0.02 - 0.01 (1-5-15 min)
 -- Memory.............:  3.8G - 1.4G - 1.4G (total-used-free)
 -- Swap...............:  0B - 0B - 0B (total-used-free)
 -- Processes..........:  104 running - 0 zombies
 -- System uptime......:  3 days 23 hours 17 minutes 40 seconds
===== SERVICES ===============================================================
 -- docker.............:  active (running) since Sat 2019-07-20 02:08:09 UTC
 -- jenkins............:  active (exited) since Sat 2019-07-20 02:08:09 UTC
===== Mounts =================================================================
 -- /..................:  187G - 3% (avail-use%) 
 -- /boot..............:  278M - 39% (avail-use%) 
==============================================================================
```
