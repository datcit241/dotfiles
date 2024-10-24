# DotFiles

This repository contains my dotfiles and scripts to manage them.

I created this repository to keep track of my configuration files and to easily set up my development environment on new machines.

## Usage

To use the configuration make a symbolic link to the desired file or directory. Or use the provided scripts to automatically link all the files and directories on both Unix-like and Windows systems.

**Features:**

- Creates symbolic links to the configuration files using a JSON file to specify the source and destination paths
- Supports for both Unix-like and Windows systems
- Supports for relative source paths in the JSON file
- Supports for environment variables in the destination paths

The scripts will read a JSON file with the source paths and destination paths to create symbolic links. The JSON file should have the following structure:

```json
{
  "unix": [
    ["unix_source1", "unix_destination1"],
    ["unix_source2", "unix_destination2"]
  ],
  "win": [
    ["win_source1", "win_destination1"],
    ["win_source2", "win_destination2"]
  ]
}
```

- `unix` contains the list of files and directories to link in Unix-like systems
- `win` contains the list of files and directories to link in Windows systems.
- The list should contain pairs of source and destination paths.

E.g.:

```json
{
  "unix": [
    [".ideavimrc", "~/.ideavimrc"],
    [".tmux.conf", "~/.tmux.conf"],
    ["./.config/wezterm", "~/.config/.wezterm"]
  ],
  "win": [
    [".ideavimrc", "%USERPROFILE%\\.ideavimrc"]
    [".\\.config\\wezterm", "%USERPROFILE%\\.config\\.wezterm"]
  ]
}
```

### Shell Script

The script is `link.sh`

Dependency:

- `jq`

Make sure to give execute permissions to the script before running it:

```sh
chmod +x link.sh
```

Run the script with the path to the directory or JSON file as an argument:

```sh
./link.sh path/to/directory_or_sources.json
```

### Windows PowerShell Script

The script is `link.ps1`

Run the script with the path to the directory or JSON file as an argument:

```sh
.\link.ps1 path\to\directory_or_sources.json
```
