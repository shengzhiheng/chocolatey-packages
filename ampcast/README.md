<img src="icon.png" alt="drawing" width="128"/>

# chocolatey-ampcast

Ampcast music player.

## Installing

### [chocolatey.org][1]

[![](https://img.shields.io/chocolatey/v/ampcast)][1]
[![](https://img.shields.io/chocolatey/dt/ampcast)][1]
[![](https://img.shields.io/github/actions/workflow/status/shengzhiheng/chocolatey-packages/chocolatey-test.yml?branch=main&query=matrix.package:ampcast)][2]

```powershell
choco install ampcast
```

## Developing & Building

```powershell
> git clone https://github.com/shengzhiheng/chocolatey-packages.git
> cd chocolatey-packages/ampcast/
ampcast> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Allow execution of powershell script
ampcast> .\build.ps1
```

This will create the following artifacts:

- `.\ampcast.{version}.nupkg`

To push to chocolatey community package list, run:
```powershell
ampcast> choco apikey add -k <your key here> -s https://push.chocolatey.org/
ampcast> choco push --source https://push.chocolatey.org/
```

[1]: https://chocolatey.org/packages/ampcast
[2]: https://github.com/shengzhiheng/chocolatey-packages/actions/workflows/chocolatey-test.yml
