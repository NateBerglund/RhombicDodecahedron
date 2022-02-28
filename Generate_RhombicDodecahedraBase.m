outputFolder = 'C:\Users\info\source\repos\RhombicDodecahedron';
outputFile = 'RhombicDodecahedraBase.stl';

baseVertices = [...
6.0 -6.0 -6.0;...
-6.0 -6.0 -6.0;...
0.0 0.0 -12.0;...
-6.0 -6.0 -6.0;...
-6.0 6.0 -6.0;...
0.0 0.0 -12.0;...
-6.0 6.0 -6.0;...
6.0 6.0 -6.0;...
0.0 0.0 -12.0;...
6.0 6.0 -6.0;...
6.0 -6.0 -6.0;...
0.0 0.0 -12.0] + [zeros(12,2) 12*ones(12,1)];

baseNormals = [...
0 -0.707106781186547 -0.707106781186547;...
-0.707106781186547 0 -0.707106781186547;...
0 0.707106781186547 -0.707106781186547;...
0.707106781186547 0 -0.707106781186547];

fid = fopen([outputFolder '\' outputFile],'wt');
fprintf(fid, 'solid rhombicDodecahedron\n');
for p = -1:2
  for q = -1:2
    i = p + q;
    j = p - q;
    vertices = baseVertices + ones(12,1) * [i*12 j*12 0];
    normals = baseNormals;   
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(1,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(2,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(4,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(5,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(6,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(3,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(7,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(8,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(9,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(4,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(10,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(11,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(12,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
  end
end
for p = 0:2
  for q = -1:1
    i = p + q;
    j = p - q - 1;
    vertices = baseVertices + ones(12,1) * [i*12 j*12 0];
    normals = baseNormals;   
    vertices(:,3) = -vertices(:,3) + 12;
    normals(:,3) = -normals(:,3);
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(1,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(2,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(4,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(5,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(6,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(3,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(7,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(8,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(9,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', normals(4,:));
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(10,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(11,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(12,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
  end
end

BorderVertices = [...
0 0 6;...
12 0 6;...
12 12 6];
rotationCenter = [12 0 0];
for rotation = ((0:3)*pi/2)
  rotMatrix = [
  cos(rotation) -sin(rotation) 0; ...
  sin(rotation) cos(rotation) 0; ...
  0 0 1];
  for p = -2:0
    i = p - 0.5;
    j = p + 2.5;
    vertices = BorderVertices + ones(3,1) * [i*12 j*12 0];  
    vertices = (vertices - ones(3,1) * rotationCenter) * rotMatrix + ones(3,1) * rotationCenter;
    fprintf(fid, 'facet normal %.3f %.3f %.3f\n', [0 0 1]);
    fprintf(fid, '    outer loop\n');
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
    fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
    fprintf(fid, '    endloop\n');
    fprintf(fid, 'endfacet\n');
  end
  vertices = [...
  6 42 6;...
  18 42 6;...
  12 48 6]; % note important corner
  vertices = (vertices - ones(3,1) * rotationCenter) * rotMatrix + ones(3,1) * rotationCenter
  fprintf(fid, 'facet normal %.3f %.3f %.3f\n', [0 0 1]);
  fprintf(fid, '    outer loop\n');
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
  fprintf(fid, '    endloop\n');
  fprintf(fid, 'endfacet\n');
end

cornerVertices = [...
12 48 6;...
60 0 6
12 -48 6
-36 0 6];

for p=0:3
  vertices = [cornerVertices(p+1,:); [cornerVertices(p+1,1:2) 0]; cornerVertices(mod(p+1, 4)+1,:)];
  fprintf(fid, 'facet normal %.3f %.3f %.3f\n', [0 0 1]);
  fprintf(fid, '    outer loop\n');
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
  fprintf(fid, '    endloop\n');
  fprintf(fid, 'endfacet\n');
  vertices = [[cornerVertices(p+1,1:2) 0]; [cornerVertices(mod(p+1, 4)+1,1:2) 0]; cornerVertices(mod(p+1, 4)+1,:)];
  fprintf(fid, 'facet normal %.3f %.3f %.3f\n', [0 0 1]);
  fprintf(fid, '    outer loop\n');
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
  fprintf(fid, '    endloop\n');
  fprintf(fid, 'endfacet\n');
end

  vertices = [...
  cornerVertices(1,1:2) 0;
  cornerVertices(2,1:2) 0;
  cornerVertices(3,1:2) 0];
  fprintf(fid, 'facet normal %.3f %.3f %.3f\n', [0 0 1]);
  fprintf(fid, '    outer loop\n');
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
  fprintf(fid, '    endloop\n');
  fprintf(fid, 'endfacet\n');
  
  vertices = [...
  cornerVertices(3,1:2) 0;
  cornerVertices(4,1:2) 0;
  cornerVertices(1,1:2) 0];
  fprintf(fid, 'facet normal %.3f %.3f %.3f\n', [0 0 1]);
  fprintf(fid, '    outer loop\n');
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
  fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
  fprintf(fid, '    endloop\n');
  fprintf(fid, 'endfacet\n');


fprintf(fid, 'endsolid\n');
fclose(fid);

