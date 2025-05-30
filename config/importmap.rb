# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "toastr" # @2.1.4
pin "toastr/build/toastr.min.css", to: "https://cdn.jsdelivr.net/npm/toastr/build/toastr.min.css"
pin "jquery" # @3.7.1
