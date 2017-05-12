<section class="content-header">
  <h1>
    <button type="button" onclick="return load_page2('akdkrs/listMk')" class="btn bg-navy btn-flat"><i class="fa fa-fw fa-arrow-left"></i> Back</button>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Page</a></li>
    <li class="active">404 error</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">

<div class="row">
		<div class="error-page" style="    padding: 25px 2px;">
            <h2 class="headline text-yellow"> {{angka}}</h2>
            <div class="error-content">
              <h3><i class="fa fa-warning text-yellow"></i> {{pesan1}}</h3>
              <p>
                {{pesan2}}
              </p>
            </div><!-- /.error-content -->
        </div>
</div>
      
</section><!-- /.content -->


<style type="text/css">
	.over{
		/*background: crimson;*/
    	color: crimson;
	}
</style>

<script type="text/javascript">
$(function () {
    $('#example2').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true
    });
});

function lihat() {
	var link = '{{ url("akdkrs/ListMkDitawarkan/") }}';
    var datas = $('form').serialize();
    go_page_data(link,datas);
}


</script>