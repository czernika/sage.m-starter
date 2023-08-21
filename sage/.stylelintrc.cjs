/* eslint-env node */

module.exports = {
    extends: [
        'stylelint-config-standard',
    ],
    rules: {
        'import-notation': 'string',
        'at-rule-empty-line-before': ['always', {
            ignoreAtRules: ['import', 'apply'],
        }],
    },
}
