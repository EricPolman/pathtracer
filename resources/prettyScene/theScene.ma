//Maya ASCII 2014 scene
//Name: theScene.ma
//Last modified: Mon, Nov 03, 2014 11:18:46 PM
//Codeset: 1252
requires maya "2014";
currentUnit -l meter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 7 Home Premium Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.7501665738310281 8.6432917434028784 -12.494263220090323 ;
	setAttr ".r" -type "double3" 138.26164726974196 -378.59999999998456 -179.99999999999986 ;
	setAttr ".rp" -type "double3" -1.6342482922482305e-015 1.1368683772161603e-015 9.0949470177292826e-015 ;
	setAttr ".rpt" -type "double3" 7.2036557915212488e-015 5.292311635431988e-015 -1.0994224149716746e-014 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 100;
	setAttr ".coi" 17.457122442386172;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -129.03695860773479 76.102258618940198 -110.00190734863281 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.9985424200951059 100.17955118657903 -2.5760739979684719 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 100;
	setAttr ".coi" 100.10000000000001;
	setAttr ".ow" 2.6951030304487791;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.9985424200951059 1.917394758036699 100.16166897383111 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 100;
	setAttr ".coi" 100.10000000000001;
	setAttr ".ow" 2.6951030304487791;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.15308747097386 1.917394758036699 -2.5760739979684719 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.001;
	setAttr ".fcp" 100;
	setAttr ".coi" 100.10000000000001;
	setAttr ".ow" 2.6951029142691021;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pCube2";
	setAttr ".r" -type "double3" 0 -90 0 ;
	setAttr ".rp" -type "double3" 0 -0.67261695861816406 0 ;
	setAttr ".sp" -type "double3" 0 -0.67261695861816406 0 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pPlane1";
	setAttr ".t" -type "double3" 0 -0.92241196376632562 0 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape1" -p "pPlane1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
createNode transform -n "group1";
	setAttr ".t" -type "double3" -0.066100124950946915 -0.22207419499198897 0.6893903827602138 ;
	setAttr ".r" -type "double3" -110.90858971010029 51.237925829571097 235.73216144306079 ;
createNode transform -n "pPlane2";
	setAttr ".t" -type "double3" 12.818011303906633 -0.92241196376632562 0 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape2" -p "pPlane2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane3";
	setAttr ".t" -type "double3" -12.818 -0.92241196376632562 0 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape3" -p "pPlane3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane4";
	setAttr ".t" -type "double3" -12.818 -0.92241196376632562 12.701644636081806 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape4" -p "pPlane4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane5";
	setAttr ".t" -type "double3" 0 -0.92241196376632562 12.701644636081806 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape5" -p "pPlane5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane6";
	setAttr ".t" -type "double3" 12.818011303906633 -0.92241196376632562 12.701644636081806 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape6" -p "pPlane6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane7";
	setAttr ".t" -type "double3" -12.818 -0.92241196376632562 -12.772503281366101 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape7" -p "pPlane7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane8";
	setAttr ".t" -type "double3" 0 -0.92241196376632562 -12.772503281366101 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape8" -p "pPlane8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane9";
	setAttr ".t" -type "double3" 12.818011303906633 -0.92241196376632562 -12.772503281366101 ;
	setAttr ".spt" -type "double3" 0 -2.5672481822681728e-018 0 ;
createNode mesh -n "pPlaneShape9" -p "pPlane9";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  3.569412 7.9108954e-016 -3.569412 
		-3.569412 7.9108954e-016 -3.569412 3.569412 -7.9404797e-016 3.569412 -3.569412 -7.9404797e-016 
		3.569412;
	setAttr -s 4 ".vt[0:3]"  -10 -2.220446e-015 10 10 -2.220446e-015 10
		 -10 2.220446e-015 -10 10 2.220446e-015 -10;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube4";
	setAttr ".t" -type "double3" 0.0056791084998644341 -0.7697324308986836 -0.046147215975603548 ;
	setAttr ".s" -type "double3" 2.1306381853341323 2.1306381853341323 2.1306381853341323 ;
	setAttr ".rp" -type "double3" 0 2.7588713346608791 5.7910145074866072e-007 ;
	setAttr ".sp" -type "double3" 0 1.2948567962646484 2.7179718017578128e-007 ;
	setAttr ".spt" -type "double3" 0 1.4640145383962304 3.0730427057287949e-007 ;
createNode mesh -n "pCubeShape4" -p "pCube4";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 26 ".pt";
	setAttr ".pt[44]" -type "float3" 0 0.01038095 0 ;
	setAttr ".pt[45]" -type "float3" 0 0.011668716 0 ;
	setAttr ".pt[46]" -type "float3" 0 0.01038095 0 ;
	setAttr ".pt[47]" -type "float3" 0 0.011568945 0 ;
	setAttr ".pt[48]" -type "float3" 0 0.01038095 0 ;
	setAttr ".pt[49]" -type "float3" 0 0.011668716 0 ;
	setAttr ".pt[50]" -type "float3" 0 0.01038095 0 ;
	setAttr ".pt[51]" -type "float3" 0 0.011568945 0 ;
	setAttr ".pt[52]" -type "float3" 0 0.010378883 0 ;
	setAttr ".pt[53]" -type "float3" 0 0.011666644 0 ;
	setAttr ".pt[54]" -type "float3" 0 0.010378883 0 ;
	setAttr ".pt[55]" -type "float3" 0 0.011666644 0 ;
	setAttr ".pt[56]" -type "float3" 0 -0.011636146 0 ;
	setAttr ".pt[57]" -type "float3" 0 -0.010512445 0 ;
	setAttr ".pt[58]" -type "float3" 0 -0.011668723 0 ;
	setAttr ".pt[59]" -type "float3" 0 -0.010512445 0 ;
	setAttr ".pt[60]" -type "float3" 0 -0.011636146 0 ;
	setAttr ".pt[61]" -type "float3" 0 -0.010512445 0 ;
	setAttr ".pt[62]" -type "float3" 0 -0.011668723 0 ;
	setAttr ".pt[63]" -type "float3" 0 -0.010512445 0 ;
	setAttr ".pt[64]" -type "float3" 0 -0.011638193 0 ;
	setAttr ".pt[65]" -type "float3" 0 -0.010513685 0 ;
	setAttr ".pt[66]" -type "float3" 0 -0.011638193 0 ;
	setAttr ".pt[67]" -type "float3" 0 -0.010513685 0 ;
createNode transform -n "pPlane11";
	setAttr ".t" -type "double3" 0.61829473477677899 5.6655130922365622 11.946761830711848 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 179.9999999999994 ;
	setAttr ".s" -type "double3" 1.6306150239710806 0.85351470726894219 0.85351470726894219 ;
createNode mesh -n "pPlaneShape11" -p "pPlane11";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "polySurfaceShape20" -p "pPlane11";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane12";
	setAttr ".t" -type "double3" -9.8497107166527709 5.6655130922365586 10.529365863500006 ;
	setAttr ".r" -type "double3" -90 61.200000000000024 179.99999999999937 ;
	setAttr ".s" -type "double3" 1.6306150239710806 0.85351470726894219 0.85351470726894219 ;
createNode mesh -n "pPlaneShape12" -p "pPlane12";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape20" -p "pPlane12";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane13";
	setAttr ".t" -type "double3" 12.259483829061953 5.6655130922365755 5.7385055429210983 ;
	setAttr ".r" -type "double3" -269.99999999999989 -129.59999999999988 0 ;
	setAttr ".s" -type "double3" 1.6306150239710806 0.85351470726894219 0.85351470726894219 ;
createNode mesh -n "pPlaneShape13" -p "pPlane13";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape20" -p "pPlane13";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane15";
	setAttr ".t" -type "double3" 11.527260984960741 5.6655130922365506 -7.6782651770211352 ;
	setAttr ".r" -type "double3" 89.999999999999943 -50.399999999999991 -4.9897003134718515e-015 ;
	setAttr ".s" -type "double3" 1.6306150239710806 0.85351470726894219 0.85351470726894219 ;
createNode mesh -n "pPlaneShape15" -p "pPlane15";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape20" -p "pPlane15";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane16";
	setAttr ".t" -type "double3" -9.4197323492019684 5.6655130922365187 -6.0009138933964117 ;
	setAttr ".r" -type "double3" 89.999999999999972 64.799999999999855 0 ;
	setAttr ".s" -type "double3" 1.6306150239710806 0.85351470726894219 0.85351470726894219 ;
createNode mesh -n "pPlaneShape16" -p "pPlane16";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 5 ".ed[0:4]"  0 1 0 0 2 0 1 3 0 2 3 0 1 2 1;
	setAttr -s 2 -ch 6 ".fc[0:1]" -type "polyFaces" 
		f 3 0 4 -2
		mu 0 3 0 1 2
		f 3 -5 2 -4
		mu 0 3 2 1 3;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape20" -p "pPlane16";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4 ".uvst[0].uvsp[0:3]" -type "float2" 0 0 1 0 0 1 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".vt[0:3]"  -8.37398052 -1.8593972e-015 8.37398052 8.37398052 -1.8593972e-015 8.37398052
		 -8.37398052 1.8593972e-015 -8.37398052 8.37398052 1.8593972e-015 -8.37398052;
	setAttr -s 4 ".ed[0:3]"  0 1 0 0 2 0 1 3 0 2 3 0;
	setAttr -ch 4 ".fc[0]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube5";
	setAttr ".rp" -type "double3" 0.34541658888732807 1.9022642533335152 -2.17954243781185 ;
	setAttr ".sp" -type "double3" 0.34541658888732807 1.9022642533335152 -2.17954243781185 ;
createNode transform -n "transform1" -p "pCube5";
	setAttr ".v" no;
createNode mesh -n "pCubeShape5" -p "transform1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCube6";
	setAttr ".t" -type "double3" 0.24644566420588759 -0.39485746486311746 0 ;
	setAttr ".rp" -type "double3" 0.34541658888732807 1.9022642533335152 -2.17954243781185 ;
	setAttr ".sp" -type "double3" 0.34541658888732807 1.9022642533335152 -2.17954243781185 ;
createNode transform -n "transform2" -p "pCube6";
	setAttr ".v" no;
createNode mesh -n "pCubeShape6" -p "transform2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:4]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 2 ".ciog[0].cog";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0.0018230996 0.49817348
		 0.0018230996 0.0019919642 0.39789733 0.25008273 0.40511155 0.25008273 0.80118585
		 0.0019919642 0.80118585 0.49817348 0.8082217 0.49817348 0.8082217 0.0019919642 0.90357488
		 0.0019919642 0.90357488 0.49817348 0.81801945 0.50182641 0.9133727 0.50182641 0.9133727
		 0.74991715 0.81801945 0.74991715 0.9133727 0.99800789 0.81801945 0.99800789;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".vt[0:5]"  0.095416605 1.65226424 -2.13149881 0.59541661 1.65226424 -2.13149881
		 0.34541661 2.051386595 -2.13149881 0.34541661 2.051386595 -2.22758579 0.095416605 1.65226424 -2.22758579
		 0.59541661 1.65226424 -2.22758579;
	setAttr -s 9 ".ed[0:8]"  0 1 0 4 5 0 0 2 0 1 2 0 2 3 0 3 4 0 3 5 0
		 4 0 0 5 1 0;
	setAttr -s 5 -ch 18 ".fc[0:4]" -type "polyFaces" 
		f 3 0 3 -3
		mu 0 3 0 1 2
		f 3 6 -2 -6
		mu 0 3 3 4 5
		f 4 1 8 -1 -8
		mu 0 4 6 7 8 9
		f 4 -9 -7 -5 -4
		mu 0 4 10 11 12 13
		f 4 7 2 4 5
		mu 0 4 14 15 13 12;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube7";
	setAttr ".t" -type "double3" -0.25236751135980368 -0.39485746486311746 0 ;
	setAttr ".rp" -type "double3" 0.34541658888732807 1.9022642533335152 -2.17954243781185 ;
	setAttr ".sp" -type "double3" 0.34541658888732807 1.9022642533335152 -2.17954243781185 ;
createNode transform -n "transform3" -p "pCube7";
	setAttr ".v" no;
createNode mesh -n "pCubeShape7" -p "transform3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:4]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 3 ".ciog[0].cog";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0.0018230996 0.49817348
		 0.0018230996 0.0019919642 0.39789733 0.25008273 0.40511155 0.25008273 0.80118585
		 0.0019919642 0.80118585 0.49817348 0.8082217 0.49817348 0.8082217 0.0019919642 0.90357488
		 0.0019919642 0.90357488 0.49817348 0.81801945 0.50182641 0.9133727 0.50182641 0.9133727
		 0.74991715 0.81801945 0.74991715 0.9133727 0.99800789 0.81801945 0.99800789;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".vt[0:5]"  0.095416605 1.65226424 -2.13149881 0.59541661 1.65226424 -2.13149881
		 0.34541661 2.051386595 -2.13149881 0.34541661 2.051386595 -2.22758579 0.095416605 1.65226424 -2.22758579
		 0.59541661 1.65226424 -2.22758579;
	setAttr -s 9 ".ed[0:8]"  0 1 0 4 5 0 0 2 0 1 2 0 2 3 0 3 4 0 3 5 0
		 4 0 0 5 1 0;
	setAttr -s 5 -ch 18 ".fc[0:4]" -type "polyFaces" 
		f 3 0 3 -3
		mu 0 3 0 1 2
		f 3 6 -2 -6
		mu 0 3 3 4 5
		f 4 1 8 -1 -8
		mu 0 4 6 7 8 9
		f 4 -9 -7 -5 -4
		mu 0 4 10 11 12 13
		f 4 7 2 4 5
		mu 0 4 14 15 13 12;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface20";
	setAttr ".t" -type "double3" -0.36586113534940196 0.27588750616137647 1.0620203236860422 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".rp" -type "double3" 0.34245567321777343 1.654396743774414 -2.1795423889160155 ;
	setAttr ".sp" -type "double3" 0.34245567321777343 1.654396743774414 -2.1795423889160155 ;
createNode mesh -n "polySurfaceShape21" -p "polySurface20";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 7 ".pt";
	setAttr ".pt[0]" -type "float3" 9.536743e-009 -2.3841857e-009 0 ;
	setAttr ".pt[1]" -type "float3" -2.3841857e-009 -7.1525572e-009 0 ;
	setAttr ".pt[2]" -type "float3" -5.569309e-009 4.7683715e-009 0 ;
	setAttr ".pt[6]" -type "float3" -7.1525572e-009 -2.3841857e-009 0 ;
	setAttr ".pt[7]" -type "float3" 8.3446503e-009 0 0 ;
	setAttr ".pt[10]" -type "float3" 3.7252902e-011 4.7683715e-009 0 ;
createNode transform -n "pPlane17";
	setAttr ".t" -type "double3" 0.65061712822118012 2.4626661516634285 -0.60395507687477468 ;
	setAttr ".r" -type "double3" 0 -43.200000000000038 0 ;
	setAttr ".s" -type "double3" 0.046684599099304391 1 1 ;
createNode mesh -n "pPlaneShape17" -p "pPlane17";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pPlane18";
	setAttr ".rp" -type "double3" -0.65541916363934838 2.4626661516634285 -0.6039550768747749 ;
	setAttr ".sp" -type "double3" -0.65541916363934838 2.4626661516634285 -0.6039550768747749 ;
