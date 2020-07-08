# regulatory-domain-fixer
This repository contains scripts to "patch" a regulatory domains data:  
https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/tree/db.txt

The main idea is presented here:  
https://miloserdov.org/?p=337

The repository already contains changed data
(compare source `db.txt.src` file and `db.txt` file).

So, you just need to clone this repo and run:  
`sudo ./apply.sh`

## Step by step
Run:
````
curl -L https://raw.githubusercontent.com/Alexey-Tsarev/regulatory-domain-fixer/master/fix_regulatory_domain.sh | sh
````
or the same manually:
````
curl -L https://github.com/Alexey-Tsarev/regulatory-domain-fixer/archive/master.zip -o regulatory-domain-fixer.zip
unzip regulatory-domain-fixer.zip
cd regulatory-domain-fixer-master
sudo ./apply.sh
cd ..
rm -rf regulatory-domain-fixer.zip regulatory-domain-fixer-master
sudo reboot
````

## Result
Before:
````
iw reg set 00
iw reg get
global
country 00: DFS-UNSET
    (2402 - 2472 @ 40), (N/A, 20), (N/A)
    (2457 - 2482 @ 20), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
    (2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, PASSIVE-SCAN
    (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
    (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, PASSIVE-SCAN
    (5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, PASSIVE-SCAN
    (5735 - 5835 @ 80), (N/A, 20), (N/A), PASSIVE-SCAN
    (57240 - 63720 @ 2160), (N/A, 0), (N/A)
````

After `./apply.sh && reboot`:
````
iw reg set 00
iw reg get
global
country 00: DFS-UNSET
    (2400 - 2484 @ 40), (N/A, 30), (N/A)
    (5150 - 5875 @ 160), (N/A, 30), (N/A)
    (57000 - 66000 @ 2160), (N/A, 40), (N/A)
````

Or, to make your own changes:
- clone this repository
- get source files `get_source.sh`
- edit `wireless-regdb/db.txt` file  
  (see for example: `diff db.txt db.txt.src`)
- run `make.sh`
- apply changes `sudo apply.sh` or  
  `sudo ./apply.sh PATCHED_LANG PATCHED_USER`

PS: This scripts were tested on:
- Orange Pi Zero (Armbian)
- Comfast EW72 (OpenWrt)
- Xiaomi Mi Router 3G (OpenWrt)
- Raspberry Pi 4 (Raspbian)

---
Good luck!  
Alexey Tsarev, Tsarev.Alexey at gmail.com
