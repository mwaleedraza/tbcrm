<select id="account_id" name="account_id">
  {foreach from=$ACCOUNTS_DATA key=index item=data}
    <option value="{$data.id}">{$data.name}</option>
  {/foreach}
</select>
