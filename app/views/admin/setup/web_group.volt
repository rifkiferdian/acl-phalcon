<section class="content-header">
  <h1>
    Web Group
    <small>it all starts here</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Setup</a></li>
    <li class="active">web group</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <!-- left column -->
    <div class="col-md-5">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Form Web Group</h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        <div class="form">
          <div class="box-body">
            <div class="row">
              <div class="col-lg-6">
                  <label>Id Group</label>
                  <input type="number" id="id_group" placeholder="Id" class="form-control">
              </div><!-- /.col-lg-6 -->
              <div class="col-lg-6">
                  <label>Nama</label>
                  <input type="text" id="nama" placeholder="Nama" class="form-control">
              </div><!-- /.col-lg-6 -->
            </div><br>

            <div class="row">
              <div class="col-lg-12">
                <label>Deskripsi</label>
                <textarea class="form-control" id="deskripsi" rows="3" placeholder="Enter ..."></textarea>
              </div><!-- /.col-lg-6 -->
            </div><br>
            <div class="row">
              <div class="col-lg-3">
                <label>Aktif</label>
                  <select class="form-control" id="aktif">
                    <option value="Y">Ya</option>
                    <option value="N">Tidak</option>
                  </select>
              </div><!-- /.col-lg-6 -->
            </div>

          </div><!-- /.box-body -->
          <div class="box-footer">
            <button type="submit" onclick="add_group()" class="btn btn-info pull-right">Tambah</button>
          </div><!-- /.box-footer -->
        </div>
      </div><!-- /.box -->
    </div>

    <div class="col-md-7">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Bordered Table</h3>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="example2" class="table table-bordered table-striped">
            <thead>
              <tr>
                <th style="width: 10px">No</th>
                <th style="">Id Group</th>
                <th>Nama</th>
                <th>Aktif</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody>
            
            {% set no=1 %}
            {% for v in usergroup %}
            <tr>
              <td>{{no}}</td>
              <td><span class="badge bg-green">{{v.id}}</span></td>
              <td>{{v.nama}}</td>
              <td>
                {% if v.aktif === "Y" %}
                  <span class="badge bg-green">{{v.aktif}}</span>
                {% else %}
                  <span class="badge bg-red">{{v.aktif}}</span>
                {% endif %}
              </td>
              <td>
                <a id="edit" class="btn btn-primary btn-xs btn-flat" data-toggle="modal" data-target="#myModal{{v.id}}"><i class="glyphicon glyphicon-edit"></i> </a>
                  <!-- Modal -->
                  <div class="modal fade" id="myModal{{v.id}}" role="dialog">
                    <div class="modal-dialog">
                    
                      <!-- Modal content-->
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Edit Data</h4>
                        </div>
                        <div class="modal-body" style="  border: 1px solid #eee;  width: 80%; margin: 0 auto;">
                            <div class="form">
                              <div class="box-body">
                                <div class="row">
                                  <div class="col-lg-5">
                                      <label>Id Group</label>
                                      <input type="number" value="{{v.id}}" style="width: 92px;" id="id_group{{v.id}}" placeholder="Id" class="form-control">
                                  </div><!-- /.col-lg-6 -->  
                                  <div class="col-lg-7">
                                      <label>Nama</label>
                                      <input type="text" value="{{v.nama}}" id="nama{{v.id}}" placeholder="Nama" class="form-control">
                                  </div><!-- /.col-lg-6 -->
                                </div><br>

                                <div class="row">
                                  <div class="col-lg-12">
                                    <label>Deskripsi</label><br>
                                    <textarea style=" width: 394px;" class="form-control" id="deskripsi{{v.id}}" rows="3" placeholder="Enter ...">{{v.deskripsi}}</textarea>
                                  </div><!-- /.col-lg-6 -->
                                </div><br>
                                <div class="row">
                                  <div class="col-lg-3">
                                    <label>Aktif</label>
                                      <select class="form-control" id="aktif{{v.id}}">
                                        <option value="Y">Ya</option>
                                        <option value="N">Tidak</option>
                                      </select>
                                  </div><!-- /.col-lg-6 -->
                                </div>
                              </div><!-- /.box-body -->
                            </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" onclick="edit_group('{{v.id}}')" class="btn btn-info">Edit</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                      
                    </div>
                  </div>
                <a id="delete" onclick="del_data('{{v.id}}')" class="btn btn-danger btn-xs btn-flat"><i class="glyphicon glyphicon-trash"></i></a> 
              </td>
            </tr>
            {% set no=no+1 %}
            {% endfor %}

            </tbody>            
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div>

  </div>

      
</section><!-- /.content -->

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

  function del_data(id) {
    var link = "<?= BASE_URL ?>adminsetup/deleteArea/"+id;
    (new PNotify({
        title: 'Confirmation Needed',
        text: 'Apakah Anda Yakin menghapus data ini?',
        icon: 'glyphicon glyphicon-question-sign',
        hide: false,
        confirm: {
            confirm: true
        },
        buttons: {
            closer: false,
            sticker: false
        },
        history: {
            history: false
        }
    })).get().on('pnotify.confirm', function() {
      var link = "<?= BASE_URL ?>adminsetup/deleteId/";
      var datas = "id="+id+"&modul="+"RefUsergroup";
      $.ajax({
         type: "POST",
         url: link,
         dataType : "json",
         data: datas
      }).done(function( data ) {
          new PNotify({
             title: 'Regular Notice',
             text: 'data telah dihapus',
             type:'success'
          });
          reload_page2('adminsetup/webGroup');
      });
    }).on('pnotify.cancel', function() {
       console.log('batal');
    });
  }

  function edit_group(id) {
      var id_group = $("#id_group"+id).val();
      var nama = $("#nama"+id).val();
      var deskripsi = $("#deskripsi"+id).val();
      var aktif = $("#aktif"+id).val();

      var datas = "id_group="+id_group+"&nama="+nama+"&deskripsi="+deskripsi+"&aktif="+ aktif;
      var urel = '{{ url("adminsetup/editUsergroup/") }}'+id;
      
        $.ajax({
           type: "POST",
           url: urel,
           dataType : "json",
           data: datas
        }).done(function( data ) {
          $('#myModal'+id).modal('hide');
          $('body').removeClass('modal-open');
          $("body").css("padding-right", "0px");
          $('.modal-backdrop').remove();
          
          reload_page('adminsetup/webGroup','webGroup');
           new PNotify({
               title: data.title,
               text: data.text,
               type: data.type
           });

        });
  }

  function add_group() {
    var id_group = $("#id_group").val();
    var nama = $("#nama").val();
    var deskripsi = $("#deskripsi").val();
    var aktif = $("#aktif").val();

    var datas = "id_group="+id_group+"&nama="+nama+"&deskripsi="+deskripsi+"&aktif="+ aktif;
    var urel = '{{ url("adminsetup/submitWebGroup") }}';
    $.ajax({
       type: "POST",
       url: urel,
       dataType : "json",
       data: datas
    }).done(function( data ) {
      // console.log(data);
      reload_page('adminsetup/webGroup','webGroup');
      notif(data.class,data.pesan2,data.pesan1);
    });
  }
</script>