# Sage.M

Opinion-based starter theme based on [Sage](https://roots.io/sage/). Refer to its documentation

## Features

This theme slightly changes things:

- it is using Vite instead of Bud and UnoCSS instead of TailwindCSS;
- Redis Object cache and Query Monitor plugins were installed by default + Roots/Acorn;
- TypeScript support;
- Predefined to use SMTP mailing;
- Pest testing plugin preinstalled;
- Plus linting (though this is opinion-based).

## Known issues and TODOs

- Roots/soil plugin removes generated links for Vite assets
- Symlinked assets are not shown after being builded

### Workaround for previewing theme

1. Copy theme into some kind of "preview-theme"

```sh
cp -R /app/theme/sage /app/www/web/app/theme/preview-sage
```

2. Switch to a new theme

```sh
wp theme activate preview-sage
```
