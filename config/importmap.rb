# Pin npm packages by running ./bin/importmap

pin "application"
# todo: look into this
pin "controllers/index", to: "controllers/index.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/utils", under: "utils"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@toast-ui/editor", to: "@toast-ui--editor.js" # @3.2.2
pin "orderedmap" # @2.1.1
pin "prosemirror-commands" # @1.6.2
pin "prosemirror-history" # @1.4.1
pin "prosemirror-inputrules" # @1.4.0
pin "prosemirror-keymap" # @1.2.2
pin "prosemirror-model" # @1.24.1
pin "prosemirror-state" # @1.4.3
pin "prosemirror-transform" # @1.10.2
pin "prosemirror-view" # @1.37.1
pin "rope-sequence" # @1.3.4
pin "w3c-keyname" # @2.2.8
pin "sweetalert2" # @11.15.9
pin "htmx.org" # @2.0.1
