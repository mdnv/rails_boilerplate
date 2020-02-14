require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

window.jQuery = $
window.$ = $

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
import {
  faBars, faSignOutAlt, faTachometerAlt, faUser, faCog, faTrash, faLongArrowAltLeft,
  faCheck, faFilter, faTimes, faChevronUp
} from '@fortawesome/free-solid-svg-icons'

library.add(faBars, faSignOutAlt, faTachometerAlt, faUser, faCog, faTrash,
            faLongArrowAltLeft, faCheck, faFilter, faTimes, faChevronUp)
dom.watch()
// END: Import fontawesome svg

// BEGIN: Import Inspinia Stylesheets
import 'bootstrap/dist/css/bootstrap.min.css'
import 'toastr/toastr.scss'
import '../assets/stylesheets/staff.scss'
// END: Import Inspinia Stylesheets

// BEGIN: Import Inspinia Javascript
require('bootstrap')
require('metismenu')
require('jquery-slimscroll')
import './themes/inspinia.js'
// END: Import Inspinia Javascript

// BEGIN: Import images
require.context('../assets/images', true, /\.(jpg|png)$/i)
// END: Import images

// BEGIN: Addition
require('bootstrap-datepicker')

$(document).on('turbolinks:load', () => {
  $('.datepicker input').datepicker({ format: 'dd-mm-yyyy' })
})
// END: Addition
