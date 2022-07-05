/* Fix Plotly.js loading */
requirejs.config({
    paths: {
        base: '/static/base',
        plotly: 'https://cdn.plot.ly/plotly-2.12.1.min.js?noext',
    },
});

// Plotly complains about this when loading interactive notebooks.
// Probably version conflict.
// We do not use MathJax, so we just disable it.
delete window.MathJax;