<img src="icon.png" alt="drawing" width="128"/>

# chocolatey-potplayer

> PotPlayer is a multimedia software player developed for the Microsoft Windows operating system by South Korean Internet company Kakao.

## Installing

### [chocolatey.org][1]

[![](https://img.shields.io/chocolatey/v/potplayer)][1]
[![](https://img.shields.io/chocolatey/dt/potplayer)][1]
[![](https://img.shields.io/github/actions/workflow/status/shengzhiheng/chocolatey-packages/chocolatey-test.yml?branch=main&query=matrix.package:potplayer)][2]

```powershell
choco install potplayer
```

## Developing & Building

```powershell
> git clone https://github.com/shengzhiheng/chocolatey-packages.git
> cd chocolatey-packages/potplayer/
potplayer> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Allow execution of powershell script
potplayer> .\build.ps1
```

This will create the following artifacts:

- `.\potplayer.{version}.nupkg`

[1]: https://chocolatey.org/packages/potplayer
[2]: https://github.com/shengzhiheng/chocolatey-packages/actions/workflows/chocolatey-test.yml