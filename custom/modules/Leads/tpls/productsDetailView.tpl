
<h2>Products</h2>
<table class="table table-bordered detail" id="pro_tbl">
<tr>
  <th>Products</th>
  <th>Sub Products</th>
  <th>Sub-Sub Products</th>
</tr>
{foreach from=$PRODUCTLIST_DETAILS key=id item=data}
  <tr>
    <td><a href="{$data.id}">{$data.product}</a></td>
    <td><a href="{$data.id}">{$data.sub_product}</a></td>
    <td><a href="{$data.id}">{$data.sub_sub_product}</a></td>
  </tr>
{/foreach}
</table>