createNode mesh -n "pPlaneShape18" -p "pPlane18";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "polySurfaceShape22" -p "pPlane18";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 40 ".uvst[0].uvsp[0:39]" -type "float2" 0 0 0.81406099 0
		 0 1 0.81406099 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  0.72542268 2.4580162 -0.82220948 
		-0.43012351 2.4580162 -0.78397971 1.44054 2.4580162 -0.53907341 0.28499675 2.4580162 
		-0.50084376 1.4581951 2.4580162 -0.53196186 0.30201936 2.4580162 -0.49422646 1.4581951 
		2.4580162 -0.53196186 0.30201936 2.4580162 -0.49422646 1.4996252 2.4580162 -0.17854594 
		0.34345305 2.4580162 -0.14081064 1.4985132 2.4580162 -0.17414704 0.35849902 2.4580162 
		-0.1396917 1.4127774 2.4580162 -0.16058666 0.27276087 2.4580162 -0.12613125 1.4127774 
		2.4580162 -0.16058666 0.27276087 2.4580162 -0.12613125 -0.60157168 2.4580162 0.070371024 
		-1.7465767 2.4580162 0.10285238 -0.70722657 2.4580162 0.07869263 -1.8522317 2.4580162 
		0.1111739 -2.4759903 2.4580162 0.28520992 -3.6209955 2.4580162 0.31769109;
	setAttr -s 22 ".vt[0:21]"  -0.59812975 0 0.73474693 0.59812701 0 0.73474693
		 -0.59812713 0 -0.30991432 0.59812653 0 -0.30991432 -0.59783417 -0.024834746 -0.33611861
		 0.59783113 -0.024834746 -0.33436438 -0.59783417 -2.33728766 -0.33611861 0.59783113 -2.33728766 -0.33436438
		 0.21539703 -2.33728766 -1.54419589 1.41105866 -2.33728766 -1.54244173 0.22707428 -2.33757186 -1.55904925
		 1.3993839 -2.33700371 -1.54794681 0.34170806 -2.36632657 -1.59556508 1.51402009 -2.36612797 -1.58446264
		 0.34170806 -2.79647517 -1.59556508 1.51402009 -2.79627633 -1.58446264 2.82352686 -2.79647517 -2.15507293
		 3.99584126 -2.79627633 -2.1366868 2.9445498 -2.8319695 -2.1715064 4.1168642 -2.83177066 -2.1531198
		 4.89252329 -3.40328693 -2.43601537 6.064837456 -3.40308809 -2.41762853;
	setAttr -s 31 ".ed[0:30]"  0 1 0 0 2 0 1 3 0 2 3 1 2 4 0 3 5 0 4 5 0
		 4 6 0 5 7 0 6 7 0 6 8 0 7 9 0 8 9 0 8 10 0 9 11 0 10 11 0 10 12 0 11 13 0 12 13 0
		 12 14 0 13 15 0 14 15 0 14 16 0 15 17 0 16 17 0 16 18 0 17 19 0 18 19 1 18 20 0 19 21 0
		 20 21 0;
	setAttr -s 10 -ch 40 ".fc[0:9]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 3 5 -7 -5
		mu 0 4 4 5 6 7
		f 4 6 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 9 11 -13 -11
		mu 0 4 12 13 14 15
		f 4 12 14 -16 -14
		mu 0 4 16 17 18 19
		f 4 15 17 -19 -17
		mu 0 4 20 21 22 23
		f 4 18 20 -22 -20
		mu 0 4 24 25 26 27
		f 4 21 23 -25 -23
		mu 0 4 28 29 30 31
		f 4 24 26 -28 -26
		mu 0 4 32 33 34 35
		f 4 27 29 -31 -29
		mu 0 4 36 37 38 39;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane19";
	setAttr ".t" -type "double3" 0.65061712822118012 2.4626661516634285 -0.60395507687477468 ;
	setAttr ".r" -type "double3" 0 -43.200000000000038 0 ;
	setAttr ".s" -type "double3" 0.046684599099304391 1 1 ;
createNode transform -n "transform5" -p "pPlane19";
	setAttr ".v" no;
createNode mesh -n "pPlaneShape19" -p "transform5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:167]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 240 ".uvst[0].uvsp[0:239]" -type "float2" 0 0 0.81406099 0
		 0 1 0.81406099 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0
		 0 0.81406099 0 0.81406099 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0
		 1 0 1 1 0 1 0 0 0.81406099 0 0.81406099 1 0 1 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0
		 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1
		 1 0 1 0 0 1 0 1 1 0 1 0 0 0 0 0.81406099 0 0.81406099 1 0 1 0 0 1 0 1 1 0 1 0 0 1
		 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0
		 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 0 1 0.81406099 1 0.81406099 0 0 0 0 1
		 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1
		 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0.81406099 0 0.81406099
		 1 0 1 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 88 ".vt[0:87]"  -0.59812975 0 0.73474693 0.59812701 0 0.73474693
		 -0.59812713 0 -0.30991432 0.59812653 0 -0.30991432 -0.59783417 -0.024834746 -0.33611861
		 0.59783113 -0.024834746 -0.33436438 -0.59783417 -2.33728766 -0.33611861 0.59783113 -2.33728766 -0.33436438
		 0.21539703 -2.33728766 -1.54419589 1.41105866 -2.33728766 -1.54244173 0.22707428 -2.33757186 -1.55904925
		 1.3993839 -2.33700371 -1.54794681 0.34170806 -2.36632657 -1.59556508 1.51402009 -2.36612797 -1.58446264
		 0.34170806 -2.79647517 -1.59556508 1.51402009 -2.79627633 -1.58446264 2.82352686 -2.79647517 -2.15507293
		 3.99584389 -2.79627633 -2.1366868 2.9445498 -2.8319695 -2.1715064 4.1168642 -2.83177066 -2.1531198
		 4.8925209 -3.40328693 -2.33645773 6.064835072 -3.40308809 -2.3180716 -0.59812975 0 0.73474693
		 0.59812701 0 0.73474693 0.59812653 0 -0.30991432 -0.59812713 0 -0.30991432 0.59783113 -0.024834746 -0.33436438
		 -0.59783417 -0.024834746 -0.33611861 0.59783113 -2.33728766 -0.33436438 -0.59783417 -2.33728766 -0.33611861
		 1.41105866 -2.33728766 -1.54244173 0.21539703 -2.33728766 -1.54419589 1.3993839 -2.33700371 -1.54794681
		 0.22707428 -2.33757186 -1.55904925 1.51402009 -2.36612797 -1.58446264 0.34170806 -2.36632657 -1.59556508
		 1.51402009 -2.79627633 -1.58446264 0.34170806 -2.79647517 -1.59556508 3.99584389 -2.79627633 -2.1366868
		 2.82352686 -2.79647517 -2.15507293 4.1168642 -2.83177066 -2.1531198 2.9445498 -2.8319695 -2.1715064
		 6.064835072 -3.40308809 -2.3180716 4.8925209 -3.40328693 -2.33645773 -0.59812975 0.018820038 0.73474693
		 0.59812701 0.018820038 0.73474693 0.60052031 0.01742279 -0.31702971 -0.59573334 0.01742279 -0.31702986
		 0.60706937 -0.017496033 -0.35168931 -0.5885312 -0.017600097 -0.3534871 0.60678375 -2.32397985 -0.34766555
		 -0.5888803 -2.32397985 -0.34941977 1.41006744 -2.31846762 -1.54244173 0.21436432 -2.31846762 -1.54419589
		 1.42065096 -2.31900692 -1.55336177 0.25286284 -2.3199358 -1.56550837 1.58462799 -2.3577714 -1.60100055
		 0.41288239 -2.35822558 -1.6122241 1.56965482 -2.78295565 -1.5975014 0.39740631 -2.78316951 -1.60861862
		 4.060164928 -2.78008699 -2.14580178 2.89302158 -2.78075695 -2.16490173 4.23544121 -2.82473278 -2.1696732
		 3.063009262 -2.82489014 -2.18804407 6.18655157 -3.39728212 -2.33504796 5.01423502 -3.39748096 -2.35343409
		 -0.59812975 -0.018820038 0.73474693 -0.60052091 -0.01742279 -0.30279878 0.5957315 -0.01742279 -0.30279884
		 0.59812683 -0.018820038 0.73474693 -0.6071384 -0.032069396 -0.31874999 0.58859038 -0.032173462 -0.3170394
		 -0.60678804 -2.35059547 -0.32281739 0.58887726 -2.35059547 -0.32106322 0.21643463 -2.35610771 -1.54419589
		 1.41205227 -2.35610771 -1.54244161 0.20128326 -2.35520792 -1.55259013 1.37811673 -2.3550005 -1.54253209
		 0.27053374 -2.37442756 -1.57890594 1.44341218 -2.3744843 -1.56792486 0.28600737 -2.80978084 -1.58251154
		 1.45838535 -2.80959678 -1.57142401 2.75403237 -2.81219363 -2.14524412 3.93151999 -2.81246543 -2.12757134
		 2.82609272 -2.8390491 -2.1549685 3.99829006 -2.8388083 -2.13656616 4.77080727 -3.4090929 -2.31948161
		 5.94312382 -3.40889406 -2.30109525;
	setAttr -s 252 ".ed";
	setAttr ".ed[0:165]"  0 1 0 0 2 0 1 3 0 2 3 1 2 4 0 3 5 0 4 5 0 4 6 0 5 7 0
		 6 7 0 6 8 0 7 9 0 8 9 0 8 10 0 9 11 0 10 11 0 10 12 0 11 13 0 12 13 0 12 14 0 13 15 0
		 14 15 0 14 16 0 15 17 0 16 17 0 16 18 0 17 19 0 18 19 1 18 20 0 19 21 0 20 21 0 0 22 0
		 1 23 0 22 23 0 3 24 0 23 24 0 2 25 0 25 24 1 22 25 0 5 26 0 24 26 0 4 27 0 27 26 0
		 25 27 0 7 28 0 26 28 0 6 29 0 29 28 0 27 29 0 9 30 0 28 30 0 8 31 0 31 30 0 29 31 0
		 11 32 0 30 32 0 10 33 0 33 32 0 31 33 0 13 34 0 32 34 0 12 35 0 35 34 0 33 35 0 15 36 0
		 34 36 0 14 37 0 37 36 0 35 37 0 17 38 0 36 38 0 16 39 0 39 38 0 37 39 0 19 40 0 38 40 0
		 18 41 0 41 40 1 39 41 0 21 42 0 40 42 0 20 43 0 43 42 0 41 43 0 44 45 0 45 46 0 47 46 1
		 44 47 0 46 48 0 49 48 0 47 49 0 48 50 0 51 50 0 49 51 0 50 52 0 53 52 0 51 53 0 52 54 0
		 55 54 0 53 55 0 54 56 0 57 56 0 55 57 0 56 58 0 59 58 0 57 59 0 58 60 0 61 60 0 59 61 0
		 60 62 0 63 62 1 61 63 0 62 64 0 65 64 0 63 65 0 66 67 0 67 68 1 69 68 0 66 69 0 67 70 0
		 70 71 0 68 71 0 70 72 0 72 73 0 71 73 0 72 74 0 74 75 0 73 75 0 74 76 0 76 77 0 75 77 0
		 76 78 0 78 79 0 77 79 0 78 80 0 80 81 0 79 81 0 80 82 0 82 83 0 81 83 0 82 84 0 84 85 1
		 83 85 0 84 86 0 86 87 0 85 87 0 69 45 0 66 44 0 68 46 0 67 47 0 71 48 0 70 49 0 73 50 0
		 72 51 0 75 52 0 74 53 0 77 54 0 76 55 0 79 56 0 78 57 0 81 58 0 80 59 0 83 60 0 82 61 0
		 85 62 0 84 63 0;
	setAttr ".ed[166:251]" 87 64 0 86 65 0 45 47 1 46 49 1 48 51 1 50 53 1 52 55 1
		 54 57 1 58 57 1 58 61 1 60 63 1 62 65 1 68 66 1 71 67 1 72 71 1 74 73 1 74 77 1 78 77 1
		 80 79 1 82 81 1 84 83 1 86 85 1 69 44 1 68 45 1 44 67 1 48 68 1 47 70 1 50 71 1 70 51 1
		 75 50 1 51 74 1 54 75 1 74 55 1 79 54 1 55 78 1 58 79 1 78 59 1 83 58 1 59 82 1 85 60 1
		 61 84 1 87 62 1 65 87 1 63 86 1 25 23 1 27 24 1 29 26 1 31 28 1 33 30 1 35 32 1 37 34 1
		 39 36 1 41 38 1 43 40 1 1 2 1 3 4 1 5 6 1 7 8 1 9 10 1 11 12 1 13 14 1 15 16 1 17 18 1
		 19 20 1 0 23 1 1 24 1 2 22 1 3 26 1 4 25 1 5 28 1 6 27 1 7 30 1 8 29 1 9 32 1 10 31 1
		 11 34 1 12 33 1 13 36 1 14 35 1 15 38 1 16 37 1 17 40 1 18 39 1 19 42 1 21 43 1 20 41 1;
	setAttr -s 168 -ch 504 ".fc[0:167]" -type "polyFaces" 
		f 3 84 168 -88
		mu 0 3 80 81 83
		f 3 -169 85 -87
		mu 0 3 83 81 82
		f 3 86 169 -91
		mu 0 3 87 84 86
		f 3 -170 88 -90
		mu 0 3 86 84 85
		f 3 89 170 -94
		mu 0 3 91 88 90
		f 3 -171 91 -93
		mu 0 3 90 88 89
		f 3 92 171 -97
		mu 0 3 95 92 94
		f 3 -172 94 -96
		mu 0 3 94 92 93
		f 3 95 172 -100
		mu 0 3 99 96 98
		f 3 -173 97 -99
		mu 0 3 98 96 97
		f 3 98 173 -103
		mu 0 3 103 100 102
		f 3 -174 100 -102
		mu 0 3 102 100 101
		f 3 103 174 101
		mu 0 3 104 105 107
		f 3 -175 -105 -106
		mu 0 3 107 105 106
		f 3 104 175 -109
		mu 0 3 111 108 110
		f 3 -176 106 -108
		mu 0 3 110 108 109
		f 3 107 176 -112
		mu 0 3 115 112 114
		f 3 -177 109 -111
		mu 0 3 114 112 113
		f 3 110 177 -115
		mu 0 3 119 116 118
		f 3 -178 112 -114
		mu 0 3 118 116 117
		f 3 116 178 115
		mu 0 3 43 42 40
		f 3 -179 -118 -119
		mu 0 3 40 42 41
		f 3 120 179 119
		mu 0 3 47 46 44
		f 3 -180 -122 -117
		mu 0 3 44 46 45
		f 3 122 180 -121
		mu 0 3 48 51 49
		f 3 -181 123 -125
		mu 0 3 49 51 50
		f 3 125 181 -124
		mu 0 3 52 55 53
		f 3 -182 126 -128
		mu 0 3 53 55 54
		f 3 -127 182 -131
		mu 0 3 57 56 58
		f 3 128 129 -183
		mu 0 3 56 59 58
		f 3 131 183 -130
		mu 0 3 60 63 61
		f 3 -184 132 -134
		mu 0 3 61 63 62
		f 3 134 184 -133
		mu 0 3 64 67 65
		f 3 -185 135 -137
		mu 0 3 65 67 66
		f 3 137 185 -136
		mu 0 3 68 71 69
		f 3 -186 138 -140
		mu 0 3 69 71 70
		f 3 140 186 -139
		mu 0 3 72 75 73
		f 3 -187 141 -143
		mu 0 3 73 75 74
		f 3 143 187 -142
		mu 0 3 76 79 77
		f 3 -188 144 -146
		mu 0 3 77 79 78
		f 3 118 188 -148
		mu 0 3 0 1 80
		f 3 -189 146 -85
		mu 0 3 80 1 81
		f 3 117 189 -147
		mu 0 3 1 3 81
		f 3 -190 148 -86
		mu 0 3 81 3 82
		f 3 147 190 -116
		mu 0 3 0 80 2
		f 3 -191 87 -150
		mu 0 3 2 80 83
		f 3 150 191 121
		mu 0 3 6 85 5
		f 3 -192 -89 -149
		mu 0 3 5 85 84
		f 3 149 192 -120
		mu 0 3 4 87 7
		f 3 -193 90 -152
		mu 0 3 7 87 86
		f 3 152 193 124
		mu 0 3 10 89 9
		f 3 -194 -92 -151
		mu 0 3 9 89 88
		f 3 -123 194 -154
		mu 0 3 11 8 90
		f 3 -195 151 93
		mu 0 3 90 8 91
		f 3 127 195 -153
		mu 0 3 13 14 92
		f 3 -196 154 -95
		mu 0 3 92 14 93
		f 3 153 196 -126
		mu 0 3 12 95 15
		f 3 -197 96 -156
		mu 0 3 15 95 94
		f 3 156 197 130
		mu 0 3 18 97 17
		f 3 -198 -98 -155
		mu 0 3 17 97 96
		f 3 -129 198 -158
		mu 0 3 19 16 98
		f 3 155 99 -199
		mu 0 3 16 99 98
		f 3 133 199 -157
		mu 0 3 21 22 100
		f 3 -200 158 -101
		mu 0 3 100 22 101
		f 3 157 200 -132
		mu 0 3 20 103 23
		f 3 -201 102 -160
		mu 0 3 23 103 102
		f 3 160 201 136
		mu 0 3 26 105 25
		f 3 -202 -104 -159
		mu 0 3 25 105 104
		f 3 -135 202 -162
		mu 0 3 27 24 106
		f 3 -203 159 105
		mu 0 3 106 24 107
		f 3 139 203 -161
		mu 0 3 29 30 108
		f 3 -204 162 -107
		mu 0 3 108 30 109
		f 3 161 204 -138
		mu 0 3 28 111 31
		f 3 -205 108 -164
		mu 0 3 31 111 110
		f 3 142 205 -163
		mu 0 3 33 34 112
		f 3 -206 164 -110
		mu 0 3 112 34 113
		f 3 163 206 -141
		mu 0 3 32 115 35
		f 3 -207 111 -166
		mu 0 3 35 115 114
		f 3 145 207 -165
		mu 0 3 37 38 116
		f 3 -208 166 -113
		mu 0 3 116 38 117
		f 3 167 208 -145
		mu 0 3 39 118 38
		f 3 -209 113 -167
		mu 0 3 38 118 117
		f 3 165 209 -144
		mu 0 3 36 119 39
		f 3 -210 114 -168
		mu 0 3 39 119 118
		f 3 38 210 -34
		mu 0 3 120 123 121
		f 3 -211 37 -36
		mu 0 3 121 123 122
		f 3 43 211 -38
		mu 0 3 124 127 125
		f 3 -212 42 -41
		mu 0 3 125 127 126
		f 3 48 212 -43
		mu 0 3 128 131 129
		f 3 -213 47 -46
		mu 0 3 129 131 130
		f 3 53 213 -48
		mu 0 3 132 135 133
		f 3 -214 52 -51
		mu 0 3 133 135 134
		f 3 58 214 -53
		mu 0 3 136 139 137
		f 3 -215 57 -56
		mu 0 3 137 139 138
		f 3 63 215 -58
		mu 0 3 140 143 141
		f 3 -216 62 -61
		mu 0 3 141 143 142
		f 3 68 216 -63
		mu 0 3 144 147 145
		f 3 -217 67 -66
		mu 0 3 145 147 146
		f 3 73 217 -68
		mu 0 3 148 151 149
		f 3 -218 72 -71
		mu 0 3 149 151 150
		f 3 78 218 -73
		mu 0 3 152 155 153
		f 3 -219 77 -76
		mu 0 3 153 155 154
		f 3 83 219 -78
		mu 0 3 156 159 157
		f 3 -220 82 -81
		mu 0 3 157 159 158
		f 3 0 220 -2
		mu 0 3 160 163 161
		f 3 -221 2 -4
		mu 0 3 161 163 162
		f 3 3 221 -5
		mu 0 3 164 167 165
		f 3 -222 5 -7
		mu 0 3 165 167 166
		f 3 6 222 -8
		mu 0 3 168 171 169
		f 3 -223 8 -10
		mu 0 3 169 171 170
		f 3 9 223 -11
		mu 0 3 172 175 173
		f 3 -224 11 -13
		mu 0 3 173 175 174
		f 3 12 224 -14
		mu 0 3 176 179 177
		f 3 -225 14 -16
		mu 0 3 177 179 178
		f 3 15 225 -17
		mu 0 3 180 183 181
		f 3 -226 17 -19
		mu 0 3 181 183 182
		f 3 18 226 -20
		mu 0 3 184 187 185
		f 3 -227 20 -22
		mu 0 3 185 187 186
		f 3 21 227 -23
		mu 0 3 188 191 189
		f 3 -228 23 -25
		mu 0 3 189 191 190
		f 3 24 228 -26
		mu 0 3 192 195 193
		f 3 -229 26 -28
		mu 0 3 193 195 194
		f 3 27 229 -29
		mu 0 3 196 199 197
		f 3 -230 29 -31
		mu 0 3 197 199 198
		f 3 -1 230 -33
		mu 0 3 201 200 121
		f 3 31 33 -231
		mu 0 3 200 120 121
		f 3 -3 231 -35
		mu 0 3 202 201 122
		f 3 32 35 -232
		mu 0 3 201 121 122
		f 3 1 232 -32
		mu 0 3 200 203 120
		f 3 36 -39 -233
		mu 0 3 203 123 120
		f 3 -6 233 -40
		mu 0 3 205 204 126
		f 3 34 40 -234
		mu 0 3 204 125 126
		f 3 4 234 -37
		mu 0 3 207 206 124
		f 3 41 -44 -235
		mu 0 3 206 127 124
		f 3 -9 235 -45
		mu 0 3 209 208 130
		f 3 39 45 -236
		mu 0 3 208 129 130
		f 3 7 236 -42
		mu 0 3 211 210 128
		f 3 46 -49 -237
		mu 0 3 210 131 128
		f 3 -12 237 -50
		mu 0 3 213 212 134
		f 3 44 50 -238
		mu 0 3 212 133 134
		f 3 10 238 -47
		mu 0 3 215 214 132
		f 3 51 -54 -239
		mu 0 3 214 135 132
		f 3 -15 239 -55
		mu 0 3 217 216 138
		f 3 49 55 -240
		mu 0 3 216 137 138
		f 3 13 240 -52
		mu 0 3 219 218 136
		f 3 56 -59 -241
		mu 0 3 218 139 136
		f 3 -18 241 -60
		mu 0 3 221 220 142
		f 3 54 60 -242
		mu 0 3 220 141 142
		f 3 16 242 -57
		mu 0 3 223 222 140
		f 3 61 -64 -243
		mu 0 3 222 143 140
		f 3 -21 243 -65
		mu 0 3 225 224 146
		f 3 59 65 -244
		mu 0 3 224 145 146
		f 3 19 244 -62
		mu 0 3 227 226 144
		f 3 66 -69 -245
		mu 0 3 226 147 144
		f 3 -24 245 -70
		mu 0 3 229 228 150
		f 3 64 70 -246
		mu 0 3 228 149 150
		f 3 22 246 -67
		mu 0 3 231 230 148
		f 3 71 -74 -247
		mu 0 3 230 151 148
		f 3 -27 247 -75
		mu 0 3 233 232 154
		f 3 69 75 -248
		mu 0 3 232 153 154
		f 3 25 248 -72
		mu 0 3 235 234 152
		f 3 76 -79 -249
		mu 0 3 234 155 152
		f 3 -30 249 -80
		mu 0 3 237 236 158
		f 3 74 80 -250
		mu 0 3 236 157 158
		f 3 30 250 -82
		mu 0 3 238 237 159
		f 3 79 -83 -251
		mu 0 3 237 158 159
		f 3 28 251 -77
		mu 0 3 239 238 156
		f 3 81 -84 -252
		mu 0 3 238 159 156;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pPlane20";
	setAttr ".rp" -type "double3" -0.65541916363934838 2.4626661516634285 -0.6039550768747749 ;
	setAttr ".sp" -type "double3" -0.65541916363934838 2.4626661516634285 -0.6039550768747749 ;
