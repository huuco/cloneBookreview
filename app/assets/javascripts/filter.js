$(document).ready(function(){
  $('#form-filter').change(function(){
    var keyword = $('#txt_filter_book').val();
    var categroy_id = $('#category_id').val();
    $.ajax({
      url: '/admin/books',
      method: 'GET',
      data: {
        keyword: keyword,
        categroy_id: categroy_id
      },
    });
  });
});
