{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 69.0, 87.0, 625.0, 625.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"color" : [ 0.925490196078431, 0.047058823529412, 0.047058823529412, 1.0 ],
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 358.0, 540.0, 85.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "alea.ana2.js",
						"parameter_enable" : 0
					}
,
					"text" : "js alea.ana2.js"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.925490196078431, 0.047058823529412, 0.047058823529412, 1.0 ],
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 280.0, 540.0, 55.0, 22.0 ],
					"text" : "alea.ana"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.925490196078431, 0.047058823529412, 0.047058823529412, 1.0 ],
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 189.0, 540.0, 81.0, 22.0 ],
					"text" : "alea.markov2"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.925490196078431, 0.047058823529412, 0.047058823529412, 1.0 ],
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 98.0, 540.0, 74.0, 22.0 ],
					"text" : "alea.markov"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato",
					"fontsize" : 18.0,
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 140.5, 505.0, 254.0, 28.0 ],
					"text" : "Markov chains and matrix tools"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.156862745098039, 0.8, 0.549019607843137, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 269.0, 420.0, 80.0, 22.0 ],
					"text" : "alea.bernoulli"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 388.0, 367.0, 85.0, 22.0 ],
					"text" : "alea.vonmises"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.156862745098039, 0.8, 0.549019607843137, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 430.0, 420.0, 79.0, 22.0 ],
					"text" : "alea.mchoice"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 32.0, 367.0, 69.0, 22.0 ],
					"text" : "alea.pareto"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 413.75, 311.0, 53.0, 22.0 ],
					"text" : "alea.circ"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 110.0, 367.0, 76.0, 22.0 ],
					"text" : "alea.poisson"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.75, 311.0, 67.0, 22.0 ],
					"text" : "alea.arcsin"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 159.75, 311.0, 58.0, 22.0 ],
					"text" : "alea.beta"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 312.75, 311.0, 92.0, 22.0 ],
					"text" : "alea.cauchypos"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 376.0, 339.0, 73.0, 22.0 ],
					"text" : "alea.laplace"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 229.75, 311.0, 73.0, 22.0 ],
					"text" : "alea.cauchy"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 116.0, 339.0, 75.0, 22.0 ],
					"text" : "alea.gamma"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 209.0, 339.0, 67.0, 22.0 ],
					"text" : "alea.gauss"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 41.0, 339.0, 54.0, 22.0 ],
					"text" : "alea.exp"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 289.0, 339.0, 83.0, 22.0 ],
					"text" : "alea.hypercos"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 459.0, 339.0, 47.0, 22.0 ],
					"text" : "alea.lin"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 515.0, 339.0, 51.0, 22.0 ],
					"text" : "alea.log"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 191.0, 367.0, 52.0, 22.0 ],
					"text" : "alea.ran"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 251.0, 367.0, 65.0, 22.0 ],
					"text" : "alea.rancd"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.0, 367.0, 50.5, 22.0 ],
					"text" : "alea.tri"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 484.0, 367.0, 71.0, 22.0 ],
					"text" : "alea.weibull"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.156862745098039, 0.8, 0.549019607843137, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 106.5, 420.0, 71.5, 22.0 ],
					"text" : "alea.walker"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.156862745098039, 0.8, 0.549019607843137, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 189.5, 420.0, 73.0, 22.0 ],
					"text" : "alea.interval"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.156862745098039, 0.8, 0.549019607843137, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 356.0, 420.0, 69.0, 22.0 ],
					"text" : "alea.choice"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.156862745098039, 0.8, 0.549019607843137, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 420.0, 77.0, 22.0 ],
					"text" : "alea.brownie"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.156862745098039, 0.8, 0.549019607843137, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 521.0, 420.0, 81.0, 22.0 ],
					"text" : "alea.oneoverf"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato",
					"fontsize" : 18.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 106.0, 282.0, 347.0, 28.0 ],
					"text" : "Externals for creating random distributions"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.611764705882353, 0.701960784313725, 1.0, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 318.0, 473.0, 75.0, 22.0 ],
					"text" : "alea.mapper"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.611764705882353, 0.701960784313725, 1.0, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 131.0, 473.0, 85.0, 22.0 ],
					"text" : "alea.bendover"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.611764705882353, 0.701960784313725, 1.0, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 233.0, 473.0, 69.0, 22.0 ],
					"text" : "alea.border"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato",
					"fontsize" : 18.0,
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 101.75, 444.0, 329.0, 28.0 ],
					"text" : "Some utilities for filtering and controlling"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato",
					"fontsize" : 18.0,
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 132.5, 391.0, 294.0, 28.0 ],
					"text" : "Random walks, a choice and a noise"
				}

			}
