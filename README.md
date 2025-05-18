# NT230-project
- POC of Discord DLL hijack and detection
## Preparation
- Prepare 2 vm in vmware: windows 11 vm and kali linuux
## Installation
1. Install Discord from this link: https://dw.uptodown.net/dwn/RvVkii134Riphftvun7hQBZyU0aCwJjJMFI3FD3XyiQFGOnjDTIZeKdo3uXocHd_Ar0F9QFhFnJrMQt602dj8Z6MrppTqdDyrQRSKV55WVltymnFJUruPhkDPEjAVSca/n-R_0xqIylR6BcbZBZF-kL8_1Wm3b9b1BAtj9v_XfsDi4UKVXMDYOSAIz_4DU76nhF6GrLGNYeqaL2b-9gHYvYvgKBP7EdkmS88q8Xxi1iPVTs-ZGxiENE2jSs0Gfns6/QjJc5soT7xgRQ4tn3NQjwly1e5pfu8ErWK8cfalWwAG3UiYBMliLM4UdBhS6R6ZGufew_i4kLRHVDZwPPg-_2g==/discord-1-0-9006.exe
2. Craft malware
- Install CVE-2023-38831-winrar-exploit from this link (https://github.com/b1tg/CVE-2023-38831-winrar-exploit)
- cd inside the cve-2023-38831-winrar-exploit folder, download the script.bat file from this github.
- Then create malware with this command: python cve-2023-38831-exp-gen.py CLASSIFIED_DOCUMENTS.pdf script.bat  result.rar. Please change pdf's name and result.rar's name.
- Then on victim machine, transfer this result.rar file into it. Make sure the victim machine has wirar version <= 6.22. You can download wirnar version 6.21 from this link (https://fc.getpedia.net/data/?q===AN5IzM1YTNzITM1czNygDOzYDfwUjM1wXZ4VmLxIjNtQjN41ichJnbpd3LxAzLzAzLzIDMy8SZslmZvEGdhR2L&e=o)
- after wirnar 6.21 is setup, use it to open result.rar file and run the pdf file, the script.bat will run.

3. Dectection
- Install velociraptor from windows
- install dll_hijack_detect_x64.exe from this link (https://github.com/adamkramer/dll_hijack_detect/releases)
- also install msvcr120.dll from this link (http://www.microsoft.com/en-gb/download/details.aspx?id=40784)
- Install ffmpeg.dll and put it in C:\Windows\System32
