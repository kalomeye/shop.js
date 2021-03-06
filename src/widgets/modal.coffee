import El from 'el.js'
import html from '../../templates/widgets/modal'

class Modal extends El.View
  tag:  'modal'
  html: html

  opened: false

  init: ->
    super

    m.on Events.ModalOpen, =>
      @toggle true
    m.on Events.ModalClose, =>
      @toggle false

  open: ()->
    @toggle true

  close: ()->
    @toggle false

  toggle: (opened)->
    if opened == true || opened == false
      @opened = opened
    else
      @opened = !@opened

    if @opened
      m.trigger Events.ModalOpened
    else
      m.trigger Events.ModalClosed

    @scheduleUpdate()

export default Modal