createNode mesh -n "polySurfaceShape22" -p "pPlane20";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 40 ".uvst[0].uvsp[0:39]" -type "float2" 0 0 0.81406099 0
		 0 1 0.81406099 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 22 ".pt[0:21]" -type "float3"  0.72542268 2.4580162 -0.82220948 
		-0.43012351 2.4580162 -0.78397971 1.44054 2.4580162 -0.53907341 0.28499675 2.4580162 
		-0.50084376 1.4581951 2.4580162 -0.53196186 0.30201936 2.4580162 -0.49422646 1.4581951 
		2.4580162 -0.53196186 0.30201936 2.4580162 -0.49422646 1.4996252 2.4580162 -0.17854594 
		0.34345305 2.4580162 -0.14081064 1.4985132 2.4580162 -0.17414704 0.35849902 2.4580162 
		-0.1396917 1.4127774 2.4580162 -0.16058666 0.27276087 2.4580162 -0.12613125 1.4127774 
		2.4580162 -0.16058666 0.27276087 2.4580162 -0.12613125 -0.60157168 2.4580162 0.070371024 
		-1.7465767 2.4580162 0.10285238 -0.70722657 2.4580162 0.07869263 -1.8522317 2.4580162 
		0.1111739 -2.4759903 2.4580162 0.28520992 -3.6209955 2.4580162 0.31769109;
	setAttr -s 22 ".vt[0:21]"  -0.59812975 0 0.73474693 0.59812701 0 0.73474693
		 -0.59812713 0 -0.30991432 0.59812653 0 -0.30991432 -0.59783417 -0.024834746 -0.33611861
		 0.59783113 -0.024834746 -0.33436438 -0.59783417 -2.33728766 -0.33611861 0.59783113 -2.33728766 -0.33436438
		 0.21539703 -2.33728766 -1.54419589 1.41105866 -2.33728766 -1.54244173 0.22707428 -2.33757186 -1.55904925
		 1.3993839 -2.33700371 -1.54794681 0.34170806 -2.36632657 -1.59556508 1.51402009 -2.36612797 -1.58446264
		 0.34170806 -2.79647517 -1.59556508 1.51402009 -2.79627633 -1.58446264 2.82352686 -2.79647517 -2.15507293
		 3.99584126 -2.79627633 -2.1366868 2.9445498 -2.8319695 -2.1715064 4.1168642 -2.83177066 -2.1531198
		 4.89252329 -3.40328693 -2.43601537 6.064837456 -3.40308809 -2.41762853;
	setAttr -s 31 ".ed[0:30]"  0 1 0 0 2 0 1 3 0 2 3 1 2 4 0 3 5 0 4 5 0
		 4 6 0 5 7 0 6 7 0 6 8 0 7 9 0 8 9 0 8 10 0 9 11 0 10 11 0 10 12 0 11 13 0 12 13 0
		 12 14 0 13 15 0 14 15 0 14 16 0 15 17 0 16 17 0 16 18 0 17 19 0 18 19 1 18 20 0 19 21 0
		 20 21 0;
	setAttr -s 10 -ch 40 ".fc[0:9]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 3 5 -7 -5
		mu 0 4 4 5 6 7
		f 4 6 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 9 11 -13 -11
		mu 0 4 12 13 14 15
		f 4 12 14 -16 -14
		mu 0 4 16 17 18 19
		f 4 15 17 -19 -17
		mu 0 4 20 21 22 23
		f 4 18 20 -22 -20
		mu 0 4 24 25 26 27
		f 4 21 23 -25 -23
		mu 0 4 28 29 30 31
		f 4 24 26 -28 -26
		mu 0 4 32 33 34 35
		f 4 27 29 -31 -29
		mu 0 4 36 37 38 39;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "transform4" -p "pPlane20";
	setAttr ".v" no;
