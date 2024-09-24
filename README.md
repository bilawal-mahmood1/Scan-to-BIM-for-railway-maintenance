# A framework of Scan to BIM for geometric defect localization in railway track maintenance

This repository contains dataset of rail inner boundary lines and scripts files for processing rthese rails lines using Autodesk Civil 3D and Dynamo for Civil 3D. The key tasks include extracting the centerline alignment from boundary lines and calculating the gauge at 1-meter intervals along the rail, with results stored in an Excel file. The Dynamo script integrates these results into a Building Information Modeling (BIM) workflow.

## Requirements

To use the scripts in this repository, you will need the following software:

- Autodesk Civil 3D (tested on version 2023 or later)
- Dynamo for Civil 3D
- Microsoft Excel

## Files

- **`inner boundary lines on rail point cloud.dwg`**: This file contains the inner boundary lines extracted from the rail point cloud data.
- **`function for centerline alignment extraction.vlx`**: A custom function file to extract the centerline from the inner boundary lines.
- **`function for Gauge extraction.lsp`**: A Lisp routine to calculate the gauge (rail width) at 1-meter intervals by selecting two rail lines. The calculated values are stored in an Excel file.
- **`Dynamo file Integration of parameters into BIM.dyn`**: A Dynamo script for integrating gauge data into BIM by creating a property set at specified station chainages.

## Instructions to Use

### Loading Custom Functions in Civil 3D

1. Open Autodesk Civil 3D.
2. Use the `APpload` command to load the custom function files:
   - Load the `function for centerline alignment extraction.vlx` file to extract the centerline.
   - Load the `function for Gauge extraction.lsp` to calculate the gauge values.

### Steps for Centerline Extraction

1. Open the `inner boundary lines on rail point cloud.dwg` file in Civil 3D.
2. Run the `function for centerline alignment extraction.vlx` to extract the centerline of the inner boundary line.

### Steps for Gauge Calculation

1. After loading the `function for Gauge extraction.lsp` script, select two rail lines to calculate the gauge at 1-meter intervals.
2. The extracted gauge values will be saved in an Excel file.

### Integrating Gauge Data into BIM with Dynamo

1. Open Dynamo in Civil 3D.
2. Load the `Dynamo file Integration of parameters into BIM.dyn` file.
3. Specify the path to the Excel file containing the gauge data.
4. The Dynamo script will read the Excel file and assign the gauge values to the corresponding station chainages along the centerline.
5. Property sets will be created in Civil 3D to integrate the gauge values into the BIM model.

## Conclusion

This workflow streamlines the process of extracting and integrating rail gauge measurements from point cloud data into BIM using Autodesk Civil 3D and Dynamo. By automating the tasks of centerline extraction and gauge calculation, the scripts improve efficiency in geomtric maintenance of rail.
