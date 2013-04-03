<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post xfolkentry" id="post<%=Index %>">
  <h1><a href="<%=Post.RelativeOrAbsoluteLink %>" class="taggedlink"><%=Server.HtmlEncode(Post.Title) %></a></h1>
  <p class="clear">
    <span class="author">by <a href="<%=BlogEngine.Core.Utils.AbsoluteWebRoot + "author/" + BlogEngine.Core.Utils.RemoveIllegalCharacters(Post.Author) + BlogEngine.Core.BlogConfig.FileExtension %>"><%=Post.AuthorProfile != null ? Post.AuthorProfile.DisplayName : Post.Author %></a></span>
    <span class="pubDate"><%=Post.DateCreated.ToString("d. MMMM yyyy HH:mm") %></span>
  </p>
  
  <div class="text"><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
  <div class="bottom">
    <!-- andrej: rating not needed -->
    <%--<%=Rating %>--%>

    <p><span class="info">enjoyed the post?</span><a class="square-button subscribe" href="http://shades-of-orange.com/syndication.axd"><i class="icon-rss"></i> subscribe to shades of orange</a></p>
    <p class="tags">Tags: <%=TagLinks(", ") %></p>
    <p class="categories"><%=CategoryLinks(" | ") %></p>
  </div>

  <div class="footer">    
    <!-- andrej: turned off
    <div class="bookmarks">
      <a rel="nofollow" title="Index <%=Index %>" target="_blank" href="http://www.dotnetkicks.com/submit?url=<%=Server.UrlEncode(Post.AbsoluteLink.ToString()) %>&amp;title=<%=Server.UrlEncode(Post.Title) %>">Submit to DotNetKicks...</a>
    </div>
    -->
    
    <%=AdminLinks %>
    
    <% if (BlogEngine.Core.BlogSettings.Instance.ModerationType == BlogEngine.Core.BlogSettings.Moderation.Disqus)
       { %>
    <a rel="nofollow" href="<%=Post.PermaLink %>#disqus_thread"><%=Resources.labels.comments %></a>
    <%}
       else
       { %>
    <a rel="bookmark" href="<%=Post.PermaLink %>" title="<%=Server.HtmlEncode(Post.Title) %>">Permalink</a> |
    <a rel="nofollow" href="<%=Post.RelativeOrAbsoluteLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a>   
    <%} %>
    </div>
</div>