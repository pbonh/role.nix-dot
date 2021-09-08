" Textobjects to select a text surrounded by braket or same characters user input.
  xmap is <Plug>(textobj-sandwich-query-i)
  xmap as <Plug>(textobj-sandwich-query-a)
  omap is <Plug>(textobj-sandwich-query-i)
  omap as <Plug>(textobj-sandwich-query-a)

" Textobjects to select the nearest surrounded text automatically.
  xmap iss <Plug>(textobj-sandwich-auto-i)
  xmap ass <Plug>(textobj-sandwich-auto-a)
  omap iss <Plug>(textobj-sandwich-auto-i)
  omap ass <Plug>(textobj-sandwich-auto-a)

" Textobjects to select a text surrounded by same characters user input.
  xmap im <Plug>(textobj-sandwich-literal-query-i)
  xmap am <Plug>(textobj-sandwich-literal-query-a)
  omap im <Plug>(textobj-sandwich-literal-query-i)
  omap am <Plug>(textobj-sandwich-literal-query-a)
