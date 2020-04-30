{* <script>


</script> *}
<!-- Dropdown --> 

  {* <input list="company_name" name="company_name">
  <datalist id="company_name">
    <option value="">
    <option value="Firefox">
    <option value="Chrome">
    <option value="Opera">
    <option value="Safari">
    </tr>

  </datalist>

   *}
{* <html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> *}
{* <style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
</style> *}
{* </head> *}
{* <body>


 
  <div id="company_name" class="dropdown-content">
    <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
    <a href="#about">About</a>
    <a href="#base">Base</a>
    <a href="#blog">Blog</a>
    <a href="#contact">Contact</a>
    <a href="#custom">Custom</a>
    <a href="#support">Support</a>
    <a href="#tools">Tools</a>
  </div>


<script>
{literal}
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */


function filterFunction() {
  debugger;
  $.ajax({
            url: 'index.php?module=Leads&action=GetRelatedContacts&sugar_body_only=true',
             success: function(data) {
             // $.parseJSON(data);
                 debugger;
            //    $('#contact_dropdown').val('1');
               $('select#company_name').append('<option value="0">Select Option</option>');
            //    $.each( data, function(i, val){    
             //$('select#contact_dropdown').append('<option value="'+ data.id +'">'+ data.name +'</option>');
             var optionHTML = $('#company_name');
             for(key in data){
             
                  optionHTML += '<option selected value="'+key+'">'+data[key]+'</option>';
              
                 // optionHTML += '<option value="'+key+'">'+data[key]+'</option>';
          }debugger;
            // });
            // var aa = json_encode(data);
            
             }});
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("company_name");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
{/literal}
</script>

</body>
</html>

<script>


</script>

  
  {* </select>  *}
{*   
  <html>
	<head>
		<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
		
    
	</head>
	<body>
		<h1>DropDown with Search using jQuery</h1>
		<div>
			<select class="company_name chosen-rtl">
    <option value="1">Option 1</option>
    <option value="2">Option 2</option>
    <option value="3">Option 3</option>
  </select>
		</div>
	</body>

  <script>
   {literal}
			


      $("#company_name").chosen({
    disable_search_threshold: 1,
    no_results_text: "Oops, nothing found!",
    width: "95%"
  });
      {/literal}
		</script>
</html> *}

<select id="company_name" name="company_name">
  {foreach from=$SEARCHCOMPANY_HTML key=index item=name}
  <option>{$name}</option>
  <option>{$name}</option>
{/foreach} 

