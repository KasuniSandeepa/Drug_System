<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IMPASL Drug | IMC Data Form </title>
	<link rel="stylesheet" href="https://code.jquery.com/mobile/1.2.1/jquery.mobile-1.2.1.min.css" />
	<script src="https://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script src="https://code.jquery.com/mobile/1.2.1/jquery.mobile-1.2.1.min.js"></script>
</head>
<body>
<div data-role="page" id="imcpit" data-theme="e" data-content-theme="e">
   <div data-role="header">
	<a href="#home" data-theme="b">HOME</a>
      <h1>IMPORTER DATA COLLECTION FORM</h1>
	<a href="#home" data-theme="b">PROGRAM END</a>
   </div><!-- /header -->

           <div data-role="content">
            <form id="imcForm" action="#">

                    <label for="SearchStr1">Importer</label>
                    <input type="text" name="Importer" id="SearchStr1" value=""  />
 
                    <label for="SearchStr2">Manufacturer</label>
                    <input type="text" name="Manufacturer" id="SearchStr2" value=""  />

                    <label for="SearchStr3">Country</label>
                    <input type="text" name="Country" id="SearchStr3" value=""  />

                    <label for="SearchStr4">IMCcode</label>
                    <input type="text" name="IMCcode" id="SearchStr4" value=""  />


                   <label for="SearchStr5">Address</label>
                    <input type="text" name="Address" id="SearchStr5" value=""  />
 
                    <label for="SearchStr6">Phone</label>
                    <input type="text" name="Phone" id="SearchStr6" value=""  />

                    <label for="SearchStr7">Fax</label>
                    <input type="text" name="Fax" id="SearchStr7" value=""  />

                    <label for="SearchStr8">email</label>
                    <input type="text" name="email" id="SearchStr8" value=""  />
                    
           
                    
                    <button  value="submit" id="subBtn"></button>



<!--

                    <button data-theme="b" id="imcBt" type="submit">SAVE</button>
                    <button data-theme="b" id="viubt1" type="submit">PRESCRIPTION</button>
                    <button data-theme="b" id="viubt2" type="submit">LAB REQUEST</button>
                    <button data-theme="b" id="viubt3" type="submit">DIAGNOSIS CARD</button>

                </div>
-->

            </form>
<td><input type="text" value="" name="quantity" onblur="Calculate()"/>
  </td><td><input type="text" value="" name="price" onblur="Calculate()"/>
  </td><td><input type="text" value="" name="total"/>


  <script type="text/javascript">

  function Calculate()
  {

       var txt1 = document.getElementById("quantity");
       var txt2 = document.getElementById("price");
       var txt3 = document.getElementById("total");
       if ((txt1.value != "") && (txt2.value != ""))
       {
            txt3.value = parseInt(txt1.value) * parseInt(txt2.value); 
       }

  }

  </script>
--	
        </div>

 
</div><!-- /page END IMC pg -->
<script type="text/javascript">

$('#subBtn').click(function () {
	
    $.ajax({
        url: 'controller/DrugContrller.jsp?action=saveImctable',
        type: 'GET',
        processData: false,
        contentType: false,
        cache: false,
        data: $('#imcForm').serialize(), // added data type
        success: function (data) {

           

        },
        error: function (e) {

        }
    });
})

</script>

</body>
</html>