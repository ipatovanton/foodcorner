$.attachinary.config.disableWith = 'Загружаем'
$.attachinary.config.invalidFormatMessage = 'Неправильный формат файла'
$.attachinary.config.template = """

  <% for(var i=0; i<files.length; i++){ %>
    <% if(files[i].resource_type == "raw") { %>
      <div class="raw-file"></div>
    <% } else { %>
      <img src="<%= $.cloudinary.url(files[i].public_id, { "version": files[i].version, "format": 'jpg', "crop": 'fill', "width": 100, "height": 100 }) %>" alt="" width="100" height="100" class="image middle" />
    <% } %>
    <btn class="btn btn-d btn-small middle" href="#" data-remove="<%= files[i].public_id %>">удалить</btn>
  <% } %>
"""