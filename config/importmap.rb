# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "controllers/index", to: "controllers/index.js"

pin "@toast-ui/editor", to: "@toast-ui--editor.js" # @3.2.2
pin "sweetalert2" # @11.12.0
pin "htmx.org" # @1.9.12