, 			{
				"box" : 				{
					"handoff" : "",
					"id" : "obj-28",
					"maxclass" : "ubutton",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 79.0, 47.0, 408.0, 179.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 632.0, 282.0, 45.0, 19.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 6,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 77.0, 87.0, 463.0, 328.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"hidden" : 1,
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 430.0, 26.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 6.0, 21.0, 417.0, 74.0 ],
									"text" : "This was the first version of MaxAlea. It has been designed to be a coherent collection of several stochastic models. Also included in this package are objects designed to control these processes as well as those that go beyond the basic distributions. Try one of the examples below. There are other objects and examples planned for a later version of this package..."
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.290196078431373, 0.611764705882353, 0.380392156862745, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 6,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 609.0, 87.0, 768.0, 624.0 ],
										"bglocked" : 0,
										"openinpresentation" : 1,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"assistshowspatchername" : 0,
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-58",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 325.0, 501.0, 208.0, 20.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 367.0, 344.0, 208.0, 20.0 ],
													"text" : "go into edit mode to see the full patch"
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Arial",
													"fontsize" : 14.0,
													"id" : "obj-55",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 175.0, 19.0, 706.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 5.0, 14.0, 706.0, 22.0 ],
													"text" : "Secect your input and output MIDI sources. Use the presets to play around with a gaussian delay system"
												}

											}
