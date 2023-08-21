import { defineConfig } from 'vite'
import UnoCSS from 'unocss/vite'
import laravel from 'laravel-vite-plugin'

export default defineConfig({
    resolve: {
        alias: {
            '@css': 'resources/css',
            '@js': 'resources/js',
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
