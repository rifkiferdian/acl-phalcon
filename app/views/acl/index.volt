<section class="content-header">
  <h1>
    Access Control LIST
    <small>it all starts here</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Acl</a></li>
    <li class="active">Setup</li>
  </ol>
</section>

<!-- Main content -->
<section class="content"> 

<div class="col-md-12">
  <button class="btn bg-navy btn-flat margin" data-toggle="modal" data-target="#modal_induk">Tambah Modul Induk</button>
  <button class="btn bg-navy btn-flat margin" data-toggle="modal" data-target="#modal_anak">Tambah Modul Anak</button>
</div>

<!-- Modal Induk -->
<div id="modal_induk" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Form Induk</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-3 control-label">Label Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="label_menus" placeholder="label_menu">
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Parent</label>
              <div class="col-sm-9">
                <input type="taxt" value="0" class="form-control" id="parents" placeholder="Parent">
                <p class="text-aqua">* sebagai induk = 0</p>
                <p class="text-aqua">* sebagai anak = Id yang akan di jadikan induk</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Usergroup</label>
              <div class="col-sm-9">
                <select id="usergroups" class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
                <?php foreach ($usergroup as $key => $value): ?>
                  <option value="<?= $value['id'] ?>"><?= $value['nama'] ?></option>            
                <?php endforeach ?>
              </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Kecuali User</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="kecuali_users" placeholder="id_user dipisah dg koma">
                <p class="text-aqua">* contoh value = ,1021,1022,1023,</p>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Aktif:</label>
              <div class="col-sm-4">
                <select class="form-control" id="aktifs">
                  <option value="Y">Y</option>
                  <option value="N">N</option>
                </select>
              </div>
              <div class="col-sm-5"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Icon Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="icons" value="fa-folder">
                <p class="text-muted"><a target="Blank" href="http://fontawesome.io/icons/">http://fontawesome.io/icons/</a></p>
              </div>
            </div>
          </div><!-- /.box-body -->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" onclick="add_induk()" class="btn btn-info " >Tambah</button>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Anak -->
