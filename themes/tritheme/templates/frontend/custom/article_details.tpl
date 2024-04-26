{assign var="authors" value=$publication->getData('authors')}
{foreach from=$publication->getData('authors') item=author}
    <div>
        {assign var=authorUserGroup value=$userGroupsById[$author->getData('userGroupId')]}
        <!-- WARNING: hardcoded NewAuthorRole -->
        <!-- TODO: define corresponding author -->
        {assign var=corresponding_author value=$authorUserGroup->getLocalizedName() == 'NewAuthorRole'}
        
        <span class="name">
            {$author->getFullName()|escape}
            {if $corresponding_author}*{/if}

            {if $author->getData('orcid')}
                <a href="{$author->getData('orcid')|escape}" target="_blank">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/0/06/ORCID_iD.svg" alt="ORCID iD" style="width: 10px; height: auto;">
                </a>
            {/if}
        </span>
        
        {if $author->getLocalizedData('affiliation')}
        <span class="affiliation">{$author->getLocalizedData('affiliation')|escape}</span>
        {/if}

        {if $author->getEmail() && $corresponding_author}
        <!-- TODO: change class -->
        <span class="affilication">
        <a href="mailto:{$author->getEmail()}">
            {$author->getEmail()|escape}
        </a>
        </span>
        {/if}
        
        <!-- {if $authorUserGroup->getShowTitle()}
            <span class="userGroup">
                {$authorUserGroup->getLocalizedName()|escape}
            </span>
        {/if} -->

    </div>
{/foreach}
