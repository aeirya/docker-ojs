{**
 * templates/frontend/objects/article_details.tpl
 * Reduced version focusing on essential components of the article.
 *}

{if !$heading}
    {assign var="heading" value="h3"}
{/if}

<article class="obj_article_details">
    {if $publication->getData('status') !== \PKP\submission\PKPSubmission::STATUS_PUBLISHED}
        <div class="cmp_notification notice">
            {capture assign="submissionUrl"}{url page="workflow" op="access" path=$article->getId()}{/capture}
            {translate key="submission.viewingPreview" url=$submissionUrl}
        </div>
    {elseif $currentPublication->getId() !== $publication->getId()}
        <div class="cmp_notification notice">
            {capture assign="latestVersionUrl"}{url page="article" op="view" path=$article->getBestId()}{/capture}
            {translate key="submission.outdatedVersion"
                datePublished=$publication->getData('datePublished')|date_format:$dateFormatShort
                urlRecentVersion=$latestVersionUrl|escape
            }
        </div>
    {/if}

    {if $publication->getLocalizedData('subtitle')}
        <h3 class="subtitle">{$publication->getLocalizedSubTitle(null, 'html')|strip_unsafe_html}</h3>
    {/if}

    <div class="main_entry">
        {if $publication->getData('authors')}
            <h1>MEOW</h1>
            <section class="item authors">
                <h3>{translate key="article.authors"}</h3>
                <div class="authors">
                    {assign var="authors" value=$publication->getData('authors')}
                    {foreach from=$publication->getData('authors') item=author}
                        <div>
                            {assign var=authorUserGroup value=$userGroupsById[$author->getData('userGroupId')]}
                            <!-- {assign var=usr_group_local value=$authorUserGroup->getLocalizedName()} -->
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
                </div>
            </section>
        {/if}

        {if $publication->getLocalizedData('abstract')}
            <section class="item abstract">
                <h3>{translate key="article.abstract"}</h3>
                <div>{$publication->getLocalizedData('abstract')|strip_unsafe_html}</div>
            </section>
        {/if}

        {call_hook name="Templates::Article::Main"}
    </div>

    <div class="entry_details">
        {if $publication->getLocalizedData('datePublished')}
            <div class="item published">
                <h3>{translate key="submissions.published"}</h3>
                <span>{$publication->getData('datePublished')|date_format:$dateFormatShort}</span>
            </div>
        {/if}

        {call_hook name="Templates::Article::Details"}
    </div>
</article>
{**
 * templates/frontend/objects/article_details.tpl
 * Reduced version focusing on essential components of the article.
 *}

{if !$heading}
    {assign var="heading" value="h3"}
{/if}

<article class="obj_article_details">
    {if $publication->getData('status') !== \PKP\submission\PKPSubmission::STATUS_PUBLISHED}
        <div class="cmp_notification notice">
            {capture assign="submissionUrl"}{url page="workflow" op="access" path=$article->getId()}{/capture}
            {translate key="submission.viewingPreview" url=$submissionUrl}
        </div>
    {elseif $currentPublication->getId() !== $publication->getId()}
        <div class="cmp_notification notice">
            {capture assign="latestVersionUrl"}{url page="article" op="view" path=$article->getBestId()}{/capture}
            {translate key="submission.outdatedVersion"
                datePublished=$publication->getData('datePublished')|date_format:$dateFormatShort
                urlRecentVersion=$latestVersionUrl|escape
            }
        </div>
    {/if}

    {if $publication->getLocalizedData('subtitle')}
        <h3 class="subtitle">{$publication->getLocalizedSubTitle(null, 'html')|strip_unsafe_html}</h3>
    {/if}

    <div class="main_entry">
        {if $publication->getData('authors')}
            <section class="item authors">
                <h3>{translate key="article.authors"}</h3>
                <div class="authors">
                    {foreach from=$publication->getData('authors') item=author}
                        <div>
                            <span class="name">{$author->getFullName()|escape}</span>
                            {if $author->getLocalizedData('affiliation')}
                                <span class="affiliation">{$author->getLocalizedData('affiliation')|escape}</span>
                            {/if}
                            {if $author->getData('orcid')}
                                <a href="{$author->getData('orcid')|escape}" target="_blank">ORCID</a>
                            {/if}
                        </div>
                    {/foreach}
                </div>
            </section>
        {/if}

        {if $publication->getLocalizedData('abstract')}
            <section class="item abstract">
                <h3>{translate key="article.abstract"}</h3>
                <div>{$publication->getLocalizedData('abstract')|strip_unsafe_html}</div>
            </section>
        {/if}

        {call_hook name="Templates::Article::Main"}
    </div>

    <div class="entry_details">
        {if $publication->getLocalizedData('datePublished')}
            <div class="item published">
                <h3>{translate key="submissions.published"}</h3>
                <span>{$publication->getData('datePublished')|date_format:$dateFormatShort}</span>
            </div>
        {/if}

        {call_hook name="Templates::Article::Details"}
    </div>
</article>
