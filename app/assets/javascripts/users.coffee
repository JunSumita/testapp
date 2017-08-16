# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(".searchable").select2({
      width:      200,  # 横幅
      allowClear: true  # x で選択したものを削除できる
      # 詳細は http://ivaynberg.github.io/select2/#documentation
    })

  $(".drag_and_drop").fileupload();

  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#user_image_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_image_crop_x').val(coords.x)
    $('#user_image_crop_y').val(coords.y)
    $('#user_image_crop_w').val(coords.w)
    $('#user_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#user_image_previewbox').css
      width: Math.round(100/coords.w * $('#user_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#user_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

'''
  $(".clopImg").cropper({
        dragMode:"move",
        aspectRatio:4/5,
        wheelZoomRatio:0.05,
        modal:false,
        autoCropArea:1,
        cropBoxMovable:false,
        cropBoxResizable:false,
        dragCrop:false,
        toggleDragModeOnDblclick:false,
        built: ->
            $("#clopImg").cropper(
                "setCropBoxData",{left:192,top:77.5,width:116,height:145}
            );
    });
'''
