// require('@rails/ujs').start()
// require('turbolinks').start()

// BEGIN: Import toastr
import toastr from 'toastr';

toastr.options = {
  'closeButton': true,
  'positionClass': 'toast-top-right',
  'preventDuplicates': false,
  'onclick': null,
  'showDuration': '1000',
  'hideDuration': '0',
  'timeOut': '5000',
  'showEasing': 'swing',
  'hideEasing': 'linear',
  'showMethod': 'fadeIn',
  'hideMethod': 'fadeOut'
}
window.toastr = toastr
// END: Import toastr

// BEGIN: Import fontawesome svg
import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { faUserSecret, faUnlock } from '@fortawesome/free-solid-svg-icons'

library.add(faUserSecret, faUnlock)
dom.watch()
// END: Import fontawesome svg

// BEGIN: Import Stylesheets
import 'bootstrap/dist/css/bootstrap.min.css'
import 'toastr/toastr.scss'
import '../assets/stylesheets/authentication.scss'
// END: Import Stylesheets
