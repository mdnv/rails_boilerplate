var SmoothlyMenu, WinMove, animationHover, localStorageSupport

localStorageSupport = function() {
  return 'localStorage' in window && window['localStorage'] !== null
}

animationHover = function(element, animation) {
  element = $(element)
  return element.hover((function() {
    return element.addClass('animated ' + animation)
  }), function() {
    return window.setTimeout((function() {
      return element.removeClass('animated ' + animation)
    }), 2000)
  })
}

SmoothlyMenu = function() {
  if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
    $('#side-menu').hide()
    return setTimeout((function() {
      return $('#side-menu').fadeIn(400)
    }), 200)
  } else if ($('body').hasClass('fixed-sidebar')) {
    $('#side-menu').hide()
    return setTimeout((function() {
      return $('#side-menu').fadeIn(400)
    }), 100)
  } else {
    return $('#side-menu').removeAttr('style')
  }
}

WinMove = function() {
  var connect, element, handle
  element = '[class*=col]'
  handle = '.ibox-title'
  connect = '[class*=col]'
  return $(element).sortable({
    handle: handle,
    connectWith: connect,
    tolerance: 'pointer',
    forcePlaceholderSize: true,
    opacity: 0.8
  }).disableSelection()
}

$(document).on('turbolinks:load', function() {
  var fix_height
  fix_height = function() {
    var heightWithoutNavbar, navbarHeigh, wrapperHeigh
    heightWithoutNavbar = $('body > #wrapper').height() - 61
    $('.sidebar-panel').css('min-height', heightWithoutNavbar + 'px')
    navbarHeigh = $('nav.navbar-default').height()
    wrapperHeigh = $('#page-wrapper').height()
    if (navbarHeigh > wrapperHeigh) {
      $('#page-wrapper').css('min-height', navbarHeigh + 'px')
    }
    if (navbarHeigh < wrapperHeigh) {
      $('#page-wrapper').css('min-height', $(window).height() + 'px')
    }
    if ($('body').hasClass('fixed-nav')) {
      if (navbarHeigh > wrapperHeigh) {
        return $('#page-wrapper').css('min-height', navbarHeigh - 60 + 'px')
      } else {
        return $('#page-wrapper').css('min-height', $(window).height() - 60 + 'px')
      }
    }
  }
  if ($(this).width() < 769) {
    $('body').addClass('body-small')
  } else {
    $('body').removeClass('body-small')
  }
  $('#side-menu').metisMenu()
  $('.collapse-link').on('click', function() {
    var button, content, ibox
    ibox = $(this).closest('div.ibox')
    button = $(this).find('i')
    content = ibox.children('.ibox-content')
    content.slideToggle(200)
    button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down')
    ibox.toggleClass('').toggleClass('border-bottom')
    return setTimeout((function() {
      ibox.resize()
      return ibox.find('[id^=map-]').resize()
    }), 50)
  })
  $('.close-link').on('click', function() {
    var content
    content = $(this).closest('div.ibox')
    return content.remove()
  })
  $('.fullscreen-link').on('click', function() {
    var button, ibox
    ibox = $(this).closest('div.ibox')
    button = $(this).find('i')
    $('body').toggleClass('fullscreen-ibox-mode')
    button.toggleClass('fa-expand').toggleClass('fa-compress')
    ibox.toggleClass('fullscreen')
    return setTimeout((function() {
      return $(window).trigger('resize')
    }), 100)
  })
  $('.close-canvas-menu').on('click', function() {
    return SmoothlyMenu()
  })
  $('body.canvas-menu .sidebar-collapse').slimScroll({
    height: '100%',
    railOpacity: 0.9
  })
  $('.right-sidebar-toggle').on('click', function() {
    return $('#right-sidebar').toggleClass('sidebar-open')
  })
  $('.sidebar-container').slimScroll({
    height: '100%',
    railOpacity: 0.4,
    wheelStep: 10
  })
  $('.open-small-chat').on('click', function() {
    $(this).children().toggleClass('fa-comments').toggleClass('fa-remove')
    return $('.small-chat-box').toggleClass('active')
  })
  $('.small-chat-box .content').slimScroll({
    height: '234px',
    railOpacity: 0.4
  })
  $('.check-link').on('click', function() {
    var button, label
    button = $(this).find('i')
    label = $(this).next('span')
    button.toggleClass('fa-check-square').toggleClass('fa-square-o')
    label.toggleClass('todo-completed')
    return false
  })
  $('.navbar-minimalize').on('click', function(event) {
    event.preventDefault()
    $('body').toggleClass('mini-navbar')
    localStorage.setItem('collapse_menu', $('body').hasClass('mini-navbar') ? 'on' : 'off')
    return SmoothlyMenu()
  })
  $('.tooltip-demo').tooltip({
    selector: '[data-toggle=tooltip]',
    container: 'body'
  })
  fix_height()
  $(window).bind('load', function() {
    if ($('body').hasClass('fixed-sidebar')) {
      return $('.sidebar-collapse').slimScroll({
        height: '100%',
        railOpacity: 0.9
      })
    }
  })
  $(window).scroll(function() {
    if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
      return $('#right-sidebar').addClass('sidebar-top')
    } else {
      return $('#right-sidebar').removeClass('sidebar-top')
    }
  })
  $(window).bind('load resize scroll', function() {
    if (!$('body').hasClass('body-small')) {
      return fix_height()
    }
  })
  $('[data-toggle=popover]').popover()
  return $('.full-height-scroll').slimscroll({
    height: '100%'
  })
})

$(window).bind('resize', function() {
  if ($(this).width() < 769) {
    return $('body').addClass('body-small')
  } else {
    return $('body').removeClass('body-small')
  }
})

$(document).on('turbolinks:load', function() {
  var body, boxedlayout, collapse, fixedfooter, fixednavbar, fixedsidebar
  if (localStorageSupport()) {
    collapse = localStorage.getItem('collapse_menu')
    fixedsidebar = localStorage.getItem('fixedsidebar')
    fixednavbar = localStorage.getItem('fixednavbar')
    boxedlayout = localStorage.getItem('boxedlayout')
    fixedfooter = localStorage.getItem('fixedfooter')
    body = $('body')
    if (fixedsidebar === 'on') {
      body.addClass('fixed-sidebar')
      $('.sidebar-collapse').slimScroll({
        height: '100%',
        railOpacity: 0.9
      })
    }
    if (collapse === 'on' && !body.hasClass('body-small')) {
      body.addClass('mini-navbar')
    }
    if (fixednavbar === 'on') {
      $('.navbar-static-top').removeClass('navbar-static-top').addClass('navbar-fixed-top')
      body.addClass('fixed-nav')
    }
    if (boxedlayout === 'on') {
      body.addClass('boxed-layout')
    }
    if (fixedfooter === 'on') {
      return $('.footer').addClass('fixed')
    }
  }
})
