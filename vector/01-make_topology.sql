create table nodes ( nodeid int not null primary key, x float not null, y float not null, z float, edgefid int);
create index idx_nodes on nodes (nodeid, x,y);

create table edges ( edgeid int not null primary key, start_node_id int not null, end_node_id int not null, edgefid int);

create index idx_edges on edges (edgeid, start_node_id, end_node_id);

create table faces_tin ( faceid int not null primary key, name char, edge1_id int not null, edge2_id int not null, edge3_id int not null);
create index idx_faces_tin on faces_tin ( faceid, edge1_id, edge2_id, edge3_id);

create view  v_nodes as (SELECT *, 'POINT( ' || x || ' ' || y || ' )' wkt FROM nodes);

create view  v_edges AS ( SELECT e.edgeid, n1.x startx, n1.y starty, n2.x endx, n2.y endy, 'LINESTRING( ' || n1.x || ' ' || n1.y || ', ' || n2.x || ' ' || n2.y || ' )' wkt FROM edges e, nodes n1, nodes n2 WHERE e.start_node_id = n1.nodeid AND e.end_node_id = n2.nodeid);

create view  v_faces as (SELECT faceid, name, 'POLYGON(( ' || e1.startx || ' ' || e1.starty || ', ' || e2.startx || ' ' || e2.starty || ', ' || e3.startx || ' ' || e3.starty || ', ' || e1.startx || ' ' || e1.starty || ' ))' wkt FROM faces_tin f, v_edges e1, v_edges e2, v_edges e3 WHERE f.edge1_id = e1.edgeid AND f.edge2_id = e2.edgeid AND f.edge3_id = e3.edgeid);

\g\q
