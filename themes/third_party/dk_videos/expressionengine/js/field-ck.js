/**
 * DK Videos
 *
 * @package		DK Videos
 * @version		Version 1.0b1
 * @author		Benjamin David
 * @copyright	Copyright (c) 2012 - DUKT
 * @link		http://dukt.net/dk-videos/
 *
 */(function(e){e.fn.dk_videos_field=function(t){return this.each(function(){field=e(this);e.fn.dk_videos_field.init_field(field)})};e.fn.dk_videos_field.current_field=!1;e.fn.dk_videos_field.init=function(){console.log("track initx");var t={method:"box",site_id:Dk_videos.site_id};e.ajax({url:Dk_videos.ajax_endpoint,type:"post",data:t,success:function(t){e("body").append(t);dk_videos_box.box.init(function(){e(".videoplayer-overlay").css("display")!="none"&&dk_videos_box.lightbox.show()})}});e(".videoplayer-cancel").live("click",function(){dk_videos_box.lightbox.hide()});e(".videoplayer-submit").live("click",function(){var t=e.fn.dk_videos_field.current_field,n=e(".dukt-videos-current").data("video-url");e("input",t).attr("value",n);dk_videos_box.lightbox.hide();e.fn.dk_videos_field.callback_add()});typeof Matrix!="undefined"&&Matrix.bind("dk_videos","display",function(t){if(t.row.isNew){var n=e("> .videoplayer-field",t.dom.$td);e.fn.dk_videos_field.init_field(n)}})};e.fn.dk_videos_field.init_field=function(t){inputValue=e("input",t).attr("value");if(inputValue!=""){t.find(".preview").html("");t.find(".preview").css("display","block");t.find(".preview").addClass("videoplayer-field-preview-loading");video_page=inputValue;data={method:"field_preview",video_page:video_page,site_id:Dk_videos.site_id};e('input[type="hidden"]',t).attr("value",video_page);e.ajax({url:Dk_videos.ajax_endpoint,type:"post",data:data,success:function(e){t.find(".preview").html(e);t.find(".preview").removeClass("videoplayer-field-preview-loading")}});e(".change",t).css("display","inline-block");e(".remove",t).css("display","inline-block")}else e(".add",t).css("display","inline-block");e(".add",t).click(function(){e.fn.dk_videos_field.add(t)});e(".change",t).click(function(){e.fn.dk_videos_field.change(t)});e(".remove",t).click(function(){e.fn.dk_videos_field.remove(t)});e(".videoplayer-field-embed-btn").live("click",function(){e(".videoplayer-overlay").css("display","block");e(".videoplayer-overlay").addClass("videoplayer-overlay-loading");data={method:e(this).data("method"),video_page:e(this).data("video-page"),site_id:VideoPlayer.site_id};e.ajax({url:VideoPlayer.ajax_endpoint,type:"post",data:data,success:function(t){e("body").append(t);e(".videoplayer-overlay").removeClass("videoplayer-overlay-loading");e.fn.dk_videos_field.lightbox.resize()}})})};e.fn.dk_videos_field.callback_add=function(){field=e.fn.dk_videos_field.current_field;field.find(".add").css("display","none");field.find(".change").css("display","inline-block");field.find(".remove").css("display","inline-block");field.find(".preview").html("");field.find(".preview").css("display","block");field.find(".preview").addClass("videoplayer-field-preview-loading");video_page=e(".videoplayer-preview").data("video-page");data={method:"field_preview",video_page:video_page,site_id:Dk_videos.site_id};e('input[type="hidden"]',field).attr("value",video_page);e.ajax({url:Dk_videos.ajax_endpoint,type:"post",data:data,success:function(e){field.find(".preview").html(e);field.find(".preview").removeClass("videoplayer-field-preview-loading")}})};e.fn.dk_videos_field.add=function(t){e.fn.dk_videos_field.current_field=t;dk_videos_box.lightbox.show()};e.fn.dk_videos_field.change=function(t){e.fn.dk_videos_field.current_field=t;dk_videos_box.lightbox.show();var n=t.find("input").attr("value"),r=e(".videoplayer-services li.selected a.videoplayer-service").data("service"),i={method:"box_preview",service:r,site_id:Dk_videos.site_id,video_page:n,autoplay:0};e(".videoplayer-preview").data("video-page",n);dk_videos_box.browser.go(i,"preview",function(){e(".videoplayer-controls").css("display","block")})};e.fn.dk_videos_field.remove=function(e){dk_videos_box.lightbox.hide();e.find("input").attr("value","");e.find(".add").css("display","inline-block");e.find(".change").css("display","none");e.find(".remove").css("display","none");e.find(".preview").css("display","none")};e(document).ready(function(){e.fn.dk_videos_field.init()})})(jQuery);$().ready(function(){$(".videoplayer-field").dk_videos_field()});