createNode mesh -n "pPlaneShape20" -p "transform4";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:167]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 240 ".uvst[0].uvsp[0:239]" -type "float2" 0 0 0.81406099 0
		 0 1 0.81406099 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0
		 0 0.81406099 0 0.81406099 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0
		 1 0 1 1 0 1 0 0 0.81406099 0 0.81406099 1 0 1 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0
		 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1
		 1 0 1 0 0 1 0 1 1 0 1 0 0 0 0 0 1 0.81406099 1 0.81406099 0 0 0 0 1 1 1 1 0 0 0 0
		 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1
		 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0.81406099 0 0.81406099 1 0 1 0 0 1 0
		 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1
		 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 0.81406099 0 0.81406099
		 1 0 1 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1
		 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 88 ".vt[0:87]"  -0.13209498 2.46266627 -0.087462537 -0.1728055 2.46266627 -0.049232788
		 -0.84721488 2.46266627 -0.84898776 -0.88792533 2.46266627 -0.81075805 -0.86516291 2.4378314 -0.86808044
		 -0.90465248 2.4378314 -0.82859087 -0.86516291 0.12537836 -0.86808044 -0.90465248 0.12537836 -0.82859087
		 -1.71982431 0.12537836 -1.72274184 -1.75931382 0.12537836 -1.68325245 -1.7303896 0.12509423 -1.73319626
		 -1.76268494 0.12566248 -1.68763852 -1.7592876 0.096339509 -1.75615168 -1.79158306 0.096538179 -1.71059382
		 -1.7592876 -0.33380914 -1.75615168 -1.79158306 -0.33361015 -1.71059382 -2.22675729 -0.33380914 -2.084701777
		 -2.25406671 -0.33361015 -2.033834457 -2.24212551 -0.36930352 -2.09281373 -2.26943469 -0.36910453 -2.041945934
		 -2.42133522 -0.94062096 -2.15080547 -2.44864416 -0.940422 -2.099937439 -0.13209498 2.46266627 -0.087462537
		 -0.1728055 2.46266627 -0.049232788 -0.88792533 2.46266627 -0.81075805 -0.84721488 2.46266627 -0.84898776
		 -0.90465248 2.4378314 -0.82859087 -0.86516291 2.4378314 -0.86808044 -0.90465248 0.12537836 -0.82859087
		 -0.86516291 0.12537836 -0.86808044 -1.75931382 0.12537836 -1.68325245 -1.71982431 0.12537836 -1.72274184
		 -1.76268494 0.12566248 -1.68763852 -1.7303896 0.12509423 -1.73319626 -1.79158306 0.096538179 -1.71059382
		 -1.7592876 0.096339509 -1.75615168 -1.79158306 -0.33361015 -1.71059382 -1.7592876 -0.33380914 -1.75615168
		 -2.25406671 -0.33361015 -2.033834457 -2.22675729 -0.33380914 -2.084701777 -2.26943469 -0.36910453 -2.041945934
		 -2.24212551 -0.36930352 -2.09281373 -2.44864416 -0.940422 -2.099937439 -2.42133522 -0.94062096 -2.15080547
		 -0.13209498 2.48148632 -0.087462537 -0.85216731 2.48008895 -0.8540982 -0.89287776 2.48008895 -0.81586844
		 -0.1728055 2.48148632 -0.049232785 -0.87736917 2.44506598 -0.88044429 -0.91682673 2.44517016 -0.84092492
		 -0.87457293 0.13868617 -0.87749046 -0.9140625 0.13868617 -0.83800089 -1.71978915 0.14419837 -1.72277498
		 -1.75928009 0.14419837 -1.68328416 -1.73568881 0.14273019 -1.73708057 -1.76711547 0.14365935 -1.69090617
		 -1.77311373 0.10444055 -1.76602113 -1.80530703 0.10489464 -1.72039294 -1.77011883 -0.32050359 -1.76388729
		 -1.80240202 -0.32028946 -1.71832073 -2.23585057 -0.31809089 -2.089645863 -2.26249552 -0.31742087 -2.038423538
		 -2.25747752 -0.36222413 -2.10108352 -2.28480172 -0.36206672 -2.050223589 -2.43709874 -0.93481499 -2.15929079
		 -2.46440768 -0.93461603 -2.10842276 -0.13209498 2.44384623 -0.087462537 -0.1728055 2.44384623 -0.049232788
		 -0.88297302 2.44524336 -0.80564761 -0.84226251 2.44524336 -0.84387726 -0.89247835 2.43049264 -0.81625676
		 -0.85295671 2.43059683 -0.85571665 -0.89524245 0.11207056 -0.81918085 -0.85575289 0.11207056 -0.85867041
		 -1.75934756 0.10655835 -1.68322062 -1.7198596 0.10655835 -1.7227087 -1.75825441 0.10766561 -1.68437088
		 -1.72509038 0.10745829 -1.72931194 -1.77785921 0.088181727 -1.70079482 -1.74546146 0.08823847 -1.74628234
		 -1.7807641 -0.34693086 -1.70286703 -1.74845624 -0.34711468 -1.74841619 -2.24563813 -0.34979945 -2.029245377
		 -2.217664 -0.34952736 -2.079757929 -2.25406766 -0.37614238 -2.03366828 -2.22677326 -0.37638292 -2.084543943
		 -2.43288088 -0.94622797 -2.091451883 -2.40557194 -0.94642693 -2.14231968;
	setAttr -s 252 ".ed";
	setAttr ".ed[0:165]"  0 1 0 0 2 0 1 3 0 2 3 1 2 4 0 3 5 0 4 5 0 4 6 0 5 7 0
		 6 7 0 6 8 0 7 9 0 8 9 0 8 10 0 9 11 0 10 11 0 10 12 0 11 13 0 12 13 0 12 14 0 13 15 0
		 14 15 0 14 16 0 15 17 0 16 17 0 16 18 0 17 19 0 18 19 1 18 20 0 19 21 0 20 21 0 0 22 0
		 1 23 0 22 23 0 3 24 0 23 24 0 2 25 0 25 24 1 22 25 0 5 26 0 24 26 0 4 27 0 27 26 0
		 25 27 0 7 28 0 26 28 0 6 29 0 29 28 0 27 29 0 9 30 0 28 30 0 8 31 0 31 30 0 29 31 0
		 11 32 0 30 32 0 10 33 0 33 32 0 31 33 0 13 34 0 32 34 0 12 35 0 35 34 0 33 35 0 15 36 0
		 34 36 0 14 37 0 37 36 0 35 37 0 17 38 0 36 38 0 16 39 0 39 38 0 37 39 0 19 40 0 38 40 0
		 18 41 0 41 40 1 39 41 0 21 42 0 40 42 0 20 43 0 43 42 0 41 43 0 44 45 0 45 46 1 47 46 0
		 44 47 0 45 48 0 48 49 0 46 49 0 48 50 0 50 51 0 49 51 0 50 52 0 52 53 0 51 53 0 52 54 0
		 54 55 0 53 55 0 54 56 0 56 57 0 55 57 0 56 58 0 58 59 0 57 59 0 58 60 0 60 61 0 59 61 0
		 60 62 0 62 63 1 61 63 0 62 64 0 64 65 0 63 65 0 66 67 0 67 68 0 69 68 1 66 69 0 68 70 0
		 71 70 0 69 71 0 70 72 0 73 72 0 71 73 0 72 74 0 75 74 0 73 75 0 74 76 0 77 76 0 75 77 0
		 76 78 0 79 78 0 77 79 0 78 80 0 81 80 0 79 81 0 80 82 0 83 82 0 81 83 0 82 84 0 85 84 1
		 83 85 0 84 86 0 87 86 0 85 87 0 66 44 0 67 47 0 68 46 0 69 45 0 70 49 0 71 48 0 72 51 0
		 73 50 0 74 53 0 75 52 0 76 55 0 77 54 0 78 57 0 79 56 0 80 59 0 81 58 0 82 61 0 83 60 0
		 84 63 0 85 62 0;
	setAttr ".ed[166:251]" 86 65 0 87 64 0 45 47 1 49 45 1 50 49 1 52 51 1 55 52 1
		 57 54 1 59 56 1 61 58 1 63 60 1 64 63 1 67 69 1 70 69 1 70 73 1 72 75 1 76 75 1 78 77 1
		 78 81 1 82 81 1 82 85 1 84 87 1 44 67 1 47 68 1 44 69 1 49 68 1 45 71 1 51 70 1 50 71 1
		 51 74 1 50 75 1 53 76 1 52 77 1 55 78 1 54 79 1 59 78 1 58 79 1 59 82 1 58 83 1 63 82 1
		 62 83 1 65 84 1 65 87 1 64 85 1 23 25 1 26 25 1 26 29 1 28 31 1 32 31 1 34 33 1 36 35 1
		 38 37 1 38 41 1 40 43 1 2 1 1 5 2 1 6 5 1 8 7 1 11 8 1 13 10 1 15 12 1 17 14 1 18 17 1
		 20 19 1 0 23 1 1 24 1 2 22 1 3 26 1 4 25 1 5 28 1 6 27 1 7 30 1 8 29 1 9 32 1 10 31 1
		 11 34 1 12 33 1 13 36 1 14 35 1 15 38 1 16 37 1 17 40 1 18 39 1 19 42 1 21 43 1 20 41 1;
	setAttr -s 168 -ch 504 ".fc[0:167]" -type "polyFaces" 
		f 3 84 168 -88
		mu 0 3 80 83 81
		f 3 -169 85 -87
		mu 0 3 81 83 82
		f 3 89 169 88
		mu 0 3 86 85 87
		f 3 -170 -91 -86
		mu 0 3 87 85 84
		f 3 91 170 -90
		mu 0 3 91 90 88
		f 3 -171 92 -94
		mu 0 3 88 90 89
		f 3 94 171 -93
		mu 0 3 95 94 92
		f 3 -172 95 -97
		mu 0 3 92 94 93
		f 3 98 172 97
		mu 0 3 98 97 99
		f 3 -173 -100 -96
		mu 0 3 99 97 96
		f 3 101 173 100
		mu 0 3 102 101 103
		f 3 -174 -103 -99
		mu 0 3 103 101 100
		f 3 104 174 103
		mu 0 3 106 105 107
		f 3 -175 -106 -102
		mu 0 3 107 105 104
		f 3 107 175 106
		mu 0 3 110 109 111
		f 3 -176 -109 -105
		mu 0 3 111 109 108
		f 3 110 176 109
		mu 0 3 114 113 115
		f 3 -177 -112 -108
		mu 0 3 115 113 112
		f 3 112 177 -111
		mu 0 3 119 118 116
		f 3 -178 113 -115
		mu 0 3 116 118 117
		f 3 115 178 -119
		mu 0 3 40 41 43
		f 3 -179 116 -118
		mu 0 3 43 41 42
		f 3 119 179 117
		mu 0 3 45 46 44
		f 3 -180 -121 -122
		mu 0 3 44 46 47
		f 3 120 180 -125
		mu 0 3 48 49 51
		f 3 -181 122 -124
		mu 0 3 51 49 50
		f 3 123 181 -128
		mu 0 3 52 53 55
		f 3 -182 125 -127
		mu 0 3 55 53 54
		f 3 128 182 126
		mu 0 3 57 58 56
		f 3 -183 -130 -131
		mu 0 3 56 58 59
		f 3 131 183 129
		mu 0 3 61 62 60
		f 3 -184 -133 -134
		mu 0 3 60 62 63
		f 3 132 184 -137
		mu 0 3 64 65 67
		f 3 -185 134 -136
		mu 0 3 67 65 66
		f 3 137 185 135
		mu 0 3 69 70 68
		f 3 -186 -139 -140
		mu 0 3 68 70 71
		f 3 138 186 -143
		mu 0 3 72 73 75
		f 3 -187 140 -142
		mu 0 3 75 73 74
		f 3 141 187 -146
		mu 0 3 76 77 79
		f 3 -188 143 -145
		mu 0 3 79 77 78
		f 3 146 188 -116
		mu 0 3 0 80 1
		f 3 -189 87 -148
		mu 0 3 1 80 81
		f 3 147 189 -117
		mu 0 3 1 81 3
		f 3 -190 86 -149
		mu 0 3 3 81 82
		f 3 -85 190 149
		mu 0 3 83 80 2
		f 3 -191 -147 118
		mu 0 3 2 80 0
		f 3 90 191 148
		mu 0 3 84 85 5
		f 3 -192 -151 -120
		mu 0 3 5 85 6
		f 3 -89 192 151
		mu 0 3 86 87 7
		f 3 -193 -150 121
		mu 0 3 7 87 4
		f 3 93 193 150
		mu 0 3 88 89 9
		f 3 -194 -153 -123
		mu 0 3 9 89 10
		f 3 153 194 124
		mu 0 3 11 90 8
		f 3 -195 -92 -152
		mu 0 3 8 90 91
		f 3 152 195 -126
		mu 0 3 13 92 14
		f 3 -196 96 -155
		mu 0 3 14 92 93
		f 3 -95 196 155
		mu 0 3 94 95 15
		f 3 -197 -154 127
		mu 0 3 15 95 12
		f 3 154 197 -129
		mu 0 3 17 96 18
		f 3 -198 99 -157
		mu 0 3 18 96 97
		f 3 -98 198 157
		mu 0 3 98 99 19
		f 3 -199 -156 130
		mu 0 3 19 99 16
		f 3 156 199 -132
		mu 0 3 21 100 22
		f 3 -200 102 -159
		mu 0 3 22 100 101
		f 3 -101 200 159
		mu 0 3 102 103 23
		f 3 -201 -158 133
		mu 0 3 23 103 20
		f 3 105 201 158
		mu 0 3 104 105 25
		f 3 -202 -161 -135
		mu 0 3 25 105 26
		f 3 161 202 136
		mu 0 3 27 106 24
		f 3 -203 -104 -160
		mu 0 3 24 106 107
		f 3 160 203 -138
		mu 0 3 29 108 30
		f 3 -204 108 -163
		mu 0 3 30 108 109
		f 3 -107 204 163
		mu 0 3 110 111 31
		f 3 -205 -162 139
		mu 0 3 31 111 28
		f 3 111 205 162
		mu 0 3 112 113 33
		f 3 -206 -165 -141
		mu 0 3 33 113 34
		f 3 165 206 142
		mu 0 3 35 114 32
		f 3 -207 -110 -164
		mu 0 3 32 114 115
		f 3 114 207 164
		mu 0 3 116 117 37
		f 3 -208 -167 -144
		mu 0 3 37 117 38
		f 3 166 208 144
		mu 0 3 38 117 39
		f 3 -209 -114 -168
		mu 0 3 39 117 118
		f 3 167 209 145
		mu 0 3 39 118 36
		f 3 -210 -113 -166
		mu 0 3 36 118 119
		f 3 33 210 -39
		mu 0 3 120 123 121
		f 3 -211 35 -38
		mu 0 3 121 123 122
		f 3 40 211 37
		mu 0 3 127 126 124
		f 3 -212 -43 -44
		mu 0 3 124 126 125
		f 3 42 212 -49
		mu 0 3 128 131 129
		f 3 -213 45 -48
		mu 0 3 129 131 130
		f 3 47 213 -54
		mu 0 3 132 135 133
		f 3 -214 50 -53
		mu 0 3 133 135 134
		f 3 55 214 52
		mu 0 3 139 138 136
		f 3 -215 -58 -59
		mu 0 3 136 138 137
		f 3 60 215 57
		mu 0 3 143 142 140
		f 3 -216 -63 -64
		mu 0 3 140 142 141
		f 3 65 216 62
		mu 0 3 147 146 144
		f 3 -217 -68 -69
		mu 0 3 144 146 145
		f 3 70 217 67
		mu 0 3 151 150 148
		f 3 -218 -73 -74
		mu 0 3 148 150 149
		f 3 72 218 -79
		mu 0 3 152 155 153
		f 3 -219 75 -78
		mu 0 3 153 155 154
		f 3 77 219 -84
		mu 0 3 156 159 157
		f 3 -220 80 -83
		mu 0 3 157 159 158
		f 3 1 220 -1
		mu 0 3 160 163 161
		f 3 -221 3 -3
		mu 0 3 161 163 162
		f 3 6 221 4
		mu 0 3 167 166 164
		f 3 -222 -6 -4
		mu 0 3 164 166 165
		f 3 7 222 -7
		mu 0 3 168 171 169
		f 3 -223 9 -9
		mu 0 3 169 171 170
		f 3 10 223 -10
		mu 0 3 172 175 173
		f 3 -224 12 -12
		mu 0 3 173 175 174
		f 3 15 224 13
		mu 0 3 179 178 176
		f 3 -225 -15 -13
		mu 0 3 176 178 177
		f 3 18 225 16
		mu 0 3 183 182 180
		f 3 -226 -18 -16
		mu 0 3 180 182 181
		f 3 21 226 19
		mu 0 3 187 186 184
		f 3 -227 -21 -19
		mu 0 3 184 186 185
		f 3 24 227 22
		mu 0 3 191 190 188
		f 3 -228 -24 -22
		mu 0 3 188 190 189
		f 3 25 228 -25
		mu 0 3 192 195 193
		f 3 -229 27 -27
		mu 0 3 193 195 194
		f 3 28 229 -28
		mu 0 3 196 199 197
		f 3 -230 30 -30
		mu 0 3 197 199 198
		f 3 -32 230 -34
		mu 0 3 120 200 123
		f 3 0 32 -231
		mu 0 3 200 201 123
		f 3 -33 231 -36
		mu 0 3 123 201 122
		f 3 2 34 -232
		mu 0 3 201 202 122
		f 3 -37 232 38
		mu 0 3 121 203 120
		f 3 -2 31 -233
		mu 0 3 203 200 120
		f 3 -35 233 -41
		mu 0 3 127 204 126
		f 3 5 39 -234
		mu 0 3 204 205 126
		f 3 -42 234 43
		mu 0 3 125 206 124
		f 3 -5 36 -235
		mu 0 3 206 207 124
		f 3 -40 235 -46
		mu 0 3 131 208 130
		f 3 8 44 -236
		mu 0 3 208 209 130
		f 3 -47 236 48
		mu 0 3 129 210 128
		f 3 -8 41 -237
		mu 0 3 210 211 128
		f 3 -45 237 -51
		mu 0 3 135 212 134
		f 3 11 49 -238
		mu 0 3 212 213 134
		f 3 -52 238 53
		mu 0 3 133 214 132
		f 3 -11 46 -239
		mu 0 3 214 215 132
		f 3 -50 239 -56
		mu 0 3 139 216 138
		f 3 14 54 -240
		mu 0 3 216 217 138
		f 3 -57 240 58
		mu 0 3 137 218 136
		f 3 -14 51 -241
		mu 0 3 218 219 136
		f 3 -55 241 -61
		mu 0 3 143 220 142
		f 3 17 59 -242
		mu 0 3 220 221 142
		f 3 -62 242 63
		mu 0 3 141 222 140
		f 3 -17 56 -243
		mu 0 3 222 223 140
		f 3 -60 243 -66
		mu 0 3 147 224 146
		f 3 20 64 -244
		mu 0 3 224 225 146
		f 3 -67 244 68
		mu 0 3 145 226 144
		f 3 -20 61 -245
		mu 0 3 226 227 144
		f 3 -65 245 -71
		mu 0 3 151 228 150
		f 3 23 69 -246
		mu 0 3 228 229 150
		f 3 -72 246 73
		mu 0 3 149 230 148
		f 3 -23 66 -247
		mu 0 3 230 231 148
		f 3 -70 247 -76
		mu 0 3 155 232 154
		f 3 26 74 -248
		mu 0 3 232 233 154
		f 3 -77 248 78
		mu 0 3 153 234 152
		f 3 -26 71 -249
		mu 0 3 234 235 152
		f 3 -75 249 -81
		mu 0 3 159 236 158
		f 3 29 79 -250
		mu 0 3 236 237 158
		f 3 -80 250 82
		mu 0 3 158 237 157
		f 3 -31 81 -251
		mu 0 3 237 238 157
		f 3 -82 251 83
		mu 0 3 157 238 156
		f 3 -29 76 -252
		mu 0 3 238 239 156;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface21";
	setAttr ".t" -type "double3" 1.8183355141920354e-018 0 -0.014847836253342878 ;
	setAttr ".r" -type "double3" 0 180 0 ;
