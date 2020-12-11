
<h2>Products</h2>
<table class="table table-bordered detail" id="pro_tbl">
<tr>
  <th>Product List</th>
</tr>
{foreach from=$PRODUCTLIST_DETAILS key=id item=data}
  <tr>
    <td><a href="index.php?module=AOS_Products&action=DetailView&record={$data.id}">{$data.name}</a></td>
  </tr>
{/foreach}
</table>
