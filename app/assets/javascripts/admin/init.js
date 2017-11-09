
window.jiayongfuAdmin = {};

function setUpEditorWithImageUpload() {
    var token = $('.file-upload-token-medium').val();
    var editor = new MediumEditor('.editable-with-image', {
        toolbar: {
            buttons: ['bold', 'strikethrough', 'quote', 'orderedlist', 'unorderedlist', 'h2', 'h3']
        },
        placeholder: {
            text: '输入详情'
        },
        anchor: {
            targetCheckbox: true
        }
    });
    $('.editable-with-image').mediumInsert({
        editor: editor,
        addons: {
            images: {
                fileUploadOptions: { // (object) File upload configuration. See https://github.com/blueimp/jQuery-File-Upload/wiki/Options
                    url: 'http://upload.qiniu.com/', // (string) A relative path to an upload script
                    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i, // (regexp) Regexp of accepted file types
                    paramName: 'file',
                    formData: [{name: 'token', value: token}],
                    fail: function (e, data) {
                        if (data.context.find('img') && data.context.find('img').length > 0){
                            data.context.find('img').remove();
                            if (data.jqXHR.status === 401){
                                // eslint-disable-next-line no-alert
                                alert('图片上传失败：请先保存当前页面，然后重新打开编辑，再尝试上传图片！');
                            } else {
                                // eslint-disable-next-line no-alert
                                alert('图片上传失败：请重新添加图片！');
                            }
                        }
                    }
                }
            }
        }
    });
}


function setupUpload(el) {
    var originalElement = $(el),
        token = $('.file-upload-token-medium').val(),
        uploadElement,
        preview,
        container;
    container = $('<div class="image-upload-container"></div>');
    uploadElement = $('<input type="file">');
    preview = $('<img width="100"/>');
    preview.attr('src', originalElement.val() + '?imageView/0/w/100');
    container.append(uploadElement).append($('<div/>').append(preview));
    //el = $('<div><input type="file"><div class="hint"><img src="'+ originalElement.val() + '" alt=""></div></div>');
    $(originalElement.parent()).append(container);
    originalElement.detach();
    originalElement.css('display', 'none');
    container.append(originalElement);
    $(uploadElement).fileupload({
        url: 'http://upload.qiniu.com/', // (string) A relative path to an upload script
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i, // (regexp) Regexp of accepted file types
        paramName: 'file',
        formData: [{name: 'token', value: token}],
        done: function (e, data) {
            $(preview).attr('src', data.result.files[0].url + '?imageView/0/w/100');
            $(originalElement).val(data.result.files[0].url);
        }
    });
}


jiayongfuAdmin.initQiNiuFileInputs = function (els) {
    $(els).each(function (index, item) {
        Jiayongfu.initQiNiuFileInput(item);
    });
};

$(document).on('has_many_add:after', '.has_many_container', function (e, fieldset) {
    jiayongfuAdmin.initQiNiuFileInputs(fieldset.find('.qi_niu_file.input'));
});

$(document).on('ready page:load turbolinks:load', function () {
    jiayongfuAdmin.initQiNiuFileInputs($('.qi_niu_file.input'));

});


$(document).ready(function () {
    if ($('.editable-with-image').length){
        setUpEditorWithImageUpload();
    }

    var $clientFileupload = $('.client-fileupload');
    if ($clientFileupload.length) {
        $clientFileupload.each(function(index, el){
            setupUpload(el);
        });
    }

});