createNode mesh -n "polySurfaceShape23" -p "polySurface21";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 48 ".pt";
	setAttr ".pt[16]" -type "float3" -0.22102758 0 0.066630334 ;
	setAttr ".pt[17]" -type "float3" -0.20421977 0 0.053004898 ;
	setAttr ".pt[18]" -type "float3" -0.22509307 0 0.061542626 ;
	setAttr ".pt[19]" -type "float3" -0.20828505 0 0.04791728 ;
	setAttr ".pt[20]" -type "float3" -0.25902587 0 -0.00035646095 ;
	setAttr ".pt[21]" -type "float3" -0.24221803 0 -0.013981887 ;
	setAttr ".pt[38]" -type "float3" -0.20421977 0 0.053004898 ;
	setAttr ".pt[39]" -type "float3" -0.22102758 0 0.066630334 ;
	setAttr ".pt[40]" -type "float3" -0.20828505 0 0.04791728 ;
	setAttr ".pt[41]" -type "float3" -0.22509307 0 0.061542626 ;
	setAttr ".pt[42]" -type "float3" -0.24221803 0 -0.013981887 ;
	setAttr ".pt[43]" -type "float3" -0.25902587 0 -0.00035646095 ;
	setAttr ".pt[60]" -type "float3" -0.20650096 0 0.050224353 ;
	setAttr ".pt[61]" -type "float3" -0.22348623 0 0.063630044 ;
	setAttr ".pt[62]" -type "float3" -0.21241131 0 0.042841654 ;
	setAttr ".pt[63]" -type "float3" -0.22921544 0 0.056471728 ;
	setAttr ".pt[64]" -type "float3" -0.24644865 0 -0.019188853 ;
	setAttr ".pt[65]" -type "float3" -0.26325652 0 -0.0055634249 ;
	setAttr ".pt[82]" -type "float3" -0.21856907 0 0.069630615 ;
	setAttr ".pt[83]" -type "float3" -0.20193851 0 0.05578554 ;
	setAttr ".pt[84]" -type "float3" -0.22097051 0 0.066613376 ;
	setAttr ".pt[85]" -type "float3" -0.20415866 0 0.052992892 ;
	setAttr ".pt[86]" -type "float3" -0.2547951 0 0.0048504872 ;
	setAttr ".pt[87]" -type "float3" -0.23798734 0 -0.008774939 ;
	setAttr ".pt[104]" -type "float3" 0.20475265 0 0.074853137 ;
	setAttr ".pt[105]" -type "float3" 0.18913639 0 0.062595151 ;
	setAttr ".pt[106]" -type "float3" 0.20840898 0 0.070126958 ;
	setAttr ".pt[107]" -type "float3" 0.19279262 0 0.057869021 ;
	setAttr ".pt[108]" -type "float3" 0.23864771 0 0.012850191 ;
	setAttr ".pt[109]" -type "float3" 0.2230313 0 0.00059234916 ;
	setAttr ".pt[126]" -type "float3" 0.18913639 0 0.062595151 ;
	setAttr ".pt[127]" -type "float3" 0.20475265 0 0.074853137 ;
	setAttr ".pt[128]" -type "float3" 0.19279262 0 0.057869021 ;
	setAttr ".pt[129]" -type "float3" 0.20840898 0 0.070126958 ;
	setAttr ".pt[130]" -type "float3" 0.2230313 0 0.00059234916 ;
	setAttr ".pt[131]" -type "float3" 0.23864771 0 0.012850191 ;
	setAttr ".pt[148]" -type "float3" 0.20696495 0 0.072065167 ;
	setAttr ".pt[149]" -type "float3" 0.1911892 0 0.060011357 ;
	setAttr ".pt[150]" -type "float3" 0.21211787 0 0.065415502 ;
	setAttr ".pt[151]" -type "float3" 0.19650505 0 0.053153008 ;
	setAttr ".pt[152]" -type "float3" 0.24245398 0 0.0080121914 ;
	setAttr ".pt[153]" -type "float3" 0.22683755 0 -0.004245671 ;
	setAttr ".pt[170]" -type "float3" 0.1870836 0 0.065178946 ;
	setAttr ".pt[171]" -type "float3" 0.20254034 0 0.077641107 ;
	setAttr ".pt[172]" -type "float3" 0.18908022 0 0.062585033 ;
	setAttr ".pt[173]" -type "float3" 0.20470008 0 0.074838422 ;
	setAttr ".pt[174]" -type "float3" 0.21922497 0 0.0054303389 ;
	setAttr ".pt[175]" -type "float3" 0.23484141 0 0.017688191 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 12 ".lnk";
	setAttr -s 12 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode polyCube -n "polyCube1";
	setAttr ".w" 5;
	setAttr ".h" 2;
	setAttr ".d" 5;
	setAttr ".cuv" 4;
createNode polyBevel -n "polyBevel1";
	setAttr ".ics" -type "componentList" 2 "e[4:5]" "e[8:9]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".o" 0.004;
	setAttr ".at" 180;
	setAttr ".fn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
	setAttr ".ma" 180;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 67.261695861816406 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 0.32738304 0 ;
	setAttr ".rs" 41326;
	setAttr ".ls" -type "double3" 0.83333333823872224 0.83333333823872224 0.83333333823872224 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -2.5 0.32738304138183594 -2.5 ;
	setAttr ".cbx" -type "double3" 2.5 0.32738304138183594 2.5 ;
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[2]" -type "float3" 0 -134.52339 0 ;
	setAttr ".tk[3]" -type "float3" 0 -134.52339 0 ;
	setAttr ".tk[6]" -type "float3" 0 -134.52339 0 ;
	setAttr ".tk[7]" -type "float3" 0 -134.52339 0 ;
	setAttr ".tk[8]" -type "float3" 0 -134.52339 0 ;
	setAttr ".tk[9]" -type "float3" 0 -134.52339 0 ;
	setAttr ".tk[12]" -type "float3" 0 -134.52339 0 ;
	setAttr ".tk[13]" -type "float3" 0 -134.52339 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 67.261695861816406 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 0.32738304 0 ;
	setAttr ".rs" 43950;
	setAttr ".lt" -type "double3" -4.2351647362715018e-024 5.3141436913193246e-024 0.46128187665494352 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -2.0833331298828126 0.32738304138183594 -2.0833331298828126 ;
	setAttr ".cbx" -type "double3" 2.0833331298828126 0.32738304138183594 2.0833331298828126 ;
createNode polyExtrudeFace -n "polyExtrudeFace3";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 67.261695861816406 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 0.78866494 0 ;
	setAttr ".rs" 56089;
	setAttr ".ls" -type "double3" 0.5172222278133437 0.5172222278133437 0.52491752447855322 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -2.0833331298828126 0.78866493225097656 -2.0833331298828126 ;
	setAttr ".cbx" -type "double3" 2.0833331298828126 0.78866493225097656 2.0833331298828126 ;
createNode polyExtrudeFace -n "polyExtrudeFace4";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 67.261695861816406 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 0.78866494 0 ;
	setAttr ".rs" 55472;
	setAttr ".lt" -type "double3" 0 -4.4469229730850766e-023 2.3399584445241568 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -1.0775463104248046 0.78866493225097656 -1.0775463104248046 ;
	setAttr ".cbx" -type "double3" 1.0775463104248046 0.78866493225097656 1.0775463104248046 ;
createNode polyExtrudeFace -n "polyExtrudeFace5";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 67.261695861816406 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 3.1286232 0 ;
	setAttr ".rs" 38695;
	setAttr ".ls" -type "double3" 0.079126202423243558 0.17836148210681846 0.24956203926338039 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -1.0775463104248046 3.1286234283447265 -1.0775463104248046 ;
	setAttr ".cbx" -type "double3" 1.0775463104248046 3.1286234283447265 1.0775463104248046 ;
createNode polyExtrudeFace -n "polyExtrudeFace6";
	setAttr ".ics" -type "componentList" 1 "f[4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 67.261695861816406 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 3.1286232 0 ;
	setAttr ".rs" 40812;
	setAttr ".lt" -type "double3" 0 -6.7762635780344029e-023 -1.2787505083740984 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.085262145996093747 3.1286234283447265 -0.19219276428222656 ;
	setAttr ".cbx" -type "double3" 0.085262145996093747 3.1286234283447265 0.19219276428222656 ;
createNode polyBevel -n "polyBevel2";
	setAttr ".ics" -type "componentList" 17 "e[2:4]" "e[6:9]" "e[13]" "e[42]" "e[44]" "e[46]" "e[48]" "e[50]" "e[52]" "e[54:55]" "e[74]" "e[76]" "e[78]" "e[80]" "e[82]" "e[84]" "e[86:87]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 67.261695861816406 0 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".o" 0.0005;
	setAttr ".at" 180;
	setAttr ".fn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
	setAttr ".ma" 180;
createNode polyTriangulate -n "polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 20 ".tk";
	setAttr ".tk[0]" -type "float3" -138.03065 0 10.356821 ;
	setAttr ".tk[1]" -type "float3" -10.356821 0 17.260221 ;
	setAttr ".tk[2]" -type "float3" 17.260221 0 10.356821 ;
	setAttr ".tk[3]" -type "float3" 10.356821 0 17.260221 ;
	setAttr ".tk[4]" -type "float3" -138.03065 0 -10.356821 ;
	setAttr ".tk[5]" -type "float3" -10.356821 0 -17.260221 ;
	setAttr ".tk[6]" -type "float3" 17.260221 0 -10.356821 ;
	setAttr ".tk[7]" -type "float3" 10.356821 0 -17.260221 ;
	setAttr ".tk[8]" -type "float3" -7.6293945e-006 0 0 ;
	setAttr ".tk[9]" -type "float3" -39.225674 0 0 ;
	setAttr ".tk[14]" -type "float3" -7.6293945e-006 0 0 ;
	setAttr ".tk[15]" -type "float3" -39.225674 0 0 ;
	setAttr ".tk[40]" -type "float3" -120.77047 0 0 ;
	setAttr ".tk[41]" -type "float3" -120.77047 0 0 ;
	setAttr ".tk[42]" -type "float3" -120.77047 0 0 ;
	setAttr ".tk[43]" -type "float3" -120.77047 0 0 ;
	setAttr ".tk[58]" -type "float3" -39.225658 0 0 ;
	setAttr ".tk[59]" -type "float3" -39.225658 9.5367432e-007 0 ;
	setAttr ".tk[70]" -type "float3" -39.225658 0 0 ;
	setAttr ".tk[71]" -type "float3" -39.225658 9.5367432e-007 0 ;
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 1 "f[14]";
createNode deleteComponent -n "deleteComponent2";
	setAttr ".dc" -type "componentList" 1 "f[14]";
createNode deleteComponent -n "deleteComponent3";
	setAttr ".dc" -type "componentList" 1 "f[14]";
createNode deleteComponent -n "deleteComponent4";
	setAttr ".dc" -type "componentList" 1 "f[14]";
createNode deleteComponent -n "deleteComponent5";
	setAttr ".dc" -type "componentList" 1 "f[14]";
createNode deleteComponent -n "deleteComponent6";
	setAttr ".dc" -type "componentList" 1 "f[14]";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 1\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n"
		+ "                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 1\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n"
		+ "            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n"
		+ "            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n"
		+ "                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n"
		+ "                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n"
		+ "                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n"
		+ "                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n"
		+ "                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n"
		+ "                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n"
		+ "                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n"
		+ "                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n"
		+ "                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 50 100 -ps 2 50 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Hypershade\")) \n\t\t\t\t\t\"scriptedPanel\"\n\t\t\t\t\t\"$panelName = `scriptedPanel -unParent  -type \\\"hyperShadePanel\\\" -l (localizedPanelLabel(\\\"Hypershade\\\")) -mbv $menusOkayInPanels `\"\n\t\t\t\t\t\"scriptedPanel -edit -l (localizedPanelLabel(\\\"Hypershade\\\")) -mbv $menusOkayInPanels  $panelName\"\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 1\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 1\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode shadingEngine -n "mace:initialShadingGroup";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "mace:materialInfo1";
createNode lambert -n "mace:initialShadingGroup1";
createNode polyTriangulate -n "polyTriangulate2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyPlane -n "polyPlane1";
	setAttr ".w" 20;
	setAttr ".h" 20;
	setAttr ".sw" 1;
	setAttr ".sh" 1;
	setAttr ".cuv" 2;
createNode shadingEngine -n "phong_glowymat";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "D:/Git/Year2/fga1.grp1-final/resources/rainbowBall.jpg";
createNode place2dTexture -n "place2dTexture1";
createNode lambert -n "lambert2";
createNode shadingEngine -n "light_fuglyStuff";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "D:/Git/Year2/fga1.grp1-final/resources/prettyScene/Material15.jpg";
createNode place2dTexture -n "place2dTexture2";
createNode phong -n "phong1";
	setAttr ".c" -type "float3" 0.83544302 0.73426247 0.60278803 ;
createNode shadingEngine -n "phong1SG";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 4 ".gn";
createNode materialInfo -n "materialInfo3";
createNode file -n "file3";
	setAttr ".ftn" -type "string" "D:/Git/Year2/fga1.grp1-final/resources/ForestFloor.jpg";
createNode place2dTexture -n "place2dTexture3";
createNode phong -n "phong2";
	setAttr ".cp" 40.315788269042969;
createNode polyCube -n "polyCube3";
	setAttr ".w" 0.35000000000000003;
	setAttr ".h" 2;
	setAttr ".d" 0.2;
	setAttr ".cuv" 4;
createNode phong -n "phong3";
	setAttr ".c" -type "float3" 0.36708862 0.62284929 1 ;
createNode shadingEngine -n "phong3SG";
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 2 ".gn";
createNode materialInfo -n "materialInfo4";
createNode polyBevel -n "polyBevel5";
	setAttr ".ics" -type "componentList" 2 "e[4:5]" "e[8:9]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".o" 0.005;
	setAttr ".at" 180;
	setAttr ".fn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
	setAttr ".ma" 180;
createNode polyTweak -n "polyTweak4";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[2]" -type "float3" 0 99.011932 0 ;
	setAttr ".tk[3]" -type "float3" 0 99.011932 0 ;
	setAttr ".tk[4]" -type "float3" 0 99.011932 0 ;
	setAttr ".tk[5]" -type "float3" 0 99.011932 0 ;
createNode polyMergeVert -n "polyMergeVert1";
	setAttr ".ics" -type "componentList" 2 "vtx[0:1]" "vtx[10:11]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak5";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[0]" -type "float3" 2.4997501 0 -5.0005002 ;
	setAttr ".tk[1]" -type "float3" -2.4997501 0 -10 ;
	setAttr ".tk[10]" -type "float3" 2.4997501 0 5.0004997 ;
	setAttr ".tk[11]" -type "float3" -2.4997501 0 10 ;
createNode polyMergeVert -n "polyMergeVert2";
	setAttr ".ics" -type "componentList" 2 "vtx[3:4]" "vtx[11:12]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak6";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[3]" -type "float3" -2.4997501 0 -5.0005002 ;
	setAttr ".tk[4]" -type "float3" 2.4997501 0 -10 ;
	setAttr ".tk[11]" -type "float3" -2.4997501 0 5.0004997 ;
	setAttr ".tk[12]" -type "float3" 2.4997501 0 10 ;
createNode polyMergeVert -n "polyMergeVert3";
	setAttr ".ics" -type "componentList" 2 "vtx[1]" "vtx[6]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak7";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[1]" -type "float3" 0 0 -5.0004997 ;
	setAttr ".tk[6]" -type "float3" 0 0 5.0004997 ;
createNode polyMergeVert -n "polyMergeVert4";
	setAttr ".ics" -type "componentList" 2 "vtx[4]" "vtx[8]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak8";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[4]" -type "float3" 0 0 -5.0004997 ;
	setAttr ".tk[8]" -type "float3" 0 0 5.0004997 ;
createNode polyExtrudeFace -n "polyExtrudeFace7";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0056791087 6.7981148 -0.046147224 ;
	setAttr ".rs" 61142;
	setAttr ".lt" -type "double3" 0 1.1153297862641527e-017 0.010398485887869728 ;
	setAttr ".ls" -type "double3" 3.4966460490385125 2.8368852379726612 1 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.09257796809020688 6.7981143334427951 -0.06535700376152391 ;
	setAttr ".cbx" -type "double3" 0.10393618508993574 6.7981143334427951 -0.026937438178408844 ;
createNode polyTweak -n "polyTweak9";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk[0:7]" -type "float3"  12.8311348 0 -3.8938262e-007
		 8.11889839 0 0 5.93975353 0 -8.1659441 -12.8311348 0 -3.8938262e-007 -8.11889839
		 0 0 -5.93975353 0 -8.1659441 5.93975353 0 8.1659441 -5.93975353 0 8.1659441;
createNode polyExtrudeFace -n "polyExtrudeFace8";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0056791287 6.8085127 -0.046147179 ;
	setAttr ".rs" 46972;
	setAttr ".lt" -type "double3" 0 1.3071141391485242e-017 0.026454336057068827 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.3378910615847982 6.8085121973053244 -0.10064313107706312 ;
	setAttr ".cbx" -type "double3" 0.34924931853942959 6.8085134758622088 0.0083487690469356227 ;
createNode polyExtrudeFace -n "polyExtrudeFace9";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0056791087 6.8349667 -0.046146676 ;
	setAttr ".rs" 37013;
	setAttr ".ls" -type "double3" 0.14646624611877723 0.49999998031738502 0.49999998031738502 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.3378910615847982 6.8349655392439335 -0.10064262165205447 ;
	setAttr ".cbx" -type "double3" 0.34924927858452698 6.8349674570792596 0.0083492734775814266 ;
createNode polyExtrudeFace -n "polyExtrudeFace10";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0056790914 6.8349667 -0.04614668 ;
	setAttr ".rs" 59422;
	setAttr ".lt" -type "double3" 0 2.7332736768359568e-018 0.40431149885554435 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.044642343345784534 6.8349655392439335 -0.073394651615417625 ;
	setAttr ".cbx" -type "double3" 0.056000525384973583 6.8349668178008169 -0.018898704050599673 ;
