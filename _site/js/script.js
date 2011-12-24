// Open a new tab for external links.
$('a[href*="://"]').not('[href^="'+site.url+'"]')
  .attr('target', '_blank').addClass('external')
  .not(':has(*)').addClass('text-only');

$(window).load(function () {
  // Use relative url after everything is loaded. Allows us to test locally.
  $('a[href^="'+site.url+'"]').attr('href', function(index, attr) {
    return attr.substring(site.url.length);
  });
});

/**
 * SyntaxHighlighter
 */
function path()
{
  var args = arguments,
      result = []
      ;

  for(var i = 0; i < args.length; i++)
      result.push(args[i].replace('@', '/js/libs/syntaxhighlighter_3.0.83/'));

  return result
};

SyntaxHighlighter.autoloader.apply(null, path(
  'applescript            @shBrushAppleScript.js',
  'actionscript3 as3      @shBrushAS3.js',
  'bash shell             @shBrushBash.js',
  'coldfusion cf          @shBrushColdFusion.js',
  'cpp c                  @shBrushCpp.js',
  'c# c-sharp csharp      @shBrushCSharp.js',
  'css                    @shBrushCss.js',
  'delphi pascal          @shBrushDelphi.js',
  'diff patch pas         @shBrushDiff.js',
  'erl erlang             @shBrushErlang.js',
  'groovy                 @shBrushGroovy.js',
  'java                   @shBrushJava.js',
  'jfx javafx             @shBrushJavaFX.js',
  'js jscript javascript  @shBrushJScript.js',
  'perl pl                @shBrushPerl.js',
  'php                    @shBrushPhp.js',
  'text plain             @shBrushPlain.js',
  'py python              @shBrushPython.js',
  'ruby rails ror rb      @shBrushRuby.js',
  'sass scss              @shBrushSass.js',
  'scala                  @shBrushScala.js',
  'sql                    @shBrushSql.js',
  'vb vbnet               @shBrushVb.js',
  'xml xhtml xslt html    @shBrushXml.js'
));
SyntaxHighlighter.defaults['toolbar'] = false;

// Remove any <code> tags before we highlight
$('pre.brush\\:>code').each(function(index) {
    var content = $(this).contents();
    $(this).replaceWith(content);
});

SyntaxHighlighter.all();