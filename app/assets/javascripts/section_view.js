
$("#mastery_by_section").ready(function() {
	var request = $.ajax({url:"/sections/show_bargraph", type: "get"})
	request.done(function(response){
	$("#mastery_by_section").show();


	});
});

// $(document).ready(function() {

//   d3.selectAll(".bar").style("fill", function() {
//   return "hsl(" + Math.random() * 360 + ",100%,50%)";
// 	});
// });

