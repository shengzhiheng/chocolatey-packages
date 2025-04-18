<img src="icon.png" alt="drawing" width="128"/>

# chocolatey-quantum

Automatic qBittorrent port updater for ProtonVPN.

## Installing

### [chocolatey.org][1]

[![](https://img.shields.io/chocolatey/v/quantum.svg)][1]

```powershell
choco install quantum
```

## Developing & Building

```powershell
> git clone https://github.com/shengzhiheng/chocolatey-packages.git
> cd chocolatey-packages/quantum/
quantum> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Allow execution of powershell script
quantum> .\build.ps1
```

This will create the following artifacts:

- `.\quantum.{version}.nupkg`

To push to chocolatey community package list, run:
```powershell
quantum> choco apikey add -k <your key here> -s https://push.chocolatey.org/
quantum> choco push --source https://push.chocolatey.org/
```

[1]: https://chocolatey.org/packages/quantum