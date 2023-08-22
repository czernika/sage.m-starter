# Docker (Devcontainer) setup for Roots Sage theme

Quick workflow setup for [Roots Sage](https://roots.io/sage/) WordPress starter theme in Docker and [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers). The idea behind it is to "Install and enjoy" but it is **heavily opinion-based**

## Features

- Based on [Bedrock](https://roots.io/bedrock/) WordPress structure using [Acorn](https://roots.io/acorn/)
- [Redis object cache plugin](https://wordpress.org/plugins/redis-cache/) installed and working on a first run (no need to install and activate)
- [Query Monitor](https://querymonitor.com/) WordPress development plugin
- SMTP credentials are set to use [Mailpit](https://github.com/axllent/mailpit)
- [Vite](https://vitejs.dev/) frontend tool instead of Bud - PostCSS out of the box, HMR and Livereload for theme files
- By default it is set to use [UnoCSS](https://unocss.dev/) instead of TailwindCSS
- TypeScript configuration
- [Pest](https://pestphp.com/) testing tool installed and ready to use
- Opinion-based linting and sniffing rules

## Installation

Still **TODO**

*For now clone this repository and delete `.git` folder (or use [degit](https://github.com/Rich-Harris/degit))*

## Development Workflow

1. Fill `.env` file

**TODO** Provide table with list of possible settings specific both for Bedrock and `docker-compose.yml` 

2. Run [container](https://code.visualstudio.com/docs/devcontainers/containers)

*Installation and Redis cache setup bash scripts running in devcontainer for now*

3. Open browser at `WP_HOME` environment variable

At this point:

- Site was installed and database created
- Admin user was created
- Locale packages were installed
- Your app using Redis cache and forwards all mails into Mailpit `0.0.0.0:8025`
- Assets are bundled and ready to use
- Theme was switched to use newly created Sage theme

So you should see not installation window but already ready to use default theme opened in your Vscode

## Structure

After installation process this is the app structure

```
.
└── app/
    ├── www/
    │   ├── web/
    │   │   └── app/
    │   │       └── themes/
    │   │           └── sage
    │   └── wp
    └── build/
        └── .devcontainer
        └── docker
        └── sage
```

## Known issues

- When using [Roots/soil](https://github.com/roots/soil) plugin it erases all injected by Vite links with `cleanup` setting enabled

## License

Open-source under [MIT](LICENSE) license