<div id="modal_anak" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Form Induk</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-3 control-label">Label Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="label_menu" placeholder="label_menu">
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Controller</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="controller" placeholder="controller">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Action</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="action" placeholder="method">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">id Parent</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="parent" placeholder="Parent">
                <p class="text-aqua">* sebagai induk = 0</p>
                <p class="text-aqua">* sebagai anak = Id yang akan di jadikan induk</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Usergroup</label>
              <div class="col-sm-9">
                <select id="usergroup" class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
                <?php foreach ($usergroup as $key => $value): ?>
                  <option value="<?= $value['id'] ?>"><?= $value['nama'] ?></option>            
                <?php endforeach ?>
              </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Kecuali User</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="kecuali_user" placeholder="id_user dipisah dg koma">
                <p class="text-aqua">* contoh value = ,1021,1022,1023,</p>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Aktif:</label>
              <div class="col-sm-4">
                <select class="form-control" id="aktif">
                  <option value="Y">Y</option>
                  <option value="N">N</option>
                </select>
              </div>
              <div class="col-sm-5"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Icon Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="icon" value="fa-folder-o">
                <p class="text-muted"><a target="Blank" href="http://fontawesome.io/icons/">http://fontawesome.io/icons/</a></p>
              </div>
            </div>
          </div><!-- /.box-body -->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info " onclick="add_anak()">Tambah</button>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

     <div class="col-md-12">
        <div class="panel panel-default">
          <div class="box-header with-border">
            <i class="fa fa-text-width"></i>
            <h3 class="box-title">Data Acl</h3>
          </div>
          <div class="panel-body">

            <table class="table table-bordered" style="border-collapse:collapse;">
                <thead>
                    <tr>
                        <th style="width: 25px;">id</th>
                        <th style="">Label</th>
                        <th style="">Link</th>
                        <th style="">Usergrop</th>
                        <th style="">Kecuali User</th>
                        <th style="">Aktif</th>
                        <th style="">action</th>
                    </tr>
                </thead>
                <tbody>

            <?php 

            function loop($acl, $usergroup)
            {
              foreach ($acl as $key => $value) {
                if (!empty($value['child'])) {
                  if ($value['controller'] == '') {$jenis = '<span class="badge bg-green">Parent</span>';}else{$jenis = $value['controller'].'/'.$value['action'];}
            ?>

                  <tr style="color: #19B5FE;" data-toggle="collapse" data-target="#demo<?=$value['id']?>" class="accordion-toggle">

                          <td style="width: 25px;"><?=$value['id']?></td>
                          <td style=""><i class="fa <?= $value['icon'] ?>"></i> <?=$value['label_menu']?></td>
                          <td style=""><?=$jenis?></td>
                          <td style=""><?=$value['usergroup_id']?></td>
                          <td style=""><?=$value['except_user']?></td>
                          <?php if ($value['aktif'] == 'Y'): ?>
                          <td><span class="badge bg-green"><?=$value['aktif']?></span></td>
                          <?php else: ?>
                          <td><span class="badge bg-red"><?=$value['aktif']?></span></td>
                          <?php endif ?>
                          <td style="">

                            <div class="btn-group">
                                <a id="edit" class="btn btn-primary btn-xs btn-flat" data-toggle="modal" data-target="#modal_induk_edit<?=$value['id']?>"><i class="glyphicon glyphicon-edit"></i>  </a>
                                <a id="delete" onclick=" delete_acl('<?=$value['id']?>')" class="btn btn-danger btn-xs btn-flat"><i class="glyphicon glyphicon-trash"></i></a>
                              </div>
<div id="modal_induk_edit<?=$value['id']?>" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Form Induk</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-3 control-label">Label Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" value="<?= $value['label_menu'] ?>" id="label_menus<?=$value['id']?>" placeholder="label_menu">
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Parent</label>
              <div class="col-sm-9">
                <input type="taxt" value="0" value="<?= $value['parent'] ?>" class="form-control" id="parents<?=$value['id']?>" placeholder="Parent">
                <p class="text-aqua">* sebagai induk = 0</p>
                <p class="text-aqua">* sebagai anak = Id yang akan di jadikan induk</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Usergroup</label>
              <div class="col-sm-9">
                <select id="usergroups<?=$value['id']?>" class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
                <?php $r = array_filter(explode(',', $value['usergroup_id']));?>
                <?php foreach ($usergroup as $uskey => $us): ?>
                <?php if (in_array($us['id'], $r)): ?>
                  <option value="<?= $us['id'] ?>" selected><?= $us['nama'] ?></option>            
                <?php else: ?>
                  <option value="<?= $us['id'] ?>"><?= $us['nama'] ?></option>            
                <?php endif ?>
                <?php endforeach ?>  
              </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Kecuali User</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" value="<?= $value['except_user'] ?>" id="kecuali_users<?=$value['id']?>" placeholder="id_user dipisah dg koma">
                <p class="text-aqua">* contoh value = ,1021,1022,1023,</p>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Aktif:</label>
              <div class="col-sm-4">
                <select class="form-control" id="aktifs<?=$value['id']?>">
                  <option value="Y">Y</option>
                  <option value="N">N</option>
                </select>
              </div>
              <div class="col-sm-5"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Icon Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="icons<?=$value['id']?>" value="<?= $value['icon'] ?>">
                <p class="text-muted"><a target="Blank" href="http://fontawesome.io/icons/">http://fontawesome.io/icons/</a></p>
              </div>
            </div>
          </div><!-- /.box-body -->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info " onclick="induk_edit('<?=$value['id']?>')">Edit</button>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

                          </td>
                      </tr>
                      <tr>
                          <td colspan="6" class="hiddenRow">
                            <div style="    width: 110%; " id="demo<?=$value['id']?>" class="accordian-body collapse">
                              <table class="table table-bordered" style="border-collapse:collapse;">
                              <tr>
                                <th style="width: 25px;">id</th>
                                <th style="">Label</th>
                                <th style="">Link</th>
                                <th style="">Usergrop</th>
                                <th style="">Kecuali User</th>
                                <th style="">Aktif</th>
                                <th style="">Action</th>
                            </tr>

                                <tbody>

                                  <?php loop($value['child'], $usergroup);  ?>
                                            
                                </tbody>

                              </table>
                            </div>
                            </td>
                      </tr> 

            <?php }else{
                  if ($value['controller'] == '') {$jenis = '<span class="badge bg-green">Parent</span>';}else{$jenis = $value['controller'].'/'.$value['action'];}
                  // if ($value['action'] == '') {$ac = 'index';}else{$ac = $value['action'];}
            ?>
                  <tr>
                            <td style="width: 25px;"><?=$value['id']?></td>
                            <td style=""><i class="fa <?= $value['icon'] ?>"></i> <?=$value['label_menu']?></td>
                            <td style=""><?=$jenis?></td>
                            <td style=""><?=$value['usergroup_id']?></td>
                            <td style=""><?=$value['except_user']?></td>
                            <?php if ($value['aktif'] == 'Y'): ?>
                            <td><span class="badge bg-green"><?=$value['aktif']?></span></td>
                            <?php else: ?>
                            <td><span class="badge bg-red"><?=$value['aktif']?></span></td>
                            <?php endif ?>
                            <td style="">

                              <div class="btn-group">
                                <a id="edit" class="btn btn-primary btn-xs btn-flat" data-toggle="modal" data-target="#modal_anak_edit<?=$value['id']?>"><i class="glyphicon glyphicon-edit"></i>  </a>
                                <a id="delete" onclick=" delete_acl('<?=$value['id']?>')" class="btn btn-danger btn-xs btn-flat"><i class="glyphicon glyphicon-trash"></i></a>
                              </div>

<div id="modal_anak_edit<?=$value['id']?>" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Form Induk</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-3 control-label">Label Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" value="<?= $value['label_menu'] ?>" id="label_menu<?=$value['id']?>" placeholder="label_menu">
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Controller</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" value="<?= $value['controller'] ?>" id="controller<?=$value['id']?>" placeholder="controller">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Action</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" value="<?= $value['action'] ?>" id="action<?=$value['id']?>" placeholder="method">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">id Parent</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" value="<?= $value['parent'] ?>" id="parent<?=$value['id']?>" placeholder="Parent">
                <p class="text-aqua">* Id yang akan di jadikan induk</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Usergroup</label>
              <div class="col-sm-9">
                <select id="usergroup<?=$value['id']?>" class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
                <?php $r = array_filter(explode(',', $value['usergroup_id']));?>
                <?php foreach ($usergroup as $uskey => $us): ?>
                <?php if (in_array($us['id'], $r)): ?>
                  <option value="<?= $us['id'] ?>" selected><?= $us['nama'] ?></option>            
                <?php else: ?>
                  <option value="<?= $us['id'] ?>"><?= $us['nama'] ?></option>            
                <?php endif ?>
                <?php endforeach ?>                
              </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Kecuali User</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" value="<?= $value['except_user'] ?>" id="kecuali_user<?=$value['id']?>" placeholder="id_user dipisah dg koma">
                <p class="text-aqua">* contoh value = ,1021,1022,1023,</p>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label">Aktif:</label>
              <div class="col-sm-4">
                <select class="form-control" id="aktif<?=$value['id']?>">
                  <option value="Y">Y</option>
                  <option value="N">N</option>
                </select>
              </div>
              <div class="col-sm-5"></div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">Icon Menu</label>
              <div class="col-sm-9">
                <input type="taxt" class="form-control" id="icon<?=$value['id']?>" value="<?= $value['icon'] ?>">
                <p class="text-muted"><a target="Blank" href="http://fontawesome.io/icons/">http://fontawesome.io/icons/</a></p>
              </div>
            </div>
          </div><!-- /.box-body -->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info " onclick="anak_edit('<?=$value['id']?>')">Edit</button>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

                            </td>
                    </tr>
            <?php
                }
              }
            }
            ?>
            <?php loop($acl, $usergroup); ?> 
            </tbody>
            </table>
          </div>              
        </div>         
      </div>