createNode polySoftEdge -n "polySoftEdge20";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".a" 0;
createNode polySplitRing -n "polySplitRing4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[49:50]" "e[52]" "e[54]" "e[56]" "e[58]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".wt" 0.38243117928504944;
	setAttr ".re" 52;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[49:50]" "e[52]" "e[54]" "e[56]" "e[58]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".wt" 0.60969102382659912;
	setAttr ".dr" no;
	setAttr ".re" 54;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyExtrudeFace -n "polyExtrudeFace11";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0056790882 7.2392778 -0.04614244 ;
	setAttr ".rs" 42131;
	setAttr ".lt" -type "double3" 0 3.0900693652078857e-018 0.0031494197932152674 ;
	setAttr ".ls" -type "double3" 1.2166666726485296 1.2166666726485296 1.224111182991753 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.044642343345784534 7.2392771900190125 -0.073390411401375158 ;
	setAttr ".cbx" -type "double3" 0.056000520390610764 7.2392784685758969 -0.018894466333738622 ;
createNode polyTweak -n "polyTweak10";
	setAttr ".uopa" yes;
	setAttr -s 19 ".tk";
	setAttr ".tk[20]" -type "float3" -1.575824 0.36078495 1.2200594 ;
	setAttr ".tk[21]" -type "float3" -2.2532446 0.36078495 -2.3593248e-005 ;
	setAttr ".tk[22]" -type "float3" 1.5758247 0.36078495 1.2200594 ;
	setAttr ".tk[23]" -type "float3" 2.2532446 0.36078495 -2.3593248e-005 ;
	setAttr ".tk[24]" -type "float3" 1.5758247 0.36078554 -1.2201068 ;
	setAttr ".tk[25]" -type "float3" -1.575824 0.36078554 -1.2201068 ;
	setAttr ".tk[32]" -type "float3" 0 -16.51119 0 ;
	setAttr ".tk[33]" -type "float3" 0 -16.51119 0 ;
	setAttr ".tk[34]" -type "float3" 0 -16.51119 0 ;
	setAttr ".tk[35]" -type "float3" 0 -16.51119 0 ;
	setAttr ".tk[36]" -type "float3" 0 -16.51119 0 ;
	setAttr ".tk[37]" -type "float3" 0 -16.51119 0 ;
	setAttr ".tk[38]" -type "float3" 2.2532446 -6.9847283 2.3816885e-005 ;
	setAttr ".tk[39]" -type "float3" 1.5758247 -6.9847283 1.2201068 ;
	setAttr ".tk[40]" -type "float3" -1.575824 -6.9847283 1.2201068 ;
	setAttr ".tk[41]" -type "float3" -2.2532446 -6.9847283 2.3816885e-005 ;
	setAttr ".tk[42]" -type "float3" -1.575824 -6.9847307 -1.2200594 ;
	setAttr ".tk[43]" -type "float3" 1.5758247 -6.9847307 -1.2200594 ;
createNode polyExtrudeFace -n "polyExtrudeFace12";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0056790859 7.2424269 -0.046142384 ;
	setAttr ".rs" 46341;
	setAttr ".lt" -type "double3" 0 1.1440975662517506e-017 0.024885286346476958 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.05554532208182706 7.2424262756253341 -0.079294082888458448 ;
	setAttr ".cbx" -type "double3" 0.066903494132290464 7.2424275541822185 -0.012990684970673079 ;
createNode polyBevel -n "polyBevel6";
	setAttr ".ics" -type "componentList" 10 "e[15]" "e[17]" "e[19]" "e[21]" "e[23:24]" "e[27]" "e[29]" "e[31]" "e[33]" "e[35:36]";
	setAttr ".ix" -type "matrix" 1.0473937997152185 0 0 0 0 1.0473937997152185 0 0 0 0 1.0473937997152185 0
		 0.56791084998644326 471.36760127132794 -4.6147215975603553 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".o" 0.001;
	setAttr ".at" 180;
	setAttr ".fn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
	setAttr ".ma" 180;
createNode polyTweak -n "polyTweak11";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk[8:19]" -type "float3"  0 -0.45582372 0 0 -0.45582372
		 0 0 -0.45582372 0 0 -0.45582372 0 0 -0.4557572 0 0 -0.4557572 0 0 0.45575684 0 0
		 0.45575684 0 0 0.45575684 0 0 0.45575684 0 0 0.4558236 0 0 0.4558236 0;
createNode polyTriangulate -n "polyTriangulate4";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak12";
	setAttr ".uopa" yes;
	setAttr -s 16 ".tk";
	setAttr ".tk[0]" -type "float3" 0 115.1627 0 ;
	setAttr ".tk[3]" -type "float3" 0 115.1627 0 ;
	setAttr ".tk[68]" -type "float3" 2.3841858e-007 0 1.4901161e-008 ;
	setAttr ".tk[69]" -type "float3" -2.3841858e-007 0 2.8421709e-014 ;
	setAttr ".tk[70]" -type "float3" 7.1525574e-007 1.8626451e-009 -2.9802322e-008 ;
	setAttr ".tk[71]" -type "float3" -7.1525574e-007 1.8626451e-009 2.8421709e-014 ;
	setAttr ".tk[72]" -type "float3" -1.1920929e-007 0 2.9802322e-008 ;
	setAttr ".tk[73]" -type "float3" 7.1525574e-007 0 2.9802322e-008 ;
	setAttr ".tk[74]" -type "float3" 1.1920929e-007 0 2.9802322e-008 ;
	setAttr ".tk[75]" -type "float3" -1.1920929e-007 0 -1.7763568e-015 ;
	setAttr ".tk[76]" -type "float3" 7.1525574e-007 1.8626451e-009 1.4210855e-014 ;
	setAttr ".tk[77]" -type "float3" 4.7683716e-007 1.8626451e-009 8.9406967e-008 ;
	setAttr ".tk[78]" -type "float3" 2.3841858e-007 0 4.4703484e-008 ;
	setAttr ".tk[79]" -type "float3" -2.3841858e-007 0 -5.9604645e-008 ;
createNode lambert -n "lambert3";
	setAttr ".c" -type "float3" 0.25316456 0.20439269 0.17945842 ;
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode groupId -n "groupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 3 "f[4:7]" "f[12:59]" "f[72:131]";
	setAttr ".irc" -type "componentList" 3 "f[0:3]" "f[8:11]" "f[60:71]";
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupId -n "groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[60:71]";
createNode phong -n "phong4";
	setAttr ".c" -type "float3" 0.82352942 0.9448275 1 ;
	setAttr ".cp" 80;
createNode shadingEngine -n "phongSG2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[0:3]" "f[8:11]";
createNode lambert -n "lambert4";
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
createNode file -n "file4";
	setAttr ".ftn" -type "string" "D:/Git/Year2/fga1.grp1-final/resources/texturez_3695.jpg";
createNode place2dTexture -n "place2dTexture4";
createNode polyTriangulate -n "polyTriangulate6";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyCube -n "polyCube4";
	setAttr ".w" 0.5;
	setAttr ".h" 0.5;
	setAttr ".d" 0.5;
	setAttr ".cuv" 4;
createNode polyMergeVert -n "polyMergeVert5";
	setAttr ".ics" -type "componentList" 1 "vtx[4:5]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 34.541658888732805 190.22642533335153 -217.95424378118497 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak13";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[4:5]" -type "float3"  25 0 0 -25 0 0;
createNode polyMergeVert -n "polyMergeVert6";
	setAttr ".ics" -type "componentList" 1 "vtx[2:3]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 34.541658888732805 190.22642533335153 -217.95424378118497 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak14";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk[2:4]" -type "float3"  25 0 0 -25 0 0 0 0 0;
createNode polyTweak -n "polyTweak15";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk[2:4]" -type "float3"  0 -10.087772369 0 0 -10.087772369
		 0 0 0 0;
createNode transformGeometry -n "transformGeometry1";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 0 0 0 0 0.19217397990059981 0 34.541658888732805 190.22642533335153 -217.95424378118497 1;
createNode polyAutoProj -n "polyAutoProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:4]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".s" -type "double3" 0.5 0.5 0.5 ;
	setAttr ".ps" 0.20000000298023224;
	setAttr ".dl" yes;
createNode groupId -n "groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:4]";
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode groupId -n "groupId7";
	setAttr ".ihi" 0;
createNode groupId -n "groupId8";
	setAttr ".ihi" 0;
createNode groupId -n "groupId9";
	setAttr ".ihi" 0;
createNode groupId -n "groupId10";
	setAttr ".ihi" 0;
createNode polyUnite -n "polyUnite1";
	setAttr -s 3 ".ip";
	setAttr -s 3 ".im";
createNode transformGeometry -n "transformGeometry2";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1.0817894408125126 0 0 0 0 1 0 0 -13.531217831531194 0 1;
createNode groupId -n "groupId11";
	setAttr ".ihi" 0;
createNode polyMergeVert -n "polyMergeVert7";
	setAttr ".ics" -type "componentList" 2 "vtx[8]" "vtx[13]";
	setAttr ".ix" -type "matrix" -1 0 -1.2246467991473532e-016 0 0 1 0 0 1.2246467991473532e-016 0 -1 0
		 31.90502110861452 27.588750616137645 -329.70644541459887 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak16";
	setAttr ".uopa" yes;
	setAttr -s 11 ".tk";
	setAttr ".tk[3]" -type "float3" -1.0573351 0.0097792186 0 ;
	setAttr ".tk[4]" -type "float3" -2.1171858 -1.8206521 0 ;
	setAttr ".tk[5]" -type "float3" 0.0025157614 -1.8206521 0 ;
	setAttr ".tk[8]" -type "float3" 0.17771912 -0.23068237 0 ;
	setAttr ".tk[9]" -type "float3" 1.0573351 0.0097792186 0 ;
	setAttr ".tk[10]" -type "float3" -0.0025157614 -1.8206521 0 ;
	setAttr ".tk[11]" -type "float3" 2.1171858 -1.8206521 0 ;
	setAttr ".tk[13]" -type "float3" -0.1777153 0.23068237 0 ;
	setAttr ".tk[15]" -type "float3" 0.012551308 1.8206521 -9.5367432e-007 ;
	setAttr ".tk[16]" -type "float3" -1.0472986 -0.0097798826 0 ;
	setAttr ".tk[17]" -type "float3" 1.0724106 -0.0097798826 -9.5367432e-007 ;
createNode polyMergeVert -n "polyMergeVert8";
	setAttr ".ics" -type "componentList" 2 "vtx[9]" "vtx[16]";
	setAttr ".ix" -type "matrix" -1 0 -1.2246467991473532e-016 0 0 1 0 0 1.2246467991473532e-016 0 -1 0
		 31.90502110861452 27.588750616137645 -329.70644541459887 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak17";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk";
	setAttr ".tk[9]" -type "float3" 0.18525696 -0.24046326 0 ;
	setAttr ".tk[16]" -type "float3" -0.18525314 0.24046326 0 ;
createNode polyMergeVert -n "polyMergeVert9";
	setAttr ".ics" -type "componentList" 2 "vtx[2]" "vtx[12]";
	setAttr ".ix" -type "matrix" -1 0 -1.2246467991473532e-016 0 0 1 0 0 1.2246467991473532e-016 0 -1 0
		 31.90502110861452 27.588750616137645 -329.70644541459887 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak18";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[2]" -type "float3" 0.11837578 -0.23068237 0 ;
	setAttr ".tk[12]" -type "float3" -0.11837578 0.23068237 0 ;
createNode polyMergeVert -n "polyMergeVert10";
	setAttr ".ics" -type "componentList" 2 "vtx[3]" "vtx[14]";
	setAttr ".ix" -type "matrix" -1 0 -1.2246467991473532e-016 0 0 1 0 0 1.2246467991473532e-016 0 -1 0
		 31.90502110861452 27.588750616137645 -329.70644541459887 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak19";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[3]" -type "float3" 0.12339401 -0.24046326 0 ;
	setAttr ".tk[14]" -type "float3" -0.12339401 0.24046326 0 ;
createNode polyMergeVert -n "polyMergeVert11";
	setAttr ".ics" -type "componentList" 2 "vtx[1]" "vtx[6]";
	setAttr ".ix" -type "matrix" -1 0 -1.2246467991473532e-016 0 0 1 0 0 1.2246467991473532e-016 0 -1 0
		 31.90502110861452 27.588750616137645 -329.70644541459887 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak20";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[1]" -type "float3" -0.059341431 0 0 ;
	setAttr ".tk[6]" -type "float3" 0.059341431 0 0 ;
createNode polyMergeVert -n "polyMergeVert12";
	setAttr ".ics" -type "componentList" 2 "vtx[5]" "vtx[9]";
	setAttr ".ix" -type "matrix" -1 0 -1.2246467991473532e-016 0 0 1 0 0 1.2246467991473532e-016 0 -1 0
		 31.90502110861452 27.588750616137645 -329.70644541459887 1;
	setAttr ".d" 0.01;
createNode polyTweak -n "polyTweak21";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[5]" -type "float3" -0.061855316 0 0 ;
	setAttr ".tk[9]" -type "float3" 0.061855316 0 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace13";
	setAttr ".ics" -type "componentList" 3 "f[0]" "f[5]" "f[10]";
	setAttr ".ix" -type "matrix" -1 0 -1.2246467991473532e-016 0 0 1 0 0 1.2246467991473532e-016 0 -1 0
		 31.90502110861452 27.588750616137645 -329.70644541459887 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.023405466 1.9302843 -1.1655656 ;
	setAttr ".rs" 50045;
	setAttr ".lt" -type "double3" 0 -2.8555578118011311e-016 0.010931207896065019 ;
	setAttr ".ls" -type "double3" 0.93333333095058957 0.93333333095058957 0.93333333095058957 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.52281204782498791 1.5008247925383296 -1.1655655832963794 ;
	setAttr ".cbx" -type "double3" 0.47600111402498768 2.3597437073332515 -1.1655655832963794 ;
createNode polyTriangulate -n "polyTriangulate7";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode phong -n "mirror";
	setAttr ".dc" 0.72932332754135132;
	setAttr ".c" -type "float3" 0.83499998 0.73400003 0.60000002 ;
	setAttr ".rfl" 1;
	setAttr ".rc" -type "float3" 1 1 1 ;
	setAttr ".cp" 18.210525512695313;
createNode shadingEngine -n "mirror1";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
createNode shadingEngine -n "light_trail1";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 6 ".gn";
createNode materialInfo -n "materialInfo9";
createNode lambert -n "light_trail";
	setAttr ".c" -type "float3" 0 0.68099999 1 ;
	setAttr ".ic" -type "float3" 0 0.68099999 1 ;
createNode polyPlane -n "polyPlane2";
	setAttr ".w" 1.1962574606309366;
	setAttr ".h" 1.4694937792515144;
	setAttr ".sw" 1;
	setAttr ".sh" 1;
	setAttr ".cuv" 2;
createNode polyExtrudeEdge -n "polyExtrudeEdge1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[3]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 64.907533598622081 245.80162461380888 -60.231323490429048 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.86122632 2.4580162 -0.8282311 ;
	setAttr ".rs" 39850;
	setAttr ".lt" -type "double3" 6.2172489379008772e-017 0.022749012264140358 -6.1634300458654106e-018 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.84087105752019475 2.4580162461380892 -0.84734599127902177 ;
	setAttr ".cbx" -type "double3" 0.88158162319003808 2.4580162461380892 -0.809116225467851 ;
createNode polyTweak -n "polyTweak22";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[2:3]" -type "float3"  2.2737368e-013 0 42.48324585
		 2.2737368e-013 0 42.48324585;
createNode polyExtrudeEdge -n "polyExtrudeEdge2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[6]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".t" -type "double3" -1.8047785488306545e-014 -2.3124529740350814 -2.1884716261411086e-014 ;
	setAttr ".pvt" -type "float3" 0.88010567 0.1207287 -0.84833562 ;
	setAttr ".rs" 36369;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.86036089084089629 2.4331815178971219 -0.86808048487665546 ;
	setAttr ".cbx" -type "double3" 0.89985047058486345 2.4331815560440946 -0.8285908509887463 ;
createNode polyTweak -n "polyTweak23";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[4:5]" -type "float3"  0.029514335 -2.48347282 -0.34552598
		 -0.029513381 -2.48346901 -0.17010671;
