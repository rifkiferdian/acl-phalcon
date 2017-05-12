<?php

class Helpers 
{ 
    /* HOW TO USE:
       {{ helper.opsi_select('warna','merah','Pilih Warna') }}
    */
   
   /* NILAI DEV
       NILAI Devault setiap PT berbeda 
    */
   public function dev_nilai($n)
   {
        $NILAI['A'] = 4;
        $NILAI['A-'] = 3.6;
        $NILAI['B+'] = 3.3;
        $NILAI['B'] = 3;
        $NILAI['B-'] = 2.6;
        $NILAI['C+'] = 2.3;
        $NILAI['C'] = 2;
        $NILAI['C-'] = 1.6;
        $NILAI['D+'] = 1.3;
        $NILAI['D'] = 1;
        $NILAI['D-'] = 0.6;
        $NILAI['E'] = 0;
        $NILAI['CD'] = 1.5;
        $NILAI['T'] = 0;
        $NILAI['K'] = 0;
        $NILAI['TL'] = 0;
        $NILAI['CD'] = 1.5;
        $NILAI['BC'] = 2.5;
        $NILAI['AB'] = 3.5;
        return $NILAI[$n];
   }

   public function hari($hari)
   {
       $dayList = array(
            1  => 'Senin',
            2  => 'Selasa',
            3  => 'Rabu',
            4  => 'Kamis',
            5  => 'Jumat',
            6  => 'Sabtu',
            7  => 'Minggu'
        );
       return $dayList[$hari];
   }

    public function jam_convert($style,$jam)
    {
       return date($style, strtotime($jam));
    }


	public function opsi_select($nama, $select, $text)
    {
    	$db    = Setting::findFirst([["nama"=>$nama]]);
    	// $dt    = json_decode($db->opsi,true);
    	$dt    = explode(",", $db->opsi);
    	$html  = "<option value='' >$text</option>";
    	$array = '1dimensi';

    	foreach ($dt as $k => $v) {
    		if ($k == '0' or $array == '0dimensi') {
	    		if ($select == $v) {
	    			$selected = "selected=selected";
	    		} else {
	    			$selected = "";
	    		}

    			$html .= "<option value='$v' $selected >$v</option>";
    			$array = '0dimensi';
    		}

    		if($array == '1dimensi'){
    			if ($select == $k) {
	    			$selected = "selected=selected";
	    		} else {
	    			$selected = "";
	    		}

    			$html.="<option value='$k' $selected >$v</option>";
    			$array='1dimensi';
    		}
    	}
    	
    	return $html;
    }

    public function format_thn_akd($year) {
       $year2 = $year+1;
       return "$year/$year2";
    }

    public function opsi_checkbox($nama, $select)
    {
        $db    = Setting::findFirst([["nama"=>$nama]]);
        $dt    = explode(",", $db->opsi);
        $select_arr=explode(",",$select);
        foreach ($dt as $k => $v) {
            if ($k == '0' or $array == '0dimensi') {
                if (in_array($v, $select_arr)) {
                    $selected = "checked=checked";
                } else {
                    $selected = "";
                }

                $html .= "<input type='checkbox' value='$v' $selected > $v<br>";
                $array = '0dimensi';
            }
        }
        return $html;
    }

    public function get_option($nama)
    {
        $db = Setting::findFirst([["nama"=>$nama]]);

        return $db->opsi;
    }
 
    public function opsi_bulan_indo($select){
        $opsi='';
        for ($i=1; $i <=12; $i++) { 
            if ((int)$select==$i) {
                $selected="selected=selected";
            }else{
                $selected="";
            }
            $j=sprintf("%02d",$i);
            $opsi.="<option value='$j' $selected >".date("F",strtotime("2016-$j-01"))."</option>";
        }
        return $opsi;
    }

    public function dateFormatIndo($date)
    {
        $pecah  = explode('-', $date);
        $tgl    = $pecah[2];
        $bln    = $pecah[1];
        $thn    = $pecah[0];

        return $tgl . '-' . $bln . '-' . $thn;
    }

