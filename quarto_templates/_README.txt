
list the item stuff you can flow over
```
<ul>
    <% for (const item of items) { %>
        <pre><%= JSON.stringify(item, null, 2) %></pre>
        <% if (item.title) { %>
            <li>
                <%= item.date %> 
                <a href="<%- item.path %>"><%= item.title %></a> 
                <%= item.description %> 
                [<%= item.categories %>]
            </li>
        <% } %>
    <% } %>
</ul>
```