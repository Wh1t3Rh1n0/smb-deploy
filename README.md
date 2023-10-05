# smb-deploy

***Batch files to easily test and log write access to SMB shared folders.***

---

These scripts are really handy for things like:
- Verifying write access to a list of many SMB shared folders all at once.
- Deploying payloads (such as LNK files) to a list of SMB shared folders on the network.


## `deploy.bat` Usage

```
Usage: deploy.bat <List of SMB shares> <File to Upload FROM THE CURRENT FOLDER>

Example: deploy.bat smb-shares.txt my-file.lnk

Output is logged to '.\output'.
```

- Logs successful writes/uploads to `output\successful_uploads.txt`
- Logs paths of writable folders to `output\writable_folders.txt`


## `undeploy.bat` Usage

```
Usage: undeploy.bat <List of deployed files>

Example: undeploy.bat output\successful_uploads.txt

Output is logged to '.\output'.
```

- Hint: `output\successful_uploads.txt` is probably the list of files you want to target with this script. 😉
- Logs successful removals to `output\undeploy_log.txt`
- Logs unsuccessful removals to `output\unable_to_delete.txt`