if ( typeof jq == "undefined" )
	var jq = jQuery;
//asamir eddit to solve the conflict
jq(document).ready( function() {

	jq.fn.extend({
        customStyle : function(options) {

	        if(!jq.browser.msie || (jq.browser.msie&&jq.browser.version>6)) {
	            return this.each(function() {
	            	if ( jq(this).data('customStyle') == undefined && !jq(this).hasClass('hasCustomSelect') ) {

		            	jq(this).data('customStyle', true);
		                var currentSelected = jq(this).find(':selected');

		                jq(this).after('<span class="customStyleSelectBox'+options+'"><i class="'+currentSelected.attr("class")+'"></i><span class="customStyleSelectBoxInner'+options+'">'+currentSelected.text()+'</span><i class="fa fa-caret-down"></i></span>').css({position:'absolute', opacity:0,fontSize:jq(this).next().css('font-size')});
		                var selectBoxSpan = jq(this).next();

		                var selectBoxWidth = parseInt(jq(this).width()) - parseInt(selectBoxSpan.css('padding-left')) -parseInt(selectBoxSpan.css('padding-right'));
		                var selectBoxSpanInner = selectBoxSpan.find(':first-child').next();
		                selectBoxSpan.css({display:'inline-block'});
		               //alert(selectBoxSpan.width());
		                jq(this).css('width',selectBoxSpan.width());
		                if(options=="") selectBoxSpanInner.css({width:selectBoxWidth, display:'inline-block'});
		                var selectBoxHeight = parseInt(selectBoxSpan.height()) + parseInt(selectBoxSpan.css('padding-top')) + parseInt(selectBoxSpan.css('padding-bottom'));
		                jq(this).height(selectBoxHeight).change(function() {
		                	selectBoxSpanInner.parent().find('i:first-child').attr('class',  jq(this).find(':selected').attr('class') );
		                    selectBoxSpanInner.text(jq(this).find(':selected').text()).parent().addClass('changed');
		                    jq(this).css('width',selectBoxSpan.width());
		                });


	            	}
	         });
	        }
    }
    });


	jq('.bp-ap-selectbox').change(function(event) {
		var target = jq(event.target);
    	var parent = target.closest('.activity');
			if(parent.attr('id')){
    	var parent_id = parent.attr('id').substr( 9, parent.attr('id').length );

		if (typeof bp_get_cookies == 'function')
			var cookie = bp_get_cookies();
    	else
    		var cookie = encodeURIComponent(document.cookie);

        jq.post( ajaxurl, {
			action: 'update_activity_privacy',
			'cookie': cookie,
			'visibility': jq(this).val(),
			'id': parent_id
		},

		function(response) {
		});
	}
	//	return false;
	});

	//fix the scroll problem
    //jq('#whats-new').unbind('focus');
    /*
    jq('#whats-new').bind('focus', function(){
        jq("#whats-new-options").css('height','auto');
        jq("form#whats-new-form textarea").animate({
            height:'3.8em'
        });
        jq("#aw-whats-new-submit").prop("disabled", false);
    });
    */
	//fix the scroll problem
	if ( 'border-box' !== jq( '#whats-new' ).css( 'box-sizing' ) ) {
		jq('#whats-new').unbind('focus');
		jq('#whats-new').bind('focus', function(){
			jq("#whats-new-options").css('height','auto');

			jq("form#whats-new-form textarea").animate({
				height:'50px'
			});
			jq("#aw-whats-new-submit").prop("disabled", false);
		});
	}



	jq('span#activity-visibility').prependTo('div#whats-new-submit');
	jq("input#aw-whats-new-submit").unbind("click");

	var selected_item_id = jq("select#whats-new-post-in").val();

	jq("select#whats-new-post-in").data('selected', selected_item_id );
	//if selected item is not 'My profil'
	if( selected_item_id != undefined && selected_item_id != 0 ){
		jq('select#activity-privacy').replaceWith(visibility_levels.groups);
	}

	jq("select#whats-new-post-in").bind("change", function() {
		var old_selected_item_id = jq(this).data('selected');
		var item_id = jq("#whats-new-post-in").val();

		if(item_id == 0 && item_id != old_selected_item_id){
			jq('select#activity-privacy').replaceWith(visibility_levels.profil);
		}else{
			if(item_id != 0 && old_selected_item_id == 0 ){
				jq('select#activity-privacy').replaceWith(visibility_levels.groups);
			}
		}
		jq('select#activity-privacy').next().remove();
		if(visibility_levels.custom_selectbox) {
			//jq('select#activity-privacy').customStyle('1');
			jq('select.bp-ap-selectbox').customSelect();
		}
		jq(this).data('selected',item_id);
	});
 	/* New posts */
	jq("input#aw-whats-new-submit").bind('click', function() {

				/* Default POST values */
				var object = '';
				var item_id = jq("#whats-new-post-in").val();
				var visibility = jq("select#activity-privacy").val();
var content = jq("textarea#whats-new").val();
				/* Set object for non-profile posts */
				if ( item_id > 0 ) {
					object = jq("#whats-new-post-object").val();
				}

//asamir intigrate the privacy with act plus
//disabled
//	 if(typeof _medActiveHandler != "undefined" && _medActiveHandler != false && _medActiveHandler.get){
if(false){
		 $ = jq;
			var params = _medActiveHandler.get();
			var group_id = $('#whats-new-post-in').length ? $('#whats-new-post-in').val() : 0;


			$.post(ajaxurl, {
				"action": "med_update_activity_contents",
				"data": params,
				"content": content,
				"group_id": group_id,
				'visibility': visibility,
				'object': object,
				'item_id': item_id
			}, function (data) {
				_medActiveHandler.destroy();
				jq("textarea#whats-new").val('');
				jq('#activity-stream').prepend(data.activity);
				/**
				 * Handle image scaling in previews.
				 */
				jq(".med_final_link img").each(function () {
					jq(this).width(jq(this).parents('div').width());
				});
			});
		return false;
		}
		var button = jq(this);
		var form = button.parent().parent().parent().parent();

		form.children().each( function() {
			if ( jq.nodeName(this, "textarea") || jq.nodeName(this, "input") )
				jq(this).prop( 'disabled', true );
		});

		/* Remove any errors */
		jq('div.error').remove();
		button.addClass('loading');
		button.prop('disabled', true);

		if (typeof bp_get_cookies == 'function')
			var cookie = bp_get_cookies();
    	else
    		var cookie = encodeURIComponent(document.cookie);

		jq.post( ajaxurl, {
			action: 'post_update',
			'cookie': cookie,
			'_wpnonce_post_update': jq("input#_wpnonce_post_update").val(),
			'content': content,
			'visibility': visibility,
			'object': object,
			'item_id': item_id,
			'period_in_min':form.find('#period_in_min').val(),
			'_bp_as_nonce': jq('#_bp_as_nonce').val() || ''
		},
		function(response) {

			form.children().each( function() {
				if ( jq.nodeName(this, "textarea") || jq.nodeName(this, "input") ) {
					jq(this).prop( 'disabled', false );
				}
			});

			/* Check for errors and append if found. */
			if ( response[0] + response[1] == '-1' ) {
				form.prepend( response.substr( 2, response.length ) );
				jq( 'form#' + form.attr('id') + ' div.error').hide().fadeIn( 200 );
			} else {
				if ( 0 == jq("ul.activity-list").length ) {
					jq("div.error").slideUp(100).remove();
					jq("div#message").slideUp(100).remove();
					jq("div.activity").append( '<ul id="activity-stream" class="activity-list item-list">' );
				}

				jq("ul#activity-stream").prepend(response);
				jq("ul#activity-stream li:first").addClass('new-update');

				if ( 0 != jq("#latest-update").length ) {
					var l = jq("ul#activity-stream li.new-update .activity-content .activity-inner p").html();
					var v = jq("ul#activity-stream li.new-update .activity-content .activity-header p a.view").attr('href');

					var ltext = jq("ul#activity-stream li.new-update .activity-content .activity-inner p").text();

					var u = '';
					if ( ltext != '' )
						u = l + ' ';

					u += '<a href="' + v + '" rel="nofollow">' + BP_DTheme.view + '</a>';

					jq("#latest-update").slideUp(300,function(){
						jq("#latest-update").html( u );
						jq("#latest-update").slideDown(300);
					});
				}

				jq("li.new-update").hide().slideDown( 300 );
				jq("li.new-update").removeClass( 'new-update' );
				jq("textarea#whats-new").val('');

				jq('#period_in_min').val(0);
				jq('#duration').css('display','none');
				jq('#isad')[0].checked = false;

			}

			/*
			jq("#whats-new-options").animate({
				height:'0px'
			});
			jq("form#whats-new-form textarea").animate({
				height:'20px'
			});*/

			if ( 'border-box' !== jq( '#whats-new' ).css( 'box-sizing' ) ) {
				jq("#whats-new-options").animate({
					height:'0px'
				});
				jq("form#whats-new-form textarea").animate({
					height:'20px'
				});
			} else {
				jq( '#whats-new' ).animate({
					height: '2.2em'
				})
				jq( '#whats-new-options' ).slideUp();
			}

			jq("#aw-whats-new-submit").prop("disabled", true).removeClass('loading');

			//reset the privacy selection
			jq("select#activity-privacy option[selected]").prop('selected', true).trigger('change');

			if(visibility_levels.custom_selectbox) {
				//jq('select.bp-ap-selectbox').customStyle('2');
				jq('select.bp-ap-selectbox').customSelect();
			}
		});

		return false;
	});

	if(visibility_levels.custom_selectbox) {
		jq('select#activity-privacy').customSelect();
		jq('select.bp-ap-selectbox').customSelect();
		//jq('select#activity-privacy').customStyle('1');
		//jq('select.bp-ap-selectbox').customStyle('2');
	}
});
