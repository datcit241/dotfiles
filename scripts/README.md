# Scripts

## Link a Configuration Directory

- On Windows, enter the source directory path (can be relative path) and the destination directory path
- On Linux, enter the full source and destination path

## Using Environment Variable for Common Directories

### On Windows

To access a variable:

```powershell
$ENV:<environment viaralbe name>
```

To list default variables, run:

```powershell
Get-ChildItem Env: | Sort Name
```

Common variables are:

- `userprofile`: home directory path

### On Linux

To access a variable:

```bash
$<environment variable name>
```

Common variables are:

- `HOME`: home directory path
- `PWD`: current directory path
