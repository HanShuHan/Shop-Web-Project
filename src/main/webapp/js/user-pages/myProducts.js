$(document).ready( function () {
    $('#table_id').DataTable({
        "lengthMenu": [10, 25, 50, 100] //顯示筆數設定 預設為[10, 25, 50, 100]
    });

	$("#pickAll").on("click", function() {
		if(this.checked == true)
			$(":checkbox[name='items']").attr("checked", "checked")
		else
			$(":checkbox[name='items']").removeAttr("checked")
	})
	
	$(".on-and-off").on("click", function() {
		if($(this).text() == $(this).data("status_on")) {
			$(this).text($(this).data("status_off"))
			
		}
		else
			$(this).text($(this).data("status_on"))
	})
} );

// 	function toggleAll(source) {
//		let items = document.getElementsByName("items")
//		$(":checkbox[name='items']").attr("checked", source.checked)
//		for(let item in items) {
//			item.checked = source.checked
//			console.log(123)
//		}
//	}