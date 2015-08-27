/**
 * Created by honglinyang on 27/8/15.
 */
function hide(target) { document.getElementById(target).style.display = 'none'; } function cheight(){ var c_height = document.getElementById('content').clientHeight + 80; document.getElementById('close').onclick= hide('sign_banner'); document.getElementById('content').style.height = c_height + "px" } var main = function() { /* Push the body and the nav over by 285px over */ $('.menu-icon').click(function() { $('.menu').animate({ right: "0" }, 200); $('body').animate({ right: "285px" }, 200); }); /* Then push them back */ $('.icon-close').click(function() { $('.menu').animate({ right: "-285px" }, 200); $('body').animate({ right: "0px" }, 200); }); }; $(document).ready(main);
