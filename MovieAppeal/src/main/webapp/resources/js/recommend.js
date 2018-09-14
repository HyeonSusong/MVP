selectTarget.on({
    'focus' : function () {
        $("selectbox").parent().addClass('focus');
    },
    'blur' : function () {
        $("selectbox").parent().removeClass('focus');
    }
});


