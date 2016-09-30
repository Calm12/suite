<div>
    {foreach from=$contacts item=row}
            {if $row.bdate==1}
                    <div style="background-color: #FF9900">
            {/if}
        <table>
            {foreach from=$row key=k item=v}
                {if $k!='bdate'}
                <tr>
                    <td>{$k}:</td><td>{$v}</td>
                </tr>
                {/if}
            {/foreach}
        </table>
            {if $row.bdate==1}
                    </div>
            {/if}
        <br/>
    {/foreach}
</div>