</section><!-- /.content -->

<script>
  $(function () {
    $(".select2").select2();
  });

  function induk_edit(id) {
    var label_menu1 = $("#label_menus"+id).val();
    var parent1 = $("#parents"+id).val();
    var usergroup1 = $("#usergroups"+id).val();
    var kecuali_user1 = $("#kecuali_users"+id).val();
    var aktif1 = $("#aktifs"+id).val();
    var icon1 = $("#icons"+id).val();

    var datas = "label_menu1="+label_menu1+"&parent1="+parent1+"&usergroup1="+usergroup1+"&kecuali_user1="+kecuali_user1+"&aktif1="+aktif1+"&icon1="+icon1;
    var urel = '{{ url("acl/editIndukMenu/") }}'+id;

    if (usergroup1 == '' || usergroup1 == null) {
          new PNotify({
               title: 'Regular Notice',
               text: 'Usergroup tidakboleh kosong.',
               type:'warning'
           });
      }else{
        $.ajax({
           type: "POST",
           url: urel,
           dataType : "JSON",
           data: datas
        }).done(function( data ) {
             load_page2('acl');
             new PNotify({
                 title: data.title,
                 text: data.text,
                 type: data.type
             });
            $('#modal_induk_edit'+id).modal('hide');
            $('body').removeClass('modal-open');
            $("body").css("padding-right", "0px");
            $('.modal-backdrop').remove();
        });
      }
  }

  function anak_edit(id) {
    var label_menu = $("#label_menu"+id).val();
    var controller = $("#controller"+id).val();
    var action = $("#action"+id).val();
    var parent = $("#parent"+id).val();
    var usergroup = $("#usergroup"+id).val();
    var kecuali_user = $("#kecuali_user"+id).val();
    var aktif = $("#aktif"+id).val();
    var icon = $("#icon"+id).val();

    var datas = "label_menu="+label_menu+"&controller="+controller+"&action="+action+"&parent="+parent+"&usergroup="+usergroup+"&kecuali_user="+kecuali_user+"&aktif="+aktif+"&icon="+icon;
    var urel = '{{ url("acl/editAnakMenu/") }}'+id;

    if (usergroup == '' || usergroup == null) {
          new PNotify({
               title: 'Regular Notice',
               text: 'Usergroup tidakboleh kosong.',
               type:'warning'
           });
      }else{
        $.ajax({
           type: "POST",
           url: urel,
           dataType : "JSON",
           data: datas
        }).done(function( data ) {
             load_page2('acl');
             new PNotify({
                 title: data.title,
                 text: data.text,
                 type: data.type
             });
             //matikan modal
            $('#modal_anak_edit'+id).modal('hide');
            $('body').removeClass('modal-open');
            $("body").css("padding-right", "0px");
            $('.modal-backdrop').remove();
        });
      }
  }

  function add_induk() {
    var label_menu1 = $("#label_menus").val();
    var parent1 = $("#parents").val();
    var usergroup1 = $("#usergroups").val();
    var kecuali_user1 = $("#kecuali_users").val();
    var aktif1 = $("#aktifs").val();
    var icon1 = $("#icons").val();

    var datas = "label_menu1="+label_menu1+"&parent1="+parent1+"&usergroup1="+usergroup1+"&kecuali_user1="+kecuali_user1+"&aktif1="+aktif1+"&icon1="+icon1;
    var urel = '{{ url("acl/addIndukMenu") }}';

    if (usergroup1 == '' || usergroup1 == null ) {
          new PNotify({
               title: 'Regular Notice',
               text: 'Usergroup tidakboleh kosong.',
               type:'warning'
           });
      }else{
        $.ajax({
           type: "POST",
           url: urel,
           dataType : "JSON",
           data: datas
        }).done(function( data ) {
             load_page2('acl');
             new PNotify({
                 title: data.title,
                 text: data.text,
                 type: data.type
             });
             //matikan modal
            $('#modal_induk').modal('hide');
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
        });
      }
  }

  function add_anak() {
    var label_menu = $("#label_menu").val();
    var controller = $("#controller").val();
    var action = $("#action").val();
    var parent = $("#parent").val();
    var usergroup = $("#usergroup").val();
    var kecuali_user = $("#kecuali_user").val();
    var aktif = $("#aktif").val();
    var icon = $("#icon").val();

    var datas = "label_menu="+label_menu+"&controller="+controller+"&action="+action+"&parent="+parent+"&usergroup="+usergroup+"&kecuali_user="+kecuali_user+"&aktif="+aktif+"&icon="+icon;
    var urel = '{{ url("acl/addAnakMenu") }}';

    if (usergroup == '' || usergroup == null) {
          new PNotify({
               title: 'Regular Notice',
               text: 'Usergroup tidakboleh kosong.',
               type:'warning'
           });
      }else{
        $.ajax({
           type: "POST",
           url: urel,
           dataType : "JSON",
           data: datas
        }).done(function( data ) {
             load_page2('acl');
             new PNotify({
                 title: data.title,
                 text: data.text,
                 type: data.type
             });
             //matikan modal
            $('#modal_anak').modal('hide');
            $('body').removeClass('modal-open');
            $("body").css("padding-right", "0px");
            $('.modal-backdrop').remove();
        });
      }
  }

  function delete_acl(id){
    var urel = '{{ url("acl/deleteAcl") }}/'+id;
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
        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: urel,
            success: function(data){ 
                // console.log(data);
                reload_page('acl','acl');
                new PNotify({
                     title: 'Regular Notice',
                     text: 'data telah dihapus',
                     type:'success'
                 });
            }
        });
    }).on('pnotify.cancel', function() {
       console.log('batal');
    });
  }

</script>
