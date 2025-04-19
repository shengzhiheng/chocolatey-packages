<img src="icon.png" alt="drawing" width="128"/>

# chocolatey-audioling

Audio player with a focus on self-hosted music server support. 

## Installing

### [chocolatey.org][1]

[![](https://img.shields.io/chocolatey/v/audioling)][1]
[![](https://img.shields.io/chocolatey/dt/audioling)][1]
[![](https://img.shields.io/github/actions/workflow/status/shengzhiheng/chocolatey-packages/chocolatey-test.yml?branch=main&query=matrix.package:audioling)][2]

```powershell
choco install audioling
```

## Developing & Building

```powershell
> git clone https://github.com/shengzhiheng/chocolatey-packages.git
> cd chocolatey-packages/audioling/
audioling> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Allow execution of powershell script
audioling> .\build.ps1
```

This will create the following artifacts:

- `.\audioling.{version}.nupkg`

To push to chocolatey community package list, run:
```powershell
audioling> choco apikey add -k <your key here> -s https://push.chocolatey.org/
audioling> choco push --source https://push.chocolatey.org/
```

[1]: https://chocolatey.org/packages/audioling
[2]: https://github.com/shengzhiheng/chocolatey-packages/actions/workflows/chocolatey-test.yml