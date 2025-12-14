function pdfcompres
    if test (count $argv) -lt 2; or test $argv[1] = "--help"
        echo 'Usage: pdfcompres <input> <output>'
        return 
    end
    ps2pdf -dPDFSETTINGS=/ebook $argv
end
