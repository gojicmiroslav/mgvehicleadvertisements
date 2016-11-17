$(function(){
	var category_id = $('#search_category option:selected').val();
	var vehicle_brand_id = $('#search_vehicle_brand option:selected').val();
	var $search_vehicle_brand = $('#search_vehicle_brand');
	var $search_vehicle_model = $('#search_vehicle_model');	

	// $('#search_category').on('change', function(){
	// 	category_id = $('#search_category option:selected').val();
	// 	$search_vehicle_brand = $('#search_vehicle_brand');
	// 	$search_vehicle_model = $('#search_vehicle_model');	

	// 	$('option', $search_vehicle_brand).remove();
	// 	$('option', $search_vehicle_model).remove();	
	// 	$search_vehicle_brand.prop('disabled', 'disabled');
	// 	$search_vehicle_model.prop('disabled', 'disabled');

	// 	if(category_id !== ""){
	// 		// populate search_vehicle_brand
	// 		jQuery.ajax({
	// 			type: 'GET',
	// 			url: '/categories/' + category_id,
	// 			data: {},
	// 			dataType: 'json',
	// 			statusCode: {
	// 				404: function() {
	// 	   				console.log( "404: page not found" );
	//  				}
	// 			}
	// 		}).done(function(data){
	// 			if(data.length > 0){
	// 				$search_vehicle_brand.prop('disabled', false);
	//  				data.forEach(function(obj, index, array){
	//  					var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
	//  					$search_vehicle_brand.append(option);
	//  				});
	// 			} 
	// 		}).then(function(){
	// 			//populate vehicle models for the first brand
	// 			vehicle_brand_id = $('#search_vehicle_brand option:selected').val();
	// 			$('option', $search_vehicle_model).remove();
	// 			$search_vehicle_model.prop('disabled', 'disabled');
				
	// 			// populate search_vehicle_model
	// 			jQuery.ajax({
	// 				type: 'GET',
	// 				url: '/vehicle_brands/' + vehicle_brand_id,
	// 				data: {},
	// 				dataType: 'json',
	// 				statusCode: {
	// 					404: function() {
	// 	  				console.log( "404: page not found" );
	// 					}
	// 				}
	// 			}).done(function(data){
	// 				if(data.length > 0) {
	// 					$search_vehicle_model.prop('disabled', false);
	// 					data.forEach(function(obj, index, array){
	// 						var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
	// 						$search_vehicle_model.append(option);
	// 					});
	// 				} 
	// 			});
	// 		});
	// 	}
	// });

	$("#search_vehicle_brand").on('change', function(){
		vehicle_brand_id = $('#search_vehicle_brand option:selected').val();	
		$search_vehicle_model.prop('disabled', 'disabled');
		$search_vehicle_model.prop('disabled', 'disabled');
		$('option', $search_vehicle_model).remove();

		if(vehicle_brand_id !== ""){
			// populate search_vehicle_model
			jQuery.ajax({
				type: 'GET',
				url: '/vehicle_brands/' + vehicle_brand_id,
				data: {},
				dataType: 'json',
				statusCode: {
					404: function() {
	  				console.log( "404: page not found" );
					}
				}
			}).done(function(data){
				if(data.length > 0) {
					$search_vehicle_model.prop('disabled', false);
					data.forEach(function(obj, index, array){
						var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
						$search_vehicle_model.append(option);
					});
				}
			});
		}
	});
});

