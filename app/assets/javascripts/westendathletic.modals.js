window.westendathletic = window.westendathletic || {};
window.westendathletic.modals = window.westendathletic.modals || {};

window.westendathletic.modals.deleteItem = function() {

	var deleteButton = null;
	var modal = null;

	var insertItemTextAndUrl = function() {
		var itemText = deleteButton.data('name');
		var itemUrl = deleteButton.data('url');

		modal.find('span').text(itemText);
		modal.find('a.btn-danger').attr('href', itemUrl);
	};

	var showModal = function() {
		modal.modal('show');
	};

	return {
		init: function (args) {
			deleteButton = $(args.deleteButtonClass);
			modal = $(args.modalElementId);

			$(deleteButton).on('click', function() {
				insertItemTextAndUrl();
				showModal();
			});
		}
	};

}();