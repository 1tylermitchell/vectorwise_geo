Some SQL scripts and sample datasets to be included in showing how Vectorwise can be used for storing spatial data.

Sample data
-------------

* Nodes.csv and edges.csv are included as sample line networks to be used.
* See ogr_dumptopo.py from https://github.com/spatialguru/NME to create CSV output from decomposed vector data suitable for loading into Vectorwise.
* **01-make_topology.sql** - SQL script for creating tables, indices and views
* **02-load_topology.sh** - BASH script for running vwload command to push CSV files into the VW tables


