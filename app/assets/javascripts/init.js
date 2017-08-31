function jiayongfuInit() {

    function setupRichEditorEditor() {
        var textarea = $('.rich-editor');

        if (!textarea.length) {
            return;
        }

        var token = textarea.data('image-upload-token');

        new window.Simditor({
            textarea: textarea,
            upload: {
                url: 'http://upload.qiniu.com/',
                fileKey: 'file',
                params: {
                    token: token
                }
            },
            toolbar: [
                'title',
                'bold',
                'italic',
                'underline',
                'strikethrough',
                'fontScale',
                'color',
                '|',
                'indent',
                'outdent',
                '|',
                'alignment-left',
                'alignment-center',
                'alignment-right',
                '|',
                'ol',
                'ul',
                '|',
                'link',
                '|',
                'image',
                'video'
            ]
        });
    }

    setupRichEditorEditor();
}

$(document).on('turbolinks:load', function () {

    jiayongfuInit();
    var $fileinput = $('.fileinput');
    if ($fileinput.length) {
        $fileinput.each(function (index, el) {
            Jiayongfu.initQiNiuFileInput(el, $(el).data());
        });
    }
});
