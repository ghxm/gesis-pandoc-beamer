# Adapting the GESIS presentation template to pandoc / Rmarkdown for use with `beamer`

[**Preview**](slides.pdf)

*tested to work with knitr 1.48  & pandoc 3.4 on Windows, pandoc-only or Quarto setups might require adjustments*

This is a simple & unofficial (R)markdown template for creating slides with pandoc and `beamer` in the GESIS presentation layout. It is based on the GESIS template for PowerPoint presentations. The template provided here is based on the `metropolis` theme for `beamer` with minor tweaks and custom background images. 

The aim is to provide a simple template that can be used with pandoc and Rmarkdown to create slides in the GESIS layout without specifying a custom LaTeX template for pandoc. This requires a few awkward workarounds:

- The `background-image` set in the YAML header of the markdown file sets the title slide background image
- The code towards the end of `header-includes` set in the YAML header of the markdown file sets the background image for all other slides
- To change the background image mid-slides, you need to insert raw LaTeX code in the markdown file that ends the current frame, change the background image and start a new frame. This is done with the following code:

    `````text
    ```{=latex}
    % Change the background mid-slides
    % end the last slide
    \end{frame}
    
    % change the background image
    \mode<all>\setbgimage{path/to/image}
    
    % start a new slide so that it will end when the next slide starts
    \begin{frame}<0| handout:0>
    ```
    `````
  
- To avoid additional complexity when changing the background, it's best to stick to slide level 1, i.e. use `#` to add a new slide. If you want to use `#` to create a new section, you might need to adjust the code above to end the last block in addition to the frame and start a new one.
- To introduce a new section while keeping the suggested slide level 1, use:

  ````markdown
  # {.plain}
  
  \section{First section}
  ````
  

> **Note:** If you do not want to use the References as shown in the example, you can remove the `references` field from the YAML header. If you want to use references, it's best to remove the frame as the LaTeX compiler will throw an error if you try to include an empty list of references.


## TODO

- [ ] Adjust the font size and style to match the GESIS template
- [x] Add a custom title page without an `\hrule` and footer
- [ ] Add all background options and adjust as used in the Powerpoint template
- [ ] Custom section background?
- [ ] Put the includes in their own file and include that file in the YAML header