$(document).ready(function() {

  $('a#js_add_team').on('click', function() {

    $this = $(this);

    latest_team_selector = $this.closest('div.control-group');
    new_team_selector = latest_team_selector.clone(true,true);

    latest_team_selector.after(new_team_selector);
    $this.remove();

    newly_added_team_selector = $('div.control-group').last();
    label = newly_added_team_selector.find('label');
    select = newly_added_team_selector.find('select');

    label.text(parseInt(label.text()) + 1);
    select.val(select.find('option').first());

    label.attr('for', label.attr('for').replace(/\d/, parseInt(label.text()) - 1));
    select.attr('id', select.attr('id').replace(/\d/, parseInt(label.text()) - 1));
    select.attr('name', select.attr('name').replace(/\d/, parseInt(label.text()) - 1));

  });

});