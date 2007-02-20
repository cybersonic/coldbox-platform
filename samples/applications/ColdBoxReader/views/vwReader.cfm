<cfset qryFeeds = requestContext.getValue("qryFeeds")>
<cfset qryTopFeeds = requestContext.getValue("qryTopFeeds")>

<h1>About ColdBoxReader</h1>
<p>
	ColdBoxReader is an application for shared reading of RSS/Atom feeds. Users submit RSS/Atom feeds
	and provide basic information about the feed, what is it about, who publishes it, etc.
	The new feed is added to a shared pool of feeds for others to read; Other users see the feed information
	entered by the user who added the feed, and in turn can add comments and tags to it;
	Feed access is tracked so more popular feeds can bubble up. By combining the view count with tags/categories
	the site can generate a ranking of the most "interesting" feeds for each tag/category.
</p>

<hr /><br />

<p><b>Recently Added:</b>
<cfoutput query="qryFeeds" maxrows="5">
<div style="line-height:20px;">
	<img src="images/archives.gif">&nbsp;<a href="javascript:doEvent('#requestContext.getValue("xehViewFeed")#','centercontent',{feedID:'#qryFeeds.feedID#'});"><strong>#qryFeeds.feedname#</strong></a>
	<span style="font-size:0.9em;">
		 by #qryFeeds.username# on #dateformat(qryFeeds.createdon,"mmm dd")# #lstimeFormat(qryFeeds.createdOn)#
	</span>
</div>
</cfoutput>
</p>


<br /><br />
<p><b>Most Visited:</b>
<cfoutput query="qryTopFeeds">
	<div style="line-height:20px;">
		[#qryTopFeeds.views#]&nbsp;
		<img src="images/archives.gif">&nbsp;<a href="javascript:doEvent('#requestContext.getValue("xehViewFeed")#','centercontent',{feedID:'#qryTopFeeds.feedID#'});"><strong>#qryTopFeeds.feedname#</strong></a>
		<span style="font-size:0.9em;">
			 by #qryTopFeeds.username# on #dateformat(qryTopFeeds.createdon,"mmm dd")# #lstimeFormat(qryFeeds.createdOn)#
		</span>
	</div>
</cfoutput>
</p>

<!--- Setup the Page --->
<cfoutput>
<script>
	clearDiv("leftcontent1");
	clearDiv("rightcontent2");
	doEvent("#requestContext.getValue("xehShowTags")#", "rightcontent1", {});
	doEvent("#requestContext.getValue("xehShowInfo")#", "leftcontent1", {});
	doEvent("#requestContext.getValue("xehAccountActions")#", "divAccountActions", {});
</script>
</cfoutput>