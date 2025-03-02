// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails'
import 'controllers/index'
import { clearFormerror, submitIfOk } from 'utils/formutils';
import { squashImageFile } from "utils/image_utils";
import { resendParentVerificationEMail } from "utils/apis";
import 'htmx.org'

window.clearFormerror = clearFormerror
window.squashImageFile = squashImageFile
window.resendParentVerificationEMail = resendParentVerificationEMail
window.submitIfOk = submitIfOk
