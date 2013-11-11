# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'DOMContentLoaded', ->
    if document.getElementById('SpeakerDeckEmbed')
        deckEmbed.container = document.getElementById('SpeakerDeckEmbed')
        deckEmbed.deckUrl = document.getElementById('SpeakerDeckUrl').href
        deckEmbed.buildEmbed()

deckEmbed =
    container: ''
    deckUrl: ''
    slideshareUrl: 'http://www.slideshare.net/api/oembed/2'
    speakerdeckUrl: 'https://speakerdeck.com/oembed.json'
    api: ''
    ajaxRequest: ->
        if window.XMLHttpRequest
            xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = ->
            if xmlhttp.readyState is 4 and xmlhttp.status is 200
                this.container.innerHTML = xmlhttp.responseText;

        xmlhttp.open("GET", this.api, true);
        xmlhttp.send();
    slideshareEmbed: ->
        this.api = this.slideshareUrl + '?url=' + this.deckUrl + "&format=json"
        # this.ajaxRequest()
        $.get this.api, (data) ->
            this.container.innerHTML = data.html
    speakerDeckEmbed: ->
        this.api = this.speakerdeckUrl + '?url=' + this.deckUrl + "&format=json"
        # this.ajaxRequest()
        $.get this.api, (data) ->
            this.container.innerHTML = data.html
    buildEmbed: ->
        if this.deckUrl.indexOf("slideshare.net") isnt -1
            this.slideshareEmbed()
        else if this.deckUrl.indexOf("speakerdeck.com") isnt -1
            this.speakerDeckEmbed()
