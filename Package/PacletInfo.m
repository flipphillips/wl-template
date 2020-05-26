(* Paclet Info File *)

Paclet[
    Name -> "Package",
    Description -> "Package Package",
    Creator -> "Flip Phillips <flip@flipphillips.com>",
    Publisher -> "Vision Lab",
    Copyright -> "(c) 2015- Flip Phillips",
    License -> "MIT",
    Version -> "0.1.0",
    BuildNumber -> "1",
    MathematicaVersion -> "10.0+",
    URL -> "https://github.com/flipphillips/",
    Thumbnail -> "Documentation/icon.png",
    (* Loading -> Automatic,     *)
    
    Extensions -> {
      { "Documentation", 
        MainPage -> "Guides/Package", 
        Language -> "English"},

      { "Kernel", 
        Root -> "Kernel", 
        Context -> {"Package`"}
      },

      {"FrontEnd", 
        Prepend -> True
      }
    }
]