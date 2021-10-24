-- https://github.com/jgm/pandoc/issues/2106#issuecomment-371355862
function Div(el)
  if el.classes:includes("rmdnote") then
    return {
      pandoc.RawBlock("latex", "\\begin{tcolorbox}[fonttitle=\\sffamily\\bfseries\\large,title=Remarque,colframe=darkblue]"),
      el,
      pandoc.RawBlock("latex", "\\end{tcolorbox}")
    }
  end

  if el.classes:includes("rmdcaution") then
    return {
      pandoc.RawBlock("latex", "\\begin{tcolorbox}[fonttitle=\\sffamily\\bfseries\\large,title=Attention,colframe=darkred]"),
      el,
      pandoc.RawBlock("latex", "\\end{tcolorbox}")
    }
  end

  if el.classes:includes("rmdimportant") then
    return {
      pandoc.RawBlock("latex", "\\begin{tcolorbox}[fonttitle=\\sffamily\\bfseries\\large,title=Important,colframe=darkgreen]"),
      el,
      pandoc.RawBlock("latex", "\\end{tcolorbox}")
    }
  end

  if el.classes:includes("rmdtip") then
    return {
      pandoc.RawBlock("latex", "\\begin{tcolorbox}[fonttitle=\\sffamily\\bfseries\\large,title=Conseil,colframe=darkcyan]"),
      el,
      pandoc.RawBlock("latex", "\\end{tcolorbox}")
    }
  end

  if el.classes:includes("rmdwarning") then
    return {
      pandoc.RawBlock("latex", "\\begin{tcolorbox}[fonttitle=\\sffamily\\bfseries\\large,title=Avertissement,colframe=darkyellow]"),
      el,
      pandoc.RawBlock("latex", "\\end{tcolorbox}")
    }
  end
end