createNode polyExtrudeEdge -n "polyExtrudeEdge3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[9]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.88010567 0.12072849 -0.84833562 ;
	setAttr ".rs" 41562;
	setAttr ".lt" -type "double3" -2.8421709430404008e-016 -4.1438423316769413e-017 
		1.2086736664305302 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.8603608999283161 0.12072849589394821 -0.86808047634300023 ;
	setAttr ".cbx" -type "double3" 0.89985046149744363 0.12072849589394821 -0.82859085952240141 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[12]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 1.734767 0.12072849 -1.7029971 ;
	setAttr ".rs" 44060;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.7150222438569933 0.12072849589394821 -1.7227417978576927 ;
	setAttr ".cbx" -type "double3" 1.7545117330254492 0.12072849589394821 -1.6832523536859716 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[15]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 1.7417351 0.12072849 -1.7104173 ;
	setAttr ".rs" 53085;
	setAttr ".lt" -type "double3" 4.0412118096355699e-016 0.025427562273959505 -0.029151772049773081 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.7255872946893767 0.12044437724160446 -1.7331962058956334 ;
	setAttr ".cbx" -type "double3" 1.7578827723646111 0.12101261454629196 -1.6876383834631277 ;
createNode polyTweak -n "polyTweak24";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[10:11]" -type "float3"  1.16752839 -0.028416889 -1.48532009
		 -1.16753864 0.028416889 -0.550497;
createNode polyExtrudeEdge -n "polyExtrudeEdge6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[18]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".t" -type "double3" 0 -0.43014847829306824 0 ;
	setAttr ".pvt" -type "float3" 1.7626748 -0.33835965 -1.7248981 ;
	setAttr ".rs" 40650;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.7465272136985142 0.091689647016995085 -1.7476770498460588 ;
	setAttr ".cbx" -type "double3" 1.77882262391893 0.091888316450588828 -1.7021190814376004 ;
createNode polyTweak -n "polyTweak25";
	setAttr ".uopa" yes;
	setAttr ".tk[12]" -type "float3"  0 0.036952101 0;
createNode polyExtrudeEdge -n "polyExtrudeEdge7";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[21]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 1.7626748 -0.33835948 -1.7248981 ;
	setAttr ".rs" 44323;
	setAttr ".lt" -type "double3" -3.1974423109204507e-016 -1.4585554986012994e-016 
		0.58276736091163606 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 1.7465272136985142 -0.33845897358847365 -1.7476770498460588 ;
	setAttr ".cbx" -type "double3" 1.77882262391893 -0.3382599989790987 -1.7021190814376004 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[24]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 2.23561 -0.33835948 -2.059268 ;
	setAttr ".rs" 44153;
	setAttr ".lt" -type "double3" 3.0619951019161819e-015 0.017362368587876081 -0.035501685069049993 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 2.2219553149616629 -0.33845897358847365 -2.0847018309038536 ;
	setAttr ".cbx" -type "double3" 2.2492645495523123 -0.3382599989790987 -2.0338342912513392 ;
createNode polyTweak -n "polyTweak26";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk[12:17]" -type "float3"  -4.5474735e-013 0 -1.16256237
		 -4.5474735e-013 0 -1.16256237 -4.5474735e-013 0 -1.16256237 -4.5474735e-013 0 -1.16256237
		 0 0 0 0 0 0.72841424;
createNode polyExtrudeEdge -n "polyExtrudeEdge9";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[27]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 245.80162461380888 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 2.2509778 -0.37385386 -2.06738 ;
	setAttr ".rs" 48137;
	setAttr ".lt" -type "double3" 4.9737991503207018e-016 0.63611221197704071 2.0694557179012919e-015 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 2.2373232811561365 -0.37395335835409865 -2.0928137216487426 ;
	setAttr ".cbx" -type "double3" 2.2646324112931873 -0.37375438374472369 -2.0419460707644435 ;
createNode polyExtrudeFace -n "polyExtrudeFace14";
	setAttr ".ics" -type "componentList" 1 "f[0:9]";
	setAttr ".ix" -type "matrix" -1 -0 -0 0 0 1 0 0 0 0 1 0 -0.48020354181682023 0.46499055253394772 -1.4210854715202004e-014 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0038923793 0.76102263 -1.1004016 ;
	setAttr ".rs" 35367;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -2.4486441985041059 -0.94062093798051993 -2.1508053588867186 ;
	setAttr ".cbx" -type "double3" -0.13209497365059009 2.4626661103593239 -0.049232788085937645 ;
createNode polyExtrudeFace -n "polyExtrudeFace15";
	setAttr ".ics" -type "componentList" 1 "f[0:9]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 246.26661516634283 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0038923793 0.76102263 -1.1004016 ;
	setAttr ".rs" 62482;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.12729292506921902 -0.94062089667641546 -2.1508054301315638 ;
	setAttr ".cbx" -type "double3" 2.4438422986251753 2.4626661516634285 -0.049232786808495348 ;
createNode polyTweak -n "polyTweak27";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk[20:21]" -type "float3"  0 0 9.95572186 0 0 9.95572186;
createNode transformGeometry -n "transformGeometry3";
	setAttr ".txf" -type "matrix" -1 0 0 0 0 1 0 0 0 0 1 0 -0.48020354181682023 0.46499055253394772 -1.4210854715202004e-014 1;
	setAttr ".rn" yes;
createNode polyExtrudeFace -n "polyExtrudeFace16";
	setAttr ".ics" -type "componentList" 1 "f[0:41]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0038922874 0.76102263 -1.1004015 ;
	setAttr ".rs" 39872;
	setAttr ".lt" -type "double3" -1.4210854715202004e-016 4.1788970988524544e-018 0.01882007941721156 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -2.448644256591797 -0.94062095642089849 -2.1508053588867186 ;
	setAttr ".cbx" -type "double3" -0.13209497451782226 2.4626661682128907 -0.0492327880859375 ;
createNode polyExtrudeFace -n "polyExtrudeFace17";
	setAttr ".ics" -type "componentList" 1 "f[0:41]";
	setAttr ".ix" -type "matrix" 0.03403160812713877 0 0.031957807204869911 0 -0 1 0 0
		 -0.68454710592868917 -0 0.72896862742141111 0 65.061712822118011 246.26661516634283 -60.395507687477469 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.0038922874 0.76102263 -1.1004015 ;
	setAttr ".rs" 45966;
	setAttr ".lt" -type "double3" -1.4210854715202004e-016 4.1788970988524544e-018 0.01882007941721156 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" 0.12729292506921902 -0.94062089667641546 -2.1508052076679935 ;
	setAttr ".cbx" -type "double3" 2.4438425906173538 2.4626661516634285 -0.049232786808495348 ;
createNode polyTriangulate -n "polyTriangulate8";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTriangulate -n "polyTriangulate9";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyExtrudeEdge -n "polyExtrudeEdge10";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[0:7]";
	setAttr ".ix" -type "matrix" 2.2204460492503131e-016 0 1 0 -0 1 0 0 -1 -0 2.2204460492503131e-016 0
		 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".t" -type "double3" 0 -0.0013293247558736709 0 ;
	setAttr ".pvt" -type "float3" -4.4408921e-016 -0.92358637 -0.60385209 ;
	setAttr ".rs" 39002;
	setAttr ".lt" -type "double3" -2.1758189595864839e-017 -6.2172489379008772e-017 
		0.0709295674940323 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -2.6726022338867192 -0.92225685119628908 -3.8803063964843756 ;
	setAttr ".cbx" -type "double3" 2.6726022338867192 -0.92225685119628908 2.6726022338867192 ;
createNode polyTweak -n "polyTweak28";
	setAttr ".uopa" yes;
	setAttr -s 9 ".tk";
	setAttr ".tk[0]" -type "float3" 0 7.7743177 0 ;
	setAttr ".tk[1]" -type "float3" 0 7.7743177 0 ;
	setAttr ".tk[2]" -type "float3" 0 7.7743177 0 ;
	setAttr ".tk[3]" -type "float3" 0 7.7743177 0 ;
	setAttr ".tk[4]" -type "float3" 0 7.7743177 0 ;
	setAttr ".tk[5]" -type "float3" 0 7.7743177 0 ;
	setAttr ".tk[6]" -type "float3" 0 7.7743177 0 ;
	setAttr ".tk[7]" -type "float3" 0 7.7743177 0 ;
createNode groupId -n "groupId12";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts5";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:165]";
	setAttr ".irc" -type "componentList" 1 "f[166:173]";
createNode groupId -n "groupId13";
	setAttr ".ihi" 0;
createNode groupId -n "groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[166:173]";
createNode polyTriangulate -n "polyTriangulate10";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak29";
	setAttr ".uopa" yes;
	setAttr -s 11 ".tk";
	setAttr ".tk[0]" -type "float3" 0 1.2779381 0 ;
	setAttr ".tk[4]" -type "float3" 0 1.2779381 0 ;
	setAttr ".tk[5]" -type "float3" 0 1.2779381 0 ;
	setAttr ".tk[88]" -type "float3" 0.82146263 -1.4381363 -2.2068892 ;
	setAttr ".tk[89]" -type "float3" -1.7951865 -1.4393852 -2.2011797 ;
	setAttr ".tk[90]" -type "float3" 2.6843228 -1.4381363 -1.3177527 ;
	setAttr ".tk[91]" -type "float3" -2.6843228 -1.4393852 -1.3120413 ;
	setAttr ".tk[92]" -type "float3" 2.6843228 -1.4381363 1.3177527 ;
	setAttr ".tk[93]" -type "float3" 0.82146263 -1.4381363 2.2068892 ;
	setAttr ".tk[94]" -type "float3" -1.7951865 -1.4393852 2.2011797 ;
	setAttr ".tk[95]" -type "float3" -2.6843228 -1.4393852 1.3120413 ;
createNode polyUnite -n "polyUnite2";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId15";
	setAttr ".ihi" 0;
createNode groupId -n "groupId16";
	setAttr ".ihi" 0;
createNode groupId -n "groupId17";
	setAttr ".ihi" 0;
createNode groupId -n "groupId18";
	setAttr ".ihi" 0;
createNode groupId -n "groupId19";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:335]";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 12 ".st";
select -ne :initialShadingGroup;
	setAttr -s 12 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 4 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 12 ".s";
select -ne :defaultTextureList1;
	setAttr -s 4 ".tx";