, 											{
												"box" : 												{
													"fontface" : 0,
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-54",
													"items" : [ "AU DLS Synth 1", ",", "IAC Driver Bus 1", ",", "IAC Driver Bus 2", ",", "IAC Driver fred 3", ",", "SL STUDIO Port 1", ",", "SL STUDIO Port 2", ",", "FS-1-WL Bluetooth", ",", "from Max 1", ",", "from Max 2" ],
													"maxclass" : "umenu",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 617.0, 208.5, 158.0, 23.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 517.0, 191.5, 158.0, 23.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontface" : 0,
													"fontname" : "Arial",
													"fontsize" : 13.0,
													"id" : "obj-53",
													"items" : [ "IAC Driver Bus 1", ",", "IAC Driver Bus 2", ",", "IAC Driver fred 3", ",", "SL STUDIO Port 1", ",", "SL STUDIO Port 2", ",", "FS-1-WL Bluetooth", ",", "Vienna Instruments MIDI", ",", "to Max 1", ",", "to Max 2" ],
													"maxclass" : "umenu",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 361.0, 208.5, 158.0, 23.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 352.75, 191.5, 158.0, 23.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-52",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 526.5, 145.0, 29.5, 22.0 ],
													"text" : "1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-50",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 595.0, 166.0, 50.0, 22.0 ],
													"text" : "midiinfo"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-49",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 608.5, 125.0, 93.0, 20.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 535.0, 173.5, 71.0, 20.0 ],
													"text" : "MIDI output"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-1",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 392.0, 42.0, 93.0, 20.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 471.0, 87.0, 93.0, 20.0 ],
													"text" : "Gauss Example"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-2",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 392.0, 61.0, 103.0, 20.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 566.0, 87.0, 103.0, 20.0 ],
													"text" : "© 1996, Carl Faia"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-3",
													"linecount" : 5,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 431.0, 355.0, 127.0, 74.0 ],
													"presentation" : 1,
													"presentation_linecount" : 4,
													"presentation_rect" : [ 501.0, 262.0, 167.0, 60.0 ],
													"text" : "Try running poisson example patch preset #1 or 2 while Gauss Example is open on preset #3..."
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 517.0, 255.0, 39.0, 22.0 ],
													"text" : "+ 200"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 583.0, 266.0, 55.0, 22.0 ],
													"text" : "pipe 300"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 2,
													"outlettype" : [ "float", "float" ],
													"patching_rect" : [ 553.0, 299.0, 61.0, 22.0 ],
													"text" : "makenote"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 511.0, 275.0, 55.0, 22.0 ],
													"text" : "pipe 435"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-8",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 417.0, 97.5, 29.5, 22.0 ],
													"text" : "1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-9",
													"maxclass" : "preset",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "preset", "int", "preset", "int", "" ],
													"patching_rect" : [ 417.0, 125.0, 17.0, 19.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 417.0, 125.0, 17.0, 19.0 ],
													"preset_data" : [ 														{
															"number" : 1,
															"data" : [ 5, "obj-46", "number", "int", 0, 5, "obj-43", "number", "float", 0.0, 5, "obj-32", "number", "float", 0.0, 5, "obj-31", "number", "float", 0.0, 5, "obj-30", "number", "float", 0.0, 5, "obj-29", "number", "float", 0.0, 5, "obj-28", "number", "float", 0.0, 5, "obj-27", "number", "float", 0.0, 5, "obj-25", "number", "int", 0, 5, "obj-24", "number", "float", 0.0, 5, "obj-19", "number", "int", 0, 5, "obj-18", "number", "int", 0, 5, "<invalid>", "umenu", "int", 0 ]
														}
 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-10",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 151.0, 151.0, 83.0, 20.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 151.0, 151.0, 83.0, 20.0 ],
													"text" : "controls delay"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 305.0, 344.0, 94.0, 20.0 ],
													"text" : "controls velocity"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-12",
													"linecount" : 2,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 14.0, 450.0, 542.0, 33.0 ],
													"presentation" : 1,
													"presentation_linecount" : 5,
													"presentation_rect" : [ 278.0, 255.0, 211.0, 74.0 ],
													"text" : "Try the different presets while playing something through midi. Each of the presets use different parameters and patch combinations for using this random distribution"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-13",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 411.5, 166.0, 64.0, 22.0 ],
													"text" : "controllers"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 361.0, 166.0, 50.0, 22.0 ],
													"text" : "midiinfo"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-16",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 571.0, 86.0, 58.0, 22.0 ],
													"text" : "loadbang"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-17",
													"maxclass" : "preset",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "preset", "int", "preset", "int", "" ],
													"patching_rect" : [ 254.0, 136.0, 67.0, 17.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 254.0, 136.0, 67.0, 17.0 ],
													"preset_data" : [ 														{
															"number" : 1,
															"data" : [ 5, "obj-43", "number", "float", 0.0, 5, "obj-32", "number", "float", -3.0, 5, "obj-31", "number", "float", 3.0, 5, "obj-30", "number", "float", 190.0, 5, "obj-29", "number", "float", 2000.0, 5, "obj-28", "number", "float", 0.0, 5, "obj-27", "number", "float", 0.0, 5, "obj-25", "number", "int", 0, 5, "obj-24", "number", "float", 1.0, 5, "obj-19", "number", "int", 0, 5, "obj-18", "number", "int", 500, 5, "obj-46", "number", "int", 1500, 5, "<invalid>", "umenu", "int", 0 ]
														}
, 														{
															"number" : 2,
															"data" : [ 5, "obj-43", "number", "float", 0.0, 5, "obj-32", "number", "float", -3.0, 5, "obj-31", "number", "float", 3.0, 5, "obj-30", "number", "float", 190.0, 5, "obj-29", "number", "float", 2000.0, 5, "obj-28", "number", "float", 0.0, 5, "obj-27", "number", "float", 0.0, 5, "obj-25", "number", "int", 1, 5, "obj-24", "number", "float", 1.0, 5, "obj-19", "number", "int", 0, 5, "obj-18", "number", "int", 500, 5, "obj-46", "number", "int", 1500, 5, "<invalid>", "umenu", "int", 0 ]
														}
, 														{
															"number" : 3,
															"data" : [ 5, "obj-43", "number", "float", 0.0, 5, "obj-32", "number", "float", -22.0, 5, "obj-31", "number", "float", 22.0, 5, "obj-30", "number", "float", 100.0, 5, "obj-29", "number", "float", 3000.0, 5, "obj-28", "number", "float", 0.0, 5, "obj-27", "number", "float", 0.0, 5, "obj-25", "number", "int", 1, 5, "obj-24", "number", "float", 7.110000133514404, 5, "obj-19", "number", "int", 0, 5, "obj-18", "number", "int", 500, 5, "obj-46", "number", "int", 1500, 5, "<invalid>", "umenu", "int", 0 ]
														}
, 														{
															"number" : 4,
															"data" : [ 5, "obj-43", "number", "float", 19.0, 5, "obj-32", "number", "float", -3.0, 5, "obj-31", "number", "float", 3.0, 5, "obj-30", "number", "float", 190.0, 5, "obj-29", "number", "float", 2000.0, 5, "obj-28", "number", "float", 0.0, 5, "obj-27", "number", "float", 0.0, 5, "obj-25", "number", "int", 0, 5, "obj-24", "number", "float", 1.0, 5, "obj-19", "number", "int", 0, 5, "obj-18", "number", "int", 500, 5, "obj-46", "number", "int", 1500, 5, "<invalid>", "umenu", "int", 0 ]
														}
, 														{
															"number" : 5,
															"data" : [ 5, "obj-43", "number", "float", -33.0, 5, "obj-32", "number", "float", -100.0, 5, "obj-31", "number", "float", 40.0, 5, "obj-30", "number", "float", 733.0, 5, "obj-29", "number", "float", 2000.0, 5, "obj-28", "number", "float", 0.0, 5, "obj-27", "number", "float", 0.0, 5, "obj-25", "number", "int", 1, 5, "obj-24", "number", "float", 33.0, 5, "obj-19", "number", "int", 0, 5, "obj-18", "number", "int", 500, 5, "obj-46", "number", "int", 1500, 5, "<invalid>", "umenu", "int", 0 ]
														}
, 														{
															"number" : 6,
															"data" : [ 5, "obj-43", "number", "float", 0.0, 5, "obj-32", "number", "float", -3.0, 5, "obj-31", "number", "float", 3.0, 5, "obj-30", "number", "float", 190.0, 5, "obj-29", "number", "float", 2000.0, 5, "obj-28", "number", "float", 0.0, 5, "obj-27", "number", "float", 0.0, 5, "obj-25", "number", "int", 0, 5, "obj-24", "number", "float", 6.75, 5, "obj-19", "number", "int", 1, 5, "obj-18", "number", "int", 500, 5, "obj-46", "number", "int", 1500, 5, "<invalid>", "umenu", "int", 0 ]
														}
 ]
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-18",
													"maxclass" : "number",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 83.0, 344.0, 38.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-19",
													"maxclass" : "number",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 262.0, 317.0, 25.396093749999999, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 270.0, 341.0, 32.0, 22.0 ],
													"text" : "gate"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-21",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 142.0, 61.0, 174.0, 20.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 142.0, 61.0, 174.0, 20.0 ],
													"text" : "bandwidth, or level of distortion"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 290.0, 393.0, 40.0, 22.0 ],
													"text" : "* 0.15"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-23",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 270.0, 371.0, 34.0, 22.0 ],
													"text" : "sel 0"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-24",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 138.0, 77.0, 40.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 142.0, 86.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-25",
													"maxclass" : "number",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 115.0, 151.0, 25.396093749999999, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-26",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 128.0, 174.0, 32.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 128.0, 174.0, 32.0, 22.0 ],
													"text" : "gate"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-27",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 280.0, 234.0, 40.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 280.0, 234.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-28",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 204.0, 234.0, 40.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 204.0, 234.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-29",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 280.0, 173.0, 47.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 280.0, 173.0, 47.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-30",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 242.0, 173.0, 40.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 242.0, 173.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-31",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 204.0, 173.0, 40.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 204.0, 173.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-32",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 166.0, 173.0, 40.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 166.0, 173.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-33",
													"maxclass" : "newobj",
													"numinlets" : 5,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 128.0, 209.0, 171.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 128.0, 209.0, 171.0, 22.0 ],
													"text" : "alea.mapper -3 3 190 2000"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-34",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "bang" ],
													"patching_rect" : [ 52.0, 62.0, 62.0, 22.0 ],
													"text" : "bangbang"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-35",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "int", "int", "int" ],
													"patching_rect" : [ 23.0, 313.0, 41.0, 22.0 ],
													"text" : "notein"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-36",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 23.0, 344.0, 29.5, 22.0 ],
													"text" : "+ 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-37",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 23.0, 375.0, 75.0, 22.0 ],
													"text" : "pipe 0 0 500"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-38",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 130.0, 344.0, 29.5, 22.0 ],
													"text" : "+ 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-39",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 130.0, 375.0, 81.0, 22.0 ],
													"text" : "pipe 0 0 1500"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-40",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 0,
													"patching_rect" : [ 23.0, 401.0, 49.0, 22.0 ],
													"text" : "noteout"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-41",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 0,
													"patching_rect" : [ 130.0, 402.0, 49.0, 22.0 ],
													"text" : "noteout"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-42",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 255.0, 85.0, 148.0, 47.0 ],
													"presentation" : 1,
													"presentation_linecount" : 3,
													"presentation_rect" : [ 255.0, 85.0, 148.0, 47.0 ],
													"text" : "horizonal displacement, shifts the notesout up or down the scale"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-43",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 218.0, 86.0, 40.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 209.0, 86.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-44",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 58.0, 107.0, 179.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 58.0, 107.0, 179.0, 22.0 ],
													"text" : "alea.gauss 1 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-45",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 483.0, 193.0, 108.0, 20.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 362.0, 174.0, 108.0, 20.0 ],
													"text" : "Choose MIDI input"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-46",
													"maxclass" : "number",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 219.0, 340.0, 38.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-47",
													"maxclass" : "newobj",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 558.0, 232.0, 57.0, 22.0 ],
													"text" : "r poisson"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-48",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 195.0, 266.0, 49.0, 22.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 195.0, 266.0, 49.0, 22.0 ],
													"text" : "+ 1000."
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"hidden" : 1,
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-53", 0 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"hidden" : 1,
													"order" : 3,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-50", 0 ],
													"order" : 0,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-52", 0 ],
													"order" : 1,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"hidden" : 1,
													"order" : 2,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"hidden" : 1,
													"order" : 1,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"hidden" : 1,
													"order" : 6,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"hidden" : 1,
													"order" : 7,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"hidden" : 1,
													"order" : 0,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"hidden" : 1,
													"order" : 2,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"hidden" : 1,
													"order" : 4,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"hidden" : 1,
													"order" : 5,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-43", 0 ],
													"hidden" : 1,
													"order" : 3,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-37", 2 ],
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-34", 0 ],
													"midpoints" : [ 299.5, 437.0, 8.0, 437.0, 8.0, 36.0, 61.5, 36.0 ],
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"source" : [ "obj-23", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-44", 1 ],
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 4 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 3 ],
													"source" : [ "obj-30", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 2 ],
													"source" : [ "obj-31", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 1 ],
													"source" : [ "obj-32", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-27", 0 ],
													"source" : [ "obj-33", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 0 ],
													"source" : [ "obj-33", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-37", 2 ],
													"midpoints" : [ 137.5, 292.0, 191.0, 292.0, 191.0, 366.0, 88.5, 366.0 ],
													"order" : 1,
													"source" : [ "obj-33", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-48", 0 ],
													"order" : 0,
													"source" : [ "obj-33", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-44", 0 ],
													"source" : [ "obj-34", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-44", 0 ],
													"source" : [ "obj-34", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 1 ],
													"midpoints" : [ 43.5, 334.0, 292.5, 334.0 ],
													"order" : 0,
													"source" : [ "obj-35", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-34", 0 ],
													"midpoints" : [ 14.0, 331.0, 14.0, 51.0, 61.5, 51.0 ],
													"order" : 1,
													"source" : [ "obj-35", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 0 ],
													"order" : 2,
													"source" : [ "obj-35", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-37", 1 ],
													"midpoints" : [ 43.5, 335.0, 60.5, 335.0 ],
													"order" : 2,
													"source" : [ "obj-35", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-38", 0 ],
													"midpoints" : [ 32.5, 340.0, 139.5, 340.0 ],
													"order" : 0,
													"source" : [ "obj-35", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 1 ],
													"midpoints" : [ 43.5, 335.0, 170.5, 335.0 ],
													"order" : 1,
													"source" : [ "obj-35", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-37", 0 ],
													"source" : [ "obj-36", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-40", 1 ],
													"midpoints" : [ 88.5, 397.0, 47.5, 397.0 ],
													"source" : [ "obj-37", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-40", 0 ],
													"source" : [ "obj-37", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-38", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 1 ],
													"midpoints" : [ 201.5, 397.0, 154.5, 397.0 ],
													"source" : [ "obj-39", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"source" : [ "obj-39", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 1 ],
													"hidden" : 1,
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-44", 2 ],
													"source" : [ "obj-43", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 1 ],
													"midpoints" : [ 67.5, 147.0, 150.5, 147.0 ],
													"order" : 0,
													"source" : [ "obj-44", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 1 ],
													"midpoints" : [ 67.5, 300.0, 17.0, 300.0, 17.0, 335.0, 43.0, 335.0 ],
													"order" : 2,
													"source" : [ "obj-44", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-38", 1 ],
													"midpoints" : [ 67.5, 300.0, 150.0, 300.0 ],
													"order" : 1,
													"source" : [ "obj-44", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 2 ],
													"source" : [ "obj-46", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-34", 0 ],
													"hidden" : 1,
													"order" : 3,
													"source" : [ "obj-47", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"hidden" : 1,
													"order" : 2,
													"source" : [ "obj-47", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"hidden" : 1,
													"order" : 0,
													"source" : [ "obj-47", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"hidden" : 1,
													"order" : 1,
													"source" : [ "obj-47", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 2 ],
													"source" : [ "obj-48", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 2 ],
													"hidden" : 1,
													"order" : 0,
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 1 ],
													"hidden" : 1,
													"order" : 1,
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-54", 0 ],
													"source" : [ "obj-50", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"source" : [ "obj-53", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-40", 0 ],
													"order" : 1,
													"source" : [ "obj-54", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"order" : 0,
													"source" : [ "obj-54", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 0 ],
													"hidden" : 1,
													"order" : 1,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-37", 1 ],
													"hidden" : 1,
													"order" : 1,
													"source" : [ "obj-6", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-38", 0 ],
													"hidden" : 1,
													"order" : 0,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 1 ],
													"hidden" : 1,
													"order" : 0,
													"source" : [ "obj-6", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"hidden" : 1,
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"hidden" : 1,
													"source" : [ "obj-8", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 7.0, 127.0, 105.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p gauss example"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.290196078431373, 0.611764705882353, 0.380392156862745, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 6,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 832.0, 811.0, 325.0, 412.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"assistshowspatchername" : 0,
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 166.0, 89.0, 62.0, 22.0 ],
													"text" : "del 1000"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 220.0, 88.0, 65.0, 22.0 ],
													"text" : "s preset2"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 188.0, 65.0, 37.0, 22.0 ],
													"text" : "sel 2"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-4",
													"maxclass" : "number",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 66.0, 106.0, 38.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hidden" : 1,
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 19.0, 380.0, 62.0, 22.0 ],
													"text" : "s poisson"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-7",
													"maxclass" : "preset",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "preset", "int", "preset", "int", "" ],
													"patching_rect" : [ 138.0, 52.0, 30.0, 21.0 ],
													"preset_data" : [ 														{
															"number" : 1,
															"data" : [ 5, "obj-19", "number", "float", 0.0, 5, "obj-18", "number", "float", 0.0, 5, "obj-16", "toggle", "int", 0, 5, "obj-15", "number", "float", 0.0, 5, "obj-14", "number", "float", 0.0, 5, "obj-13", "number", "float", 8.0, 5, "obj-12", "number", "float", 128.0, 5, "obj-9", "number", "float", 2.200000047683716, 5, "obj-4", "number", "int", 10 ]
														}
, 														{
															"number" : 2,
															"data" : [ 5, "obj-19", "number", "float", 0.0, 5, "obj-18", "number", "float", 0.0, 5, "obj-16", "toggle", "int", 0, 5, "obj-15", "number", "float", 0.0, 5, "obj-14", "number", "float", 0.0, 5, "obj-13", "number", "float", 17.0, 5, "obj-12", "number", "float", 128.0, 5, "obj-9", "number", "float", 6.930000305175781, 5, "obj-4", "number", "int", 500 ]
														}
 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 138.0, 140.0, 55.0, 20.0 ],
													"text" : "lambda"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-9",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 103.0, 139.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"color" : [ 1.0, 0.890196078431372, 0.090196078431373, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 26.0, 173.0, 96.0, 22.0 ],
													"text" : "alea.poisson 2.2"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Times Roman",
													"fontsize" : 18.0,
													"id" : "obj-11",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 23.0, 34.0, 64.0, 24.0 ],
													"text" : "poisson"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-12",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 230.0, 204.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-13",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 128.0, 204.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-14",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 179.0, 204.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-15",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 77.0, 204.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-16",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 26.0, 106.0, 15.0, 15.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-17",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 26.0, 136.0, 64.0, 22.0 ],
													"text" : "metro 10"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-18",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 230.0, 252.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"format" : 6,
													"id" : "obj-19",
													"maxclass" : "flonum",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 128.0, 254.0, 40.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"color" : [ 0.380392156862745, 0.611764705882353, 0.611764705882353, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 5,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 26.0, 227.0, 223.0, 22.0 ],
													"text" : "alea.mapper 0 8 0 128"
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.866666666666667, 0.866666666666667, 0.866666666666667, 1.0 ],
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-21",
													"maxclass" : "number",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 26.0, 272.0, 38.0, 22.0 ],
													"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"triscale" : 0.9
												}

											}
, 											{
												"box" : 												{
													"editor_rect" : [ 314.0, 181.0, 210.0, 167.0 ],
													"embed" : 0,
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 26.0, 322.0, 38.0, 22.0 ],
													"saved_object_attributes" : 													{
														"embed" : 0,
														"name" : "",
														"parameter_enable" : 0,
														"parameter_mappable" : 0,
														"range" : 128,
														"showeditor" : 0,
														"size" : 128
													}
,
													"showeditor" : 0,
													"text" : "table"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-23",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "int", "int" ],
													"patching_rect" : [ 26.0, 298.0, 63.0, 22.0 ],
													"text" : "Histo"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-24",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 100.0, 273.0, 63.0, 22.0 ],
													"text" : "clear"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-25",
													"linecount" : 2,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 71.0, 328.0, 216.0, 33.0 ],
													"text" : "you can close or open the graphic window by typing w and o respectively"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Times Roman",
													"fontsize" : 18.0,
													"id" : "obj-26",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 22.0, 56.0, 69.0, 24.0 ],
													"text" : "example"
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"hidden" : 1,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 4 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 2 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 3 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 1 ],
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 0 ],
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"source" : [ "obj-20", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"source" : [ "obj-20", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"order" : 0,
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"hidden" : 1,
													"midpoints" : [ 16.0, 287.0, 16.0, 375.0, 28.5, 375.0 ],
													"order" : 1,
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 1 ],
													"source" : [ "obj-23", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"source" : [ "obj-23", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"midpoints" : [ 109.5, 319.0, 35.5, 319.0 ],
													"order" : 0,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"midpoints" : [ 109.5, 293.0, 35.5, 293.0 ],
													"order" : 1,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"hidden" : 1,
													"order" : 1,
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"hidden" : 1,
													"order" : 0,
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 1 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"hidden" : 1,
													"midpoints" : [ 153.0, 91.0, 16.0, 91.0, 16.0, 263.0, 35.5, 263.0 ],
													"source" : [ "obj-7", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"hidden" : 1,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 1 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 260.0, 128.0, 116.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p poisson example"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 633.0, 302.0, 42.0, 19.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p more"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"hidden" : 1,
					"id" : "obj-31",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 632.0, 263.0, 30.0, 19.0 ],
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 177.0, 587.0, 233.0, 20.0 ],
					"text" : "MaxAlea copyright © 2024, Carl Faia"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Times Roman",
					"fontsize" : 36.0,
					"id" : "obj-35",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 139.0, 3.0, 289.0, 42.0 ],
					"text" : "MaxAlea Collected"
				}

			}
, 			{
				"box" : 				{
					"autofit" : 1,
					"forceaspect" : 1,
					"id" : "obj-37",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 107.0, 49.0, 351.5, 174.616129032258073 ],
					"pic" : "/Users/carlfaia/Desktop/Brownian_motion_folder/stylized_brownian_motion_vg.jpg"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"hidden" : 1,
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"hidden" : 1,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"hidden" : 1,
					"source" : [ "obj-31", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "alea.ana.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.ana2.js",
				"bootpath" : "~/Documents/Max 8/Packages/MaxAlea/externals",
				"patcherrelativepath" : "../externals",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "alea.arcsin.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.bendover.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.bernoulli.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.beta.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.border.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.brownie.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.cauchy.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.cauchypos.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.choice.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.circ.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.exp.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.gamma.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.gauss.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.hypercos.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.interval.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.laplace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.lin.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.log.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.mapper.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.markov.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.markov2.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.mchoice.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.oneoverf.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.pareto.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.poisson.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.ran.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.rancd.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.tri.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.vonmises.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.walker.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "alea.weibull.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "stylized_brownian_motion_vg.jpg",
				"bootpath" : "~/Desktop/Brownian_motion_folder",
				"patcherrelativepath" : "../../../../../Desktop/Brownian_motion_folder",
				"type" : "JPEG",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"bgcolor" : [ 0.611764705882353, 0.603921568627451, 0.603921568627451, 1.0 ]
	}

}
