# LoadoutManager

A tool for managing loadouts and packing missions for the A2WaspWarfare project.

## Prerequisites

- .NET 8.0 SDK
- 7-Zip Command Line version (7za.exe)

## Environment Setup

Before running the tool, you must set the `7za` environment variable to point to the 7-Zip executable (7za.exe). This is required for packing missions.

### Windows

1. Download 7-Zip Command Line version from [7-Zip website](https://www.7-zip.org/download.html)
2. Extract it to a location of your choice
3. Set the environment variable using PowerShell:

```powershell
$env:7za = "C:\path\to\7za.exe"
```

For permanent setup, you can set it in your system environment variables:
1. Open System Properties (Win+X → System)
2. Click on "Advanced system settings"
3. Click "Environment Variables"
4. Under "User variables", click "New"
5. Variable name: 7za
6. Variable value: Full path to 7za.exe (e.g., C:\Program Files\7-Zip\7za.exe)

## Usage

Run the tool using the dotnet CLI:

```
dotnet run -c <Configuration>
```

Where `<Configuration>` is one of the available build configurations.

## Build Configurations

- **DEBUG**: Developer mode. Not intended for deployment on live servers.
- **SERVER_DEBUG**: Deployable on the server with logging enabled. Use this when monitoring issues on a live server.
- **RELEASE**: Production mode with logging disabled, optimized for runtime performance.
- **AIRWAR_DEBUG**: Debug configuration specific to the Air War module.
- **AIRWAR_SERVER_DEBUG**: Server debug configuration for the Air War module.
- **AIRWAR_RELEASE**: Release configuration for the Air War module.

## Example

```powershell
# Set the 7za environment variable (if not already set)
$env:7za = "C:\Program Files\7-Zip\7za.exe"

# Run with server debug configuration
dotnet run -c SERVER_DEBUG
```

## Notes

- Setting the 7za environment variable is only necessary if you're packing missions. It's not required if you're only copying files to other missions from Chernarus.
- Make sure to use the appropriate configuration based on your deployment target.
