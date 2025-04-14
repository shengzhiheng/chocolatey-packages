<img src="icon.jpg" alt="drawing" width="128"/>

# chocolatey-rescuetime

> A personal analytics service that shows you how you spend your time and provides tools to help you be more productive.

## Installing

### [chocolatey.org][1]

[![](https://img.shields.io/appveyor/ci/dittodhole/chocolatey-rescuetime/master.svg)][2]
[![](https://img.shields.io/chocolatey/v/rescuetime.svg)][1]

```powershell
choco install rescuetime
```

## Developing & Building

```powershell
> git clone https://github.com/shengzhiheng/chocolatey-packages.git
> cd chocolatey-packages/rescuetime/
rescuetime> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Allow execution of powershell script
rescuetime> .\build.ps1
```

This will create the following artifacts:

- `.\rescuetime.{version}.nupkg`

## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars1.githubusercontent.com/u/7301634?v=4" width="100px;"/><br /><sub><b>Vyacheslav Karbovnichy</b></sub>](https://github.com/v-karbovnichy)<br />[📦](#platform-v-karbovnichy "Packaging/porting to new platform") | [<img src="https://avatars1.githubusercontent.com/u/46317?v=4" width="100px;"/><br /><sub><b>cori schlegel</b></sub>](http://kinrowan.net)<br />[📦](#platform-cori "Packaging/porting to new platform") | [<img src="https://avatars3.githubusercontent.com/u/307719?v=4" width="100px;"/><br /><sub><b>Andy Doyle</b></sub>](https://andydoyle.org)<br />[🐛](https://github.com/dittodhole/chocolatey-rescuetime/issues?q=author%3AAndyMDoyle "Bug reports") |
| :---: | :---: | :---: |
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!

## License

chocolatey-rescuetime is published under [WTFNMFPLv3](https://github.com/dittodhole/WTFNMFPLv3).

[1]: https://chocolatey.org/packages/rescuetime
[2]: https://ci.appveyor.com/project/dittodhole/chocolatey-rescuetime/branch/master