    public function dateBahasaIndo($date,$short_bln='')
    {
        if (substr($date,0,10)=='0000-00-00') {
            return false;
        }
        $bulan = array(
            '01' => 'Januari',
            '02' => 'Februari',
            '03' => 'Maret',
            '04' => 'April',
            '05' => 'Mei',
            '06' => 'Juni',
            '07' => 'Juli',
            '08' => 'Agustus',
            '09' => 'September',
            '10' => 'Oktober',
            '11' => 'November',
            '12' => 'Desember',
        );

            $pecah  = explode('-',$date);
            $bln    = $pecah[1];
            $thn    = $pecah[0];
        if (strlen($date)>10) {
            $tgl_arr    = explode(" ", $pecah[2]);
            $tgl=$tgl_arr[0];
            $detik=substr($date,-8,5);
        }else{
            $tgl    = $pecah[2];
            $detik='';
        }
        if ($short_bln==1) {
            return $tgl . ' ' . substr($bulan[$bln],0,3) . ' ' . $thn.' '.$detik;
        }else{
            return $tgl . '-' . $bulan[$bln] . '-' . $thn;
        }
    }

    public function konversi_bln($date){
        $a=$this->dateBahasaIndo($date.'-01');
        $b=explode("-", $a);
        $c=$b[1]." ".$b[2];
        return $c;
    }
 

    public function kekata($x) 
    {
        $x      = abs($x);
        $angka  = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
        $temp   = "";

        if ($x <12) {            
            $temp = " " . $angka[$x];
        } elseif ($x < 20) {            
            $temp = $this->kekata($x - 10) . " belas";
        } elseif ($x < 100) {            
            $temp = $this->kekata($x / 10) . " puluh" . $this->kekata($x % 10);
        } elseif ($x < 200) {            
            $temp = " seratus" . $this->kekata($x - 100);
        } elseif ($x < 1000) {            
            $temp = $this->kekata($x / 100) . " ratus" . $this->kekata($x % 100);
        } elseif ($x < 2000) {            
            $temp = " seribu" . $this->kekata($x - 1000);
        } elseif ($x < 1000000) {            
            $temp = $this->kekata($x / 1000) . " ribu" . $this->kekata($x % 1000);
        } elseif ($x < 1000000000) {            
            $temp = $this->kekata($x / 1000000) . " juta" . $this->kekata($x % 1000000);
        } elseif ($x < 1000000000000) {            
            $temp = $this->kekata($x / 1000000000) . " milyar" . $this->kekata(fmod($x, 1000000000));
        } elseif ($x < 1000000000000000) {            
            $temp = $this->kekata($x / 1000000000000) . " trilyun" . $this->kekata(fmod($x, 1000000000000));
        }     
        
        return $temp;
    }
          
    public function terbilang($x, $style=1) 
    {
        if ($x < 0) {
            $hasil = "minus " . trim($this->kekata($x));
        } else {
            $hasil = trim($this->kekata($x));
        }    

        switch ($style) {
            case 1:
                $hasil = strtoupper($hasil);
                break;
            case 2:
                $hasil = strtolower($hasil);
                break;
            case 3:
                $hasil = ucwords($hasil);
                break;
            default:
                $hasil = ucfirst($hasil);
                break;
        }    
         
        return $hasil;
    }
        
    function konversi_tgl($date, $date_format='')
    {
        $dayList = array(
            'Sunday'    => 'Minggu',
            'Monday'    => 'Senin',
            'Tuesday'   => 'Selasa',
            'Wednesday' => 'Rabu',
            'Thursday'  => 'Kamis',
            'Friday'    => 'Jumat',
            'Saturday'  => 'Sabtu'
        );

        $monthList = array(
            '01' => 'Januari',
            '02' => 'Februari',
            '03' => 'Maret',
            '04' => 'April',
            '05' => 'Mei',
            '06' => 'Juni',
            '07' => 'Juli',
            '08' => 'Agustus',
            '09' => 'September',
            '10' => 'Oktober',
            '11' => 'November',
            '12' => 'Desember'
        );

        $format_hari = date('l', strtotime($date));
        $format_tgl  = date('d', strtotime($date));
        $format_bln  = date('m', strtotime($date));
        $format_thn  = date('Y', strtotime($date));

        switch ($date_format) {
            case 'l':
                # Hari ex: Kamis
                $output = $dayList[$format_hari];
                break;
            case 'd':
                # Tanggal ex: 21
                $output = $format_tgl;
                break;  
            case 'm':
                # Bulan ex: Januari
                $output = $monthList[$format_bln];
                break;  
            case 'y':
                # Tahun ex: 2016
                $output = $format_thn;
                break;                                            
            default:
                # Hari, Tanggal-Bulan-Tahun ex: Rabu, 26-Juli-2016 
                $output = $dayList[$format_hari] . ', ' . $format_tgl . '-' . $monthList[$format_bln] . '-' . $format_thn;
                break;
        }

        return $output;
    }

}