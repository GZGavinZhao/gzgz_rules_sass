<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Compile Sass files to CSS

<a id="multi_sass_binary"></a>

## multi_sass_binary

<pre>
multi_sass_binary(<a href="#multi_sass_binary-name">name</a>, <a href="#multi_sass_binary-output_style">output_style</a>, <a href="#multi_sass_binary-sourcemap">sourcemap</a>, <a href="#multi_sass_binary-srcs">srcs</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="multi_sass_binary-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="multi_sass_binary-output_style"></a>output_style |  How to style the compiled CSS   | String | optional | <code>"compressed"</code> |
| <a id="multi_sass_binary-sourcemap"></a>sourcemap |  Whether sourcemaps should be emitted   | Boolean | optional | <code>True</code> |
| <a id="multi_sass_binary-srcs"></a>srcs |  A list of Sass files and associated assets to compile   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |


<a id="sass_binary"></a>

## sass_binary

<pre>
sass_binary(<a href="#sass_binary-name">name</a>, <a href="#sass_binary-deps">deps</a>, <a href="#sass_binary-include_paths">include_paths</a>, <a href="#sass_binary-output_dir">output_dir</a>, <a href="#sass_binary-output_name">output_name</a>, <a href="#sass_binary-output_style">output_style</a>, <a href="#sass_binary-sourcemap">sourcemap</a>,
            <a href="#sass_binary-sourcemap_embed_sources">sourcemap_embed_sources</a>, <a href="#sass_binary-src">src</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="sass_binary-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="sass_binary-deps"></a>deps |  sass_library targets to include in the compilation   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="sass_binary-include_paths"></a>include_paths |  Additional directories to search when resolving imports   | List of strings | optional | <code>[]</code> |
| <a id="sass_binary-output_dir"></a>output_dir |  Output directory, relative to this package.   | String | optional | <code>""</code> |
| <a id="sass_binary-output_name"></a>output_name |  Name of the output file, including the .css extension.<br><br>By default, this is based on the <code>src</code> attribute: if <code>styles.scss</code> is the <code>src</code> then the output file is <code>styles.css.</code>. You can override this to be any other name. Note that some tooling may assume that the output name is derived from the input name, so use this attribute with caution.   | String | optional | <code>""</code> |
| <a id="sass_binary-output_style"></a>output_style |  How to style the compiled CSS   | String | optional | <code>"compressed"</code> |
| <a id="sass_binary-sourcemap"></a>sourcemap |  Whether source maps should be emitted.   | Boolean | optional | <code>True</code> |
| <a id="sass_binary-sourcemap_embed_sources"></a>sourcemap_embed_sources |  Whether to embed source file contents in source maps.   | Boolean | optional | <code>False</code> |
| <a id="sass_binary-src"></a>src |  Sass entrypoint file   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |


<a id="sass_library"></a>

## sass_library

<pre>
sass_library(<a href="#sass_library-name">name</a>, <a href="#sass_library-deps">deps</a>, <a href="#sass_library-srcs">srcs</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="sass_library-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="sass_library-deps"></a>deps |  sass_library targets to include in the compilation   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | <code>[]</code> |
| <a id="sass_library-srcs"></a>srcs |  Sass source files   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |


<a id="SassInfo"></a>

## SassInfo

<pre>
SassInfo(<a href="#SassInfo-transitive_sources">transitive_sources</a>)
</pre>

Collects files from sass_library for use in downstream sass_binary

**FIELDS**


| Name  | Description |
| :------------- | :------------- |
| <a id="SassInfo-transitive_sources"></a>transitive_sources |  Sass sources for this target and its dependencies    |


