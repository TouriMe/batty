// Simplicity is the most beautiful thing 
// I have ever sensed 

// this thing will append the form url in a serial way
// and validate it
// function add_attr(purchase_id, ele) {
//   var url = "/checkout/";
//   url = url +  purchase_id;
//   ele.attr('action', url); // now change the form url
//
// }
//
// function create_purchase(ele_info) {
//   var valuesToSubmit = ele_info.serialize();
//   callback_form = $("#payment_form"); // form that need to change its url since braintree would send a callback to that end
//   $.ajax({
//         type: "POST",
//         url: ele_info.attr('action'), //sumbits it to the given url of the form
//         data: valuesToSubmit,
//         dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//     }).success(function(purchase) {
//       add_attr(purchase.id, callback_form);
//       console.log(purchase);
//     });
//
//   return false;
// }
//
// // this will run as soon as the user pressed
// // "Confirmed Payment" button
// function clicked_chargebt() {
//   ele_info = $('#payment_details'); // get user inputed purchase details
//   create_purchase(ele_info);
// }
//
// $(document).ready(function() {
//
//   $("#cards_toggle").click(function(event) {
//     event.preventDefault();
//     $("#card_details").toggle();
//   });
//
//   $("#paypal-container").click(function(event) {
//     $("#card_details").hide();
//   });
//
// });
