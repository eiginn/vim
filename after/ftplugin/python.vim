let g:ale_completion_enabled = 1
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint', 'pyls']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
"let b:ale_warn_about_trailing_whitespace = 0

"let g:ale_python_pyls_config = {
"  \ 'pyls': { 'configurationSources': ['flake8']}
"  \ }
