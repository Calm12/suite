<div>
    {foreach from=$accounts item=row}
        <table>
            {foreach from=$row key=k item=v}
                <tr>
                    <td>{$k}:</td><td>{$v}</td>
                </tr>
            {/foreach}
        </table>
        <br/>
    {/foreach}
</div>