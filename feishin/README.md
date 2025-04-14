<img src="icon.png" alt="drawing" width="128"/>

# chocolatey-feishin

A modern self-hosted music player. 

## Installing

### [chocolatey.org][1]

[![](https://img.shields.io/chocolatey/v/feishin.svg)][1]

```powershell
choco install feishin
```

## Developing & Building

```powershell
> git clone https://github.com/shengzhiheng/chocolatey-packages.git
> cd chocolatey-packages/feishin/
feishin> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Allow execution of powershell script
feishin> .\build.ps1
```

This will create the following artifacts:

- `.\feishin.{version}.nupkg`
