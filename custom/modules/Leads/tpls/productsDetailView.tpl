
<h2>Products</h2>
<table class="table table-bordered detail" id="pro_tbl">
<tr>
  <th>Product Title</th>
</tr>
{foreach from=$PRODUCTLIST_DETAILS key=index item=line_item}

<tr>
  <!-- <td><a href="">{$line_item.id}</a></td> -->
  <td><a href="index.php?module=AOS_Products&action=DetailView&record={$line_item.id}">{$line_item.name}</a></td>
</tr>
{/foreach}
</table>
