// Initialize for home page
stepcarousel.setup({
	galleryid: 'stepcarousel_wrapper', //id of carousel DIV
	beltclass: 'belt', //class of inner "belt" DIV containing all the panel DIVs
	panelclass: 'panel', //class of panel DIVs each holding content
	autostep: {enable:true, moveby:1, pause:2000},
	defaultbuttons: {enable: false},
	panelbehavior: {speed:1500, wraparound:true, wrapbehavior:'slide', persist:false},
	contenttype: ['inline'] //content setting ['inline'] or ['ajax', 'path_to_external_file']
})