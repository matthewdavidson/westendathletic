$(document).ready(function() {

  $('a.delete').on('click', function() {

    $this = $(this);

    item_url = $this.data('url');
    item_name = $this.data('name');
    
    modal = $('div#deleteItem');
    modal.find('span.item-name').text(item_name);
    modal.find('a.btn-danger').attr('href', item_url);

    modal.modal('show');
  });

});