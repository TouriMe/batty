!function(o){"function"==typeof define&&define.amd?define(["jquery"],o):"object"==typeof module&&module.exports?module.exports=function(e,r){return void 0===r&&(r="undefined"!=typeof window?require("jquery"):require("jquery")(e)),o(r),r}:o(jQuery)}(function(o){"use strict";o.extend(o.FE.POPUP_TEMPLATES,{"colors.picker":"[_BUTTONS_][_TEXT_COLORS_][_BACKGROUND_COLORS_]"}),o.extend(o.FE.DEFAULTS,{colorsText:["#61BD6D","#1ABC9C","#54ACD2","#2C82C9","#9365B8","#475577","#CCCCCC","#41A85F","#00A885","#3D8EB9","#2969B0","#553982","#28324E","#000000","#F7DA64","#FBA026","#EB6B56","#E25041","#A38F84","#EFEFEF","#FFFFFF","#FAC51C","#F37934","#D14841","#B8312F","#7C706B","#D1D5D8","REMOVE"],colorsBackground:["#61BD6D","#1ABC9C","#54ACD2","#2C82C9","#9365B8","#475577","#CCCCCC","#41A85F","#00A885","#3D8EB9","#2969B0","#553982","#28324E","#000000","#F7DA64","#FBA026","#EB6B56","#E25041","#A38F84","#EFEFEF","#FFFFFF","#FAC51C","#F37934","#D14841","#B8312F","#7C706B","#D1D5D8","REMOVE"],colorsStep:7,colorsDefaultTab:"text",colorsButtons:["colorsBack","|","-"]}),o.FE.PLUGINS.colors=function(e){function r(){var o=e.$tb.find('.fr-command[data-cmd="color"]'),r=e.popups.get("colors.picker");if(r||(r=s()),!r.hasClass("fr-active"))if(e.popups.setContainer("colors.picker",e.$tb),l(r.find(".fr-selected-tab").attr("data-param1")),o.is(":visible")){var t=o.offset().left+o.outerWidth()/2,a=o.offset().top+(e.opts.toolbarBottom?10:o.outerHeight()-10);e.popups.show("colors.picker",t,a,o.outerHeight())}else e.position.forSelection(r),e.popups.show("colors.picker")}function t(){e.popups.hide("colors.picker")}function s(){var o='<div class="fr-buttons fr-colors-buttons">';e.opts.toolbarInline&&e.opts.colorsButtons.length>0&&(o+=e.button.buildList(e.opts.colorsButtons)),o+=a()+"</div>";var r={buttons:o,text_colors:c("text"),background_colors:c("background")},t=e.popups.create("colors.picker",r);return t}function a(){var o='<div class="fr-colors-tabs">';return o+='<span class="fr-colors-tab '+("background"==e.opts.colorsDefaultTab?"":"fr-selected-tab ")+'fr-command" data-param1="text" data-cmd="colorChangeSet" title="'+e.language.translate("Text")+'">'+e.language.translate("Text")+"</span>",o+='<span class="fr-colors-tab '+("background"==e.opts.colorsDefaultTab?"fr-selected-tab ":"")+'fr-command" data-param1="background" data-cmd="colorChangeSet" title="'+e.language.translate("Background")+'">'+e.language.translate("Background")+"</span>",o+"</div>"}function c(o){for(var r="text"==o?e.opts.colorsText:e.opts.colorsBackground,t='<div class="fr-color-set fr-'+o+"-color"+(e.opts.colorsDefaultTab==o||"text"!=e.opts.colorsDefaultTab&&"background"!=e.opts.colorsDefaultTab&&"text"==o?" fr-selected-set":"")+'">',s=0;s<r.length;s++)0!==s&&s%e.opts.colorsStep===0&&(t+="<br>"),t+="REMOVE"!=r[s]?'<span class="fr-command fr-select-color" style="background: '+r[s]+';" data-cmd="'+o+'Color" data-param1="'+r[s]+'"></span>':'<span class="fr-command fr-select-color" data-cmd="'+o+'Color" data-param1="REMOVE" title="'+e.language.translate("Clear Formatting")+'">'+e.icon.create("remove")+"</span>";return t+"</div>"}function l(r){var t,s=e.popups.get("colors.picker"),a=o(e.selection.element());for(t="background"==r?"background-color":"color",s.find(".fr-"+r+"-color .fr-select-color").removeClass("fr-selected-color");a.get(0)!=e.$el.get(0);){if("transparent"!=a.css(t)&&"rgba(0, 0, 0, 0)"!=a.css(t)){s.find(".fr-"+r+'-color .fr-select-color[data-param1="'+e.helpers.RGBToHex(a.css(t))+'"]').addClass("fr-selected-color");break}a=a.parent()}}function n(o,e){o.hasClass("fr-selected-tab")||(o.siblings().removeClass("fr-selected-tab"),o.addClass("fr-selected-tab"),o.parents(".fr-popup").find(".fr-color-set").removeClass("fr-selected-set"),o.parents(".fr-popup").find(".fr-color-set.fr-"+e+"-color").addClass("fr-selected-set"),l(e))}function i(o){"REMOVE"!=o?e.format.applyStyle("background-color",e.helpers.HEXtoRGB(o)):e.format.removeStyle("background-color"),t()}function p(o){"REMOVE"!=o?e.format.applyStyle("color",e.helpers.HEXtoRGB(o)):e.format.removeStyle("color"),t()}function d(){e.popups.hide("colors.picker"),e.toolbar.showInline()}return{showColorsPopup:r,hideColorsPopup:t,changeSet:n,background:i,text:p,back:d}},o.FE.DefineIcon("colors",{NAME:"tint"}),o.FE.RegisterCommand("color",{title:"Colors",undo:!1,focus:!0,refreshOnCallback:!1,popup:!0,callback:function(){this.popups.isVisible("colors.picker")?(this.$el.find(".fr-marker")&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("colors.picker")):this.colors.showColorsPopup()},plugin:"colors"}),o.FE.RegisterCommand("textColor",{undo:!0,callback:function(o,e){this.colors.text(e)}}),o.FE.RegisterCommand("backgroundColor",{undo:!0,callback:function(o,e){this.colors.background(e)}}),o.FE.RegisterCommand("colorChangeSet",{undo:!1,focus:!1,callback:function(o,e){var r=this.popups.get("colors.picker").find('.fr-command[data-cmd="'+o+'"][data-param1="'+e+'"]');this.colors.changeSet(r,e)}}),o.FE.DefineIcon("colorsBack",{NAME:"arrow-left"}),o.FE.RegisterCommand("colorsBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.colors.back()}}),o.FE.DefineIcon("remove",{NAME:"eraser"})});