select -ne :lambert1;
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 4 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :initialMaterialInfo;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "polyTriangulate10.out" "pCubeShape2.i";
connectAttr "groupId12.id" "pCubeShape2.iog.og[0].gid";
connectAttr "phong1SG.mwc" "pCubeShape2.iog.og[0].gco";
connectAttr "groupId14.id" "pCubeShape2.iog.og[1].gid";
connectAttr "light_trail1.mwc" "pCubeShape2.iog.og[1].gco";
connectAttr "groupId13.id" "pCubeShape2.ciog.cog[0].cgid";
connectAttr "polyTriangulate2.out" "pPlaneShape1.i";
connectAttr "groupId1.id" "pCubeShape4.iog.og[0].gid";
connectAttr "phong3SG.mwc" "pCubeShape4.iog.og[0].gco";
connectAttr "groupId3.id" "pCubeShape4.iog.og[1].gid";
connectAttr "lambert3SG.mwc" "pCubeShape4.iog.og[1].gco";
connectAttr "groupId4.id" "pCubeShape4.iog.og[2].gid";
connectAttr "phongSG2.mwc" "pCubeShape4.iog.og[2].gco";
connectAttr "groupParts3.og" "pCubeShape4.i";
connectAttr "groupId2.id" "pCubeShape4.ciog.cog[0].cgid";
connectAttr "polyTriangulate6.out" "pPlaneShape11.i";
connectAttr "groupId5.id" "pCubeShape5.iog.og[0].gid";
connectAttr "phong1SG.mwc" "pCubeShape5.iog.og[0].gco";
connectAttr "groupParts4.og" "pCubeShape5.i";
connectAttr "groupId6.id" "pCubeShape5.ciog.cog[0].cgid";
connectAttr "groupId7.id" "pCubeShape6.iog.og[0].gid";
connectAttr "phong1SG.mwc" "pCubeShape6.iog.og[0].gco";
connectAttr "groupId8.id" "pCubeShape6.ciog.cog[1].cgid";
connectAttr "groupId9.id" "pCubeShape7.iog.og[0].gid";
connectAttr "phong1SG.mwc" "pCubeShape7.iog.og[0].gco";
connectAttr "groupId10.id" "pCubeShape7.ciog.cog[2].cgid";
connectAttr "polyTriangulate7.out" "polySurfaceShape21.i";
connectAttr "polyTriangulate8.out" "pPlaneShape17.i";
connectAttr "polyTriangulate9.out" "pPlaneShape18.i";
connectAttr "groupId15.id" "pPlaneShape19.iog.og[0].gid";
connectAttr "light_trail1.mwc" "pPlaneShape19.iog.og[0].gco";
connectAttr "groupId16.id" "pPlaneShape19.ciog.cog[0].cgid";
connectAttr "groupId17.id" "pPlaneShape20.iog.og[0].gid";
connectAttr "light_trail1.mwc" "pPlaneShape20.iog.og[0].gco";
connectAttr "groupId18.id" "pPlaneShape20.ciog.cog[0].cgid";
connectAttr "groupParts7.og" "polySurfaceShape23.i";
connectAttr "groupId19.id" "polySurfaceShape23.iog.og[0].gid";
connectAttr "light_trail1.mwc" "polySurfaceShape23.iog.og[0].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "mace:initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phong_glowymat.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "light_fuglyStuff.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phong1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phong3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phongSG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "mirror1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "light_trail1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "mace:initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phong_glowymat.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "light_fuglyStuff.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phong1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phong3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phongSG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "mirror1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "light_trail1.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyCube1.out" "polyBevel1.ip";
connectAttr "pCubeShape2.wm" "polyBevel1.mp";
connectAttr "polyTweak1.out" "polyExtrudeFace1.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace1.mp";
connectAttr "polyBevel1.out" "polyTweak1.ip";
connectAttr "polyExtrudeFace1.out" "polyExtrudeFace2.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace2.mp";
connectAttr "polyExtrudeFace2.out" "polyExtrudeFace3.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace3.mp";
connectAttr "polyExtrudeFace3.out" "polyExtrudeFace4.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace4.mp";
connectAttr "polyExtrudeFace4.out" "polyExtrudeFace5.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace5.mp";
connectAttr "polyExtrudeFace5.out" "polyExtrudeFace6.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeFace6.mp";
connectAttr "polyExtrudeFace6.out" "polyBevel2.ip";
connectAttr "pCubeShape2.wm" "polyBevel2.mp";
connectAttr "polyTweak2.out" "polyTriangulate1.ip";
connectAttr "polyBevel2.out" "polyTweak2.ip";
connectAttr "polyTriangulate1.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "deleteComponent6.ig";
connectAttr "mace:initialShadingGroup1.oc" "mace:initialShadingGroup.ss";
connectAttr "mace:initialShadingGroup.msg" "mace:materialInfo1.sg";
connectAttr "mace:initialShadingGroup1.msg" "mace:materialInfo1.m";
connectAttr "polyPlane1.out" "polyTriangulate2.ip";
connectAttr "phong2.oc" "phong_glowymat.ss";
connectAttr "phong_glowymat.msg" "materialInfo1.sg";
connectAttr "phong2.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "file2.oc" "lambert2.c";
connectAttr "lambert2.oc" "light_fuglyStuff.ss";
connectAttr "light_fuglyStuff.msg" "materialInfo2.sg";
connectAttr "lambert2.msg" "materialInfo2.m";
connectAttr "file2.msg" "materialInfo2.t" -na;
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr "phong1.oc" "phong1SG.ss";
connectAttr "pCubeShape5.iog.og[0]" "phong1SG.dsm" -na;
connectAttr "pCubeShape6.iog.og[0]" "phong1SG.dsm" -na;
connectAttr "pCubeShape7.iog.og[0]" "phong1SG.dsm" -na;
connectAttr "pCubeShape2.iog.og[0]" "phong1SG.dsm" -na;
connectAttr "pCubeShape2.ciog.cog[0]" "phong1SG.dsm" -na;
connectAttr "groupId7.msg" "phong1SG.gn" -na;
connectAttr "groupId9.msg" "phong1SG.gn" -na;
connectAttr "groupId12.msg" "phong1SG.gn" -na;
connectAttr "groupId13.msg" "phong1SG.gn" -na;
connectAttr "phong1SG.msg" "materialInfo3.sg";
connectAttr "phong1.msg" "materialInfo3.m";
connectAttr "place2dTexture3.c" "file3.c";
connectAttr "place2dTexture3.tf" "file3.tf";
connectAttr "place2dTexture3.rf" "file3.rf";
connectAttr "place2dTexture3.mu" "file3.mu";
connectAttr "place2dTexture3.mv" "file3.mv";
connectAttr "place2dTexture3.s" "file3.s";
connectAttr "place2dTexture3.wu" "file3.wu";
connectAttr "place2dTexture3.wv" "file3.wv";
connectAttr "place2dTexture3.re" "file3.re";
connectAttr "place2dTexture3.of" "file3.of";
connectAttr "place2dTexture3.r" "file3.ro";
connectAttr "place2dTexture3.n" "file3.n";
connectAttr "place2dTexture3.vt1" "file3.vt1";
connectAttr "place2dTexture3.vt2" "file3.vt2";
connectAttr "place2dTexture3.vt3" "file3.vt3";
connectAttr "place2dTexture3.vc1" "file3.vc1";
connectAttr "place2dTexture3.o" "file3.uv";
connectAttr "place2dTexture3.ofs" "file3.fs";
connectAttr "file1.oc" "phong2.c";
connectAttr "phong3.oc" "phong3SG.ss";
connectAttr "pCubeShape4.iog.og[0]" "phong3SG.dsm" -na;
connectAttr "pCubeShape4.ciog.cog[0]" "phong3SG.dsm" -na;
connectAttr "groupId1.msg" "phong3SG.gn" -na;
connectAttr "groupId2.msg" "phong3SG.gn" -na;
connectAttr "phong3SG.msg" "materialInfo4.sg";
connectAttr "phong3.msg" "materialInfo4.m";
connectAttr "polyTweak4.out" "polyBevel5.ip";
connectAttr "pCubeShape4.wm" "polyBevel5.mp";
connectAttr "polyCube3.out" "polyTweak4.ip";
connectAttr "polyTweak5.out" "polyMergeVert1.ip";
connectAttr "pCubeShape4.wm" "polyMergeVert1.mp";
connectAttr "polyBevel5.out" "polyTweak5.ip";
connectAttr "polyTweak6.out" "polyMergeVert2.ip";
connectAttr "pCubeShape4.wm" "polyMergeVert2.mp";
connectAttr "polyMergeVert1.out" "polyTweak6.ip";
connectAttr "polyTweak7.out" "polyMergeVert3.ip";
connectAttr "pCubeShape4.wm" "polyMergeVert3.mp";
connectAttr "polyMergeVert2.out" "polyTweak7.ip";
connectAttr "polyTweak8.out" "polyMergeVert4.ip";
connectAttr "pCubeShape4.wm" "polyMergeVert4.mp";
connectAttr "polyMergeVert3.out" "polyTweak8.ip";
connectAttr "polyTweak9.out" "polyExtrudeFace7.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace7.mp";
connectAttr "polyMergeVert4.out" "polyTweak9.ip";
connectAttr "polyExtrudeFace7.out" "polyExtrudeFace8.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace8.mp";
connectAttr "polyExtrudeFace8.out" "polyExtrudeFace9.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace9.mp";
connectAttr "polyExtrudeFace9.out" "polyExtrudeFace10.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace10.mp";
connectAttr "polyExtrudeFace10.out" "polySoftEdge20.ip";
connectAttr "pCubeShape4.wm" "polySoftEdge20.mp";
connectAttr "polySoftEdge20.out" "polySplitRing4.ip";
connectAttr "pCubeShape4.wm" "polySplitRing4.mp";
connectAttr "polySplitRing4.out" "polySplitRing5.ip";
connectAttr "pCubeShape4.wm" "polySplitRing5.mp";
connectAttr "polyTweak10.out" "polyExtrudeFace11.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace11.mp";
connectAttr "polySplitRing5.out" "polyTweak10.ip";
connectAttr "polyExtrudeFace11.out" "polyExtrudeFace12.ip";
connectAttr "pCubeShape4.wm" "polyExtrudeFace12.mp";
connectAttr "polyTweak11.out" "polyBevel6.ip";
connectAttr "pCubeShape4.wm" "polyBevel6.mp";
connectAttr "polyExtrudeFace12.out" "polyTweak11.ip";
connectAttr "polyTweak12.out" "polyTriangulate4.ip";
connectAttr "polyBevel6.out" "polyTweak12.ip";
connectAttr "lambert3.oc" "lambert3SG.ss";
connectAttr "pCubeShape4.iog.og[1]" "lambert3SG.dsm" -na;
connectAttr "groupId3.msg" "lambert3SG.gn" -na;
connectAttr "lambert3SG.msg" "materialInfo5.sg";
connectAttr "lambert3.msg" "materialInfo5.m";
connectAttr "polyTriangulate4.out" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "groupParts1.og" "groupParts2.ig";
connectAttr "groupId3.id" "groupParts2.gi";
connectAttr "phong4.oc" "phongSG2.ss";
connectAttr "groupId4.msg" "phongSG2.gn" -na;
connectAttr "pCubeShape4.iog.og[2]" "phongSG2.dsm" -na;
connectAttr "phongSG2.msg" "materialInfo6.sg";
connectAttr "phong4.msg" "materialInfo6.m";
connectAttr "groupParts2.og" "groupParts3.ig";
connectAttr "groupId4.id" "groupParts3.gi";
connectAttr "file4.oc" "lambert4.c";
connectAttr "lambert4.oc" "lambert4SG.ss";
connectAttr "pPlaneShape11.iog" "lambert4SG.dsm" -na;
connectAttr "pPlaneShape12.iog" "lambert4SG.dsm" -na;
connectAttr "pPlaneShape13.iog" "lambert4SG.dsm" -na;
connectAttr "pPlaneShape15.iog" "lambert4SG.dsm" -na;
connectAttr "pPlaneShape16.iog" "lambert4SG.dsm" -na;
connectAttr "lambert4SG.msg" "materialInfo7.sg";
connectAttr "lambert4.msg" "materialInfo7.m";
connectAttr "file4.msg" "materialInfo7.t" -na;
connectAttr "place2dTexture4.c" "file4.c";
connectAttr "place2dTexture4.tf" "file4.tf";
connectAttr "place2dTexture4.rf" "file4.rf";
connectAttr "place2dTexture4.mu" "file4.mu";
connectAttr "place2dTexture4.mv" "file4.mv";
connectAttr "place2dTexture4.s" "file4.s";
connectAttr "place2dTexture4.wu" "file4.wu";
connectAttr "place2dTexture4.wv" "file4.wv";
connectAttr "place2dTexture4.re" "file4.re";
connectAttr "place2dTexture4.of" "file4.of";
connectAttr "place2dTexture4.r" "file4.ro";
connectAttr "place2dTexture4.n" "file4.n";
connectAttr "place2dTexture4.vt1" "file4.vt1";
connectAttr "place2dTexture4.vt2" "file4.vt2";
connectAttr "place2dTexture4.vt3" "file4.vt3";
connectAttr "place2dTexture4.vc1" "file4.vc1";
connectAttr "place2dTexture4.o" "file4.uv";
connectAttr "place2dTexture4.ofs" "file4.fs";
connectAttr "|pPlane11|polySurfaceShape20.o" "polyTriangulate6.ip";
connectAttr "polyTweak13.out" "polyMergeVert5.ip";
connectAttr "pCubeShape5.wm" "polyMergeVert5.mp";
connectAttr "polyCube4.out" "polyTweak13.ip";
connectAttr "polyTweak14.out" "polyMergeVert6.ip";
connectAttr "pCubeShape5.wm" "polyMergeVert6.mp";
connectAttr "polyMergeVert5.out" "polyTweak14.ip";
connectAttr "polyMergeVert6.out" "polyTweak15.ip";
connectAttr "polyTweak15.out" "transformGeometry1.ig";
connectAttr "transformGeometry1.og" "polyAutoProj2.ip";
connectAttr "pCubeShape5.wm" "polyAutoProj2.mp";
connectAttr "polyAutoProj2.out" "groupParts4.ig";
connectAttr "groupId5.id" "groupParts4.gi";
connectAttr "pCubeShape7.o" "polyUnite1.ip[0]";
connectAttr "pCubeShape6.o" "polyUnite1.ip[1]";
connectAttr "pCubeShape5.o" "polyUnite1.ip[2]";
connectAttr "pCubeShape7.wm" "polyUnite1.im[0]";
connectAttr "pCubeShape6.wm" "polyUnite1.im[1]";
connectAttr "pCubeShape5.wm" "polyUnite1.im[2]";
connectAttr "polyUnite1.out" "transformGeometry2.ig";
connectAttr "polyTweak16.out" "polyMergeVert7.ip";
connectAttr "polySurfaceShape21.wm" "polyMergeVert7.mp";
connectAttr "transformGeometry2.og" "polyTweak16.ip";
connectAttr "polyTweak17.out" "polyMergeVert8.ip";
connectAttr "polySurfaceShape21.wm" "polyMergeVert8.mp";
connectAttr "polyMergeVert7.out" "polyTweak17.ip";
connectAttr "polyTweak18.out" "polyMergeVert9.ip";
connectAttr "polySurfaceShape21.wm" "polyMergeVert9.mp";
connectAttr "polyMergeVert8.out" "polyTweak18.ip";
connectAttr "polyTweak19.out" "polyMergeVert10.ip";
connectAttr "polySurfaceShape21.wm" "polyMergeVert10.mp";
connectAttr "polyMergeVert9.out" "polyTweak19.ip";
connectAttr "polyTweak20.out" "polyMergeVert11.ip";
connectAttr "polySurfaceShape21.wm" "polyMergeVert11.mp";
connectAttr "polyMergeVert10.out" "polyTweak20.ip";
connectAttr "polyTweak21.out" "polyMergeVert12.ip";
connectAttr "polySurfaceShape21.wm" "polyMergeVert12.mp";
connectAttr "polyMergeVert11.out" "polyTweak21.ip";
connectAttr "polyMergeVert12.out" "polyExtrudeFace13.ip";
connectAttr "polySurfaceShape21.wm" "polyExtrudeFace13.mp";
connectAttr "polyExtrudeFace13.out" "polyTriangulate7.ip";
connectAttr "mirror.oc" "mirror1.ss";
connectAttr "polySurfaceShape21.iog" "mirror1.dsm" -na;
connectAttr "mirror1.msg" "materialInfo8.sg";
connectAttr "mirror.msg" "materialInfo8.m";
connectAttr "light_trail.oc" "light_trail1.ss";
connectAttr "pPlaneShape17.iog" "light_trail1.dsm" -na;
connectAttr "pPlaneShape18.iog" "light_trail1.dsm" -na;
connectAttr "pCubeShape2.iog.og[1]" "light_trail1.dsm" -na;
connectAttr "pPlaneShape19.iog.og[0]" "light_trail1.dsm" -na;
connectAttr "pPlaneShape19.ciog.cog[0]" "light_trail1.dsm" -na;
connectAttr "pPlaneShape20.iog.og[0]" "light_trail1.dsm" -na;
connectAttr "pPlaneShape20.ciog.cog[0]" "light_trail1.dsm" -na;
connectAttr "polySurfaceShape23.iog.og[0]" "light_trail1.dsm" -na;
connectAttr "groupId14.msg" "light_trail1.gn" -na;
connectAttr "groupId15.msg" "light_trail1.gn" -na;
connectAttr "groupId16.msg" "light_trail1.gn" -na;
connectAttr "groupId17.msg" "light_trail1.gn" -na;
connectAttr "groupId18.msg" "light_trail1.gn" -na;
connectAttr "groupId19.msg" "light_trail1.gn" -na;
connectAttr "light_trail1.msg" "materialInfo9.sg";
connectAttr "light_trail.msg" "materialInfo9.m";
connectAttr "polyTweak22.out" "polyExtrudeEdge1.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge1.mp";
connectAttr "polyPlane2.out" "polyTweak22.ip";
connectAttr "polyTweak23.out" "polyExtrudeEdge2.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge2.mp";
connectAttr "polyExtrudeEdge1.out" "polyTweak23.ip";
connectAttr "polyExtrudeEdge2.out" "polyExtrudeEdge3.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge3.mp";
connectAttr "polyExtrudeEdge3.out" "polyExtrudeEdge4.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge4.mp";
connectAttr "polyTweak24.out" "polyExtrudeEdge5.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge5.mp";
connectAttr "polyExtrudeEdge4.out" "polyTweak24.ip";
connectAttr "polyTweak25.out" "polyExtrudeEdge6.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge6.mp";
connectAttr "polyExtrudeEdge5.out" "polyTweak25.ip";
connectAttr "polyExtrudeEdge6.out" "polyExtrudeEdge7.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge7.mp";
connectAttr "polyTweak26.out" "polyExtrudeEdge8.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge8.mp";
connectAttr "polyExtrudeEdge7.out" "polyTweak26.ip";
connectAttr "polyExtrudeEdge8.out" "polyExtrudeEdge9.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeEdge9.mp";
connectAttr "|pPlane18|polySurfaceShape22.o" "polyExtrudeFace14.ip";
connectAttr "pPlaneShape18.wm" "polyExtrudeFace14.mp";
connectAttr "polyTweak27.out" "polyExtrudeFace15.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeFace15.mp";
connectAttr "polyExtrudeEdge9.out" "polyTweak27.ip";
connectAttr "polyExtrudeFace14.out" "transformGeometry3.ig";
connectAttr "transformGeometry3.og" "polyExtrudeFace16.ip";
connectAttr "pPlaneShape18.wm" "polyExtrudeFace16.mp";
connectAttr "polyExtrudeFace15.out" "polyExtrudeFace17.ip";
connectAttr "pPlaneShape17.wm" "polyExtrudeFace17.mp";
connectAttr "polyExtrudeFace17.out" "polyTriangulate8.ip";
connectAttr "polyExtrudeFace16.out" "polyTriangulate9.ip";
connectAttr "polyTweak28.out" "polyExtrudeEdge10.ip";
connectAttr "pCubeShape2.wm" "polyExtrudeEdge10.mp";
connectAttr "deleteComponent6.og" "polyTweak28.ip";
connectAttr "polyExtrudeEdge10.out" "groupParts5.ig";
connectAttr "groupId12.id" "groupParts5.gi";
connectAttr "groupParts5.og" "groupParts6.ig";
connectAttr "groupId14.id" "groupParts6.gi";
connectAttr "polyTweak29.out" "polyTriangulate10.ip";
connectAttr "groupParts6.og" "polyTweak29.ip";
connectAttr "pPlaneShape19.o" "polyUnite2.ip[0]";
connectAttr "pPlaneShape20.o" "polyUnite2.ip[1]";
connectAttr "pPlaneShape19.wm" "polyUnite2.im[0]";
connectAttr "pPlaneShape20.wm" "polyUnite2.im[1]";
connectAttr "polyUnite2.out" "groupParts7.ig";
connectAttr "groupId19.id" "groupParts7.gi";
connectAttr "mace:initialShadingGroup.pa" ":renderPartition.st" -na;
connectAttr "phong_glowymat.pa" ":renderPartition.st" -na;
connectAttr "light_fuglyStuff.pa" ":renderPartition.st" -na;
connectAttr "phong1SG.pa" ":renderPartition.st" -na;
connectAttr "phong3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "phongSG2.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "mirror1.pa" ":renderPartition.st" -na;
connectAttr "light_trail1.pa" ":renderPartition.st" -na;
connectAttr "pPlaneShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape9.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape8.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pPlaneShape7.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape5.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape6.ciog.cog[1]" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape7.ciog.cog[2]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId5.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId6.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId8.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId10.msg" ":initialShadingGroup.gn" -na;
connectAttr "mace:initialShadingGroup1.msg" ":defaultShaderList1.s" -na;
connectAttr "phong2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "phong1.msg" ":defaultShaderList1.s" -na;
connectAttr "phong3.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "phong4.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "mirror.msg" ":defaultShaderList1.s" -na;
connectAttr "light_trail.msg" ":defaultShaderList1.s" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.oc" ":lambert1.c";
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "file3.msg" ":initialMaterialInfo.t" -na;
// End of theScene.ma
