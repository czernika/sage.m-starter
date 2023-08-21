/* eslint-env node */

module.exports = {
    root: true,
    env: {
        browser: true,
    },
    plugins: [
        '@typescript-eslint',
    ],
    parserOptions: {
        parser: '@typescript-eslint/parser',
        sourceType: 'module',
        ecmaVersion: 2020,
    },
    extends: [
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended',
    ],
    rules: {
        'no-console': 'warn',
        'no-alert': 'error',
        'semi': ['warn', 'never'],
        'quotes': ['warn', 'single', { 'avoidEscape': true }],
        'comma-dangle': ['warn', {
            arrays: 'always-multiline',
            objects: 'always-multiline',
            imports: 'always-multiline',
            exports: 'always-multiline',
            functions: 'never',
        }],
        '@typescript-eslint/no-inferrable-types': 'warn',
    },
}
