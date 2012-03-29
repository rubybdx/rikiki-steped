window.render_md = () ->
  converter = new Showdown.converter
  content = converter.makeHtml($('#content').val())
  $('#html_out').html(content)

render_md()

