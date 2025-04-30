<img src="icon.png" alt="drawing" width="128"/>

# chocolatey-notion

> A personal analytics service that shows you how you spend your time and provides tools to help you be more productive.

## Installing

### [chocolatey.org][1]

[![](https://img.shields.io/chocolatey/v/notion)][1]
[![](https://img.shields.io/chocolatey/dt/notion)][1]
[![](https://img.shields.io/github/actions/workflow/status/shengzhiheng/chocolatey-packages/chocolatey-test.yml?branch=main&query=matrix.package:notion)][2]

```powershell
choco install notion
```

## Developing & Building

```powershell
> git clone https://github.com/shengzhiheng/chocolatey-packages.git
> cd chocolatey-packages/notion/
notion> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Allow execution of powershell script
notion> .\build.ps1
```

This will create the following artifacts:

- `.\notion.{version}.nupkg`

[1]: https://chocolatey.org/packages/notion
[2]: https://github.com/shengzhiheng/chocolatey-packages/actions/workflows/chocolatey-test.yml