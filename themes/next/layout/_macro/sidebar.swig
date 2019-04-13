{% macro render(is_post) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    {% if theme.sidebar.onmobile %}
      <div id="sidebar-dimmer"></div>
    {% endif %}
    <div class="sidebar-inner">

      {% set display_toc = is_post and theme.toc.enable or is_page and theme.toc.enable %}

      {% if display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap">
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview-wrap">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}

      <section class="site-overview-wrap sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">
        <div class="site-overview">
          <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
            {% if theme.avatar %}
              <img class="site-author-image" itemprop="image"
                src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"
                alt="{{ theme.author }}" />
            {% endif %}
              <p class="site-author-name" itemprop="name">{{ theme.author }}</p>
              <p class="site-description motion-element" itemprop="description">{#
            #}{% if theme.seo %}{#
              #}{{ theme.signature }}{#
            #}{% else %}{#
              #}{{ theme.description }}{#
            #}{% endif %}{#
            #}</p>
          </div>

          <nav class="site-state motion-element">

            {% if config.archive_dir != '/' and site.posts.length > 0 %}
              <div class="site-state-item site-state-posts">
              {% if theme.menu.archives %}
                <a href="{{ url_for(theme.menu.archives).split('||')[0] | trim }}">
              {% else %}
                <a href="{{ url_for(config.archive_dir) }}">
              {% endif %}
                  <span class="site-state-item-count">{{ site.posts.length }}</span>
                  <span class="site-state-item-name">{{ __('state.posts') }}</span>
                </a>
              </div>
            {% endif %}

            {% if site.categories.length > 0 %}
              {% set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}
              {% set hasCategoriesPage = categoriesPageQuery.length > 0 %}
              <div class="site-state-item site-state-categories">
                {% if hasCategoriesPage %}<a href="{{ url_for(categoriesPageQuery[0].path) }}">{% endif %}
                  <span class="site-state-item-count">{{ site.categories.length }}</span>
                  <span class="site-state-item-name">{{ __('state.categories') }}</span>
                {% if hasCategoriesPage %}</a>{% endif %}
              </div>
            {% endif %}

            {% if site.tags.length > 0 %}
              {% set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}
              {% set hasTagsPage = tagsPageQuery.length > 0 %}
              <div class="site-state-item site-state-tags">
                {% if hasTagsPage %}<a href="{{ url_for(tagsPageQuery[0].path) }}">{% endif %}
                  <span class="site-state-item-count">{{ site.tags.length }}</span>
                  <span class="site-state-item-name">{{ __('state.tags') }}</span>
                {% if hasTagsPage %}</a>{% endif %}
              </div>
            {% endif %}

          </nav>

          {% if theme.rss %}
            <div class="feed-link motion-element">
              <a href="{{ url_for(theme.rss) }}" rel="alternate">
                <i class="fa fa-rss"></i>
                RSS
              </a>
            </div>
          {% endif %}

          {% if theme.social %}
            <div class="links-of-author motion-element">
                {% for name, link in theme.social %}
                  <span class="links-of-author-item">
                    <a href="{{ link.split('||')[0] | trim }}" target="_blank" title="{{ name }}">
                      {% if theme.social_icons.enable %}
                        <i class="fa fa-fw fa-{{ link.split('||')[1] | trim | default('globe') }}"></i>{#
                    #}{% endif %}{#
                      #}{% if not theme.social_icons.icons_only %}{#
                        #}{{ name }}{#
                      #}{% endif %}{#
                  #}</a>
                  </span>
                {% endfor %}
            </div>
          {% endif %}

          {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
          {% if theme.creative_commons in cc %}
            <div class="cc-license motion-element" itemprop="license">
              <a href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0{% endif %}/" class="cc-opacity" target="_blank">
                <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
              </a>
            </div>
          {% endif %}

          {# Blogroll #}
          {% if theme.links %}
            <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">
              <div class="links-of-blogroll-title">
                <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
                {{ theme.links_title }}
              </div>
              <ul class="links-of-blogroll-list">
                {% for name, link in theme.links %}
                  <li class="links-of-blogroll-item">
                    <a href="{{ link }}" title="{{ name }}" target="_blank">{{ name }}</a>
                  </li>
                {% endfor %}
              </ul>
            </div>
          {% endif %}

          {% include '../_custom/sidebar.swig' %}
          
          <div id="binft" style="text-align:center;"></div> 
          <script>
              var binft = function (r) {
                function t() {
                  return b[Math.floor(Math.random() * b.length)]
                }  
                function e() {
                  return String.fromCharCode(94 * Math.random() + 33)
                }
                function n(r) {
                  for (var n = document.createDocumentFragment(), i = 0; r > i; i++) {
                    var l = document.createElement("span");
                    l.textContent = e(), l.style.color = t(), n.appendChild(l)
                  }
                  return n
                }
                function i() {
                  var t = o[c.skillI];
                  c.step ? c.step-- : (c.step = g, c.prefixP < l.length ? (c.prefixP >= 0 && (c.text += l[c.prefixP]), c.prefixP++) : "forward" === c.direction ? c.skillP < t.length ? (c.text += t[c.skillP], c.skillP++) : c.delay ? c.delay-- : (c.direction = "backward", c.delay = a) : c.skillP > 0 ? (c.text = c.text.slice(0, -1), c.skillP--) : (c.skillI = (c.skillI + 1) % o.length, c.direction = "forward")), r.textContent = c.text, r.appendChild(n(c.prefixP < l.length ? Math.min(s, s + c.prefixP) : Math.min(s, t.length - c.skillP))), setTimeout(i, d)
                }
                var l = "",
                o = ["青青陵上柏，磊磊涧中石。", "人生天地间，忽如远行客。","斗酒相娱乐，聊厚不为薄。", "驱车策驽马，游戏宛与洛。","洛中何郁郁，冠带自相索。","长衢罗夹巷，王侯多第宅。","两宫遥相望，双阙百余尺。","极宴娱心意，戚戚何所迫？"].map(function (r) {
                return r + ""
                }),
                a = 2,
                g = 1,
                s = 5,
                d = 75,
                b = ["rgb(110,64,170)", "rgb(150,61,179)", "rgb(191,60,175)", "rgb(228,65,157)", "rgb(254,75,131)", "rgb(255,94,99)", "rgb(255,120,71)", "rgb(251,150,51)", "rgb(226,183,47)", "rgb(198,214,60)", "rgb(175,240,91)", "rgb(127,246,88)", "rgb(82,246,103)", "rgb(48,239,130)", "rgb(29,223,163)", "rgb(26,199,194)", "rgb(35,171,216)", "rgb(54,140,225)", "rgb(76,110,219)", "rgb(96,84,200)"],
                c = {
                  text: "",
                  prefixP: -s,
                  skillI: 0,
                  skillP: 0,
                  direction: "forward",
                  delay: a,
                  step: g
                };
                i()
                };
                binft(document.getElementById('binft'));
            </script>
            
        </div>
      </section>

      {% if display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            {% if page.toc_number === undefined %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
            {% endif %}

            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

          </div>
        </section>
      <!--/noindex-->
      {% endif %}

      {% if theme.sidebar.b2t %}
        <div class="back-to-top">
          <i class="fa fa-arrow-up"></i>
          {% if theme.sidebar.scrollpercent %}
            <span id="scrollpercent"><span>0</span>%</span>
          {% endif %}
        </div>
      {% endif %}

    </div>
  </aside>
{% endmacro %}
