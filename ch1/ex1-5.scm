;ex1.5
;过程p会调用自身，造成无限循环。在正则序中，会先对参数应用过程，并一直展开，最后才求值；在应用序中，会先对参数求值，再应用过程。因此(test 0 (p)) 在应用序中会无限循环，在正则序中会返回0.
