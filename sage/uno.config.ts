import {
    defineConfig,
    presetWind,
} from 'unocss'

import transformerDirectives from '@unocss/transformer-directives'

export default defineConfig({
    content: {
        filesystem: [
            'resources/views/**/*.blade.php',
            'resources/js/**/*.ts',
            'app/View/**/*.php',
        ],
    },
    theme: {},
    transformers: [
        transformerDirectives(),
    ],
    presets: [
        presetWind(),
    ],
})
