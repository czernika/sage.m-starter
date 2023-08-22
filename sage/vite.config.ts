import { defineConfig } from 'vite'
import UnoCSS from 'unocss/vite'
import laravel from 'laravel-vite-plugin'
import { resolve } from 'path'

export default defineConfig({
    resolve: {
        alias: {
            '@css': resolve(__dirname, 'resources/css'),
            '@js': resolve(__dirname, 'resources/js'),
        },
    },
    plugins: [
        UnoCSS(),
        laravel({
            input: 'resources/js/app.ts',
            refresh: [
                'resources/views/**/*.blade.php',
                'app/View/**/*.php',
            ],
        }),
    ],
})
