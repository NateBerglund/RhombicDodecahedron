outputFolder = 'C:\Users\info\source\repos\RhombicDodecahedron';
outputFile = 'RhombicDodecahedraAlternateBase.stl';

baseVertices = [...
-6.0 6.0 -6.0;...
-6.0 -6.0 -6.0;...
0.0 0.0 -12.0;...
-6.0 -6.0 -6.0;...
-6.0 6.0 -6.0;...
-12.0 0.0 0.0;...
6.0 -6.0 -6.0;...
-6.0 -6.0 -6.0;...
0.0 -12.0 0.0;...
-6.0 -6.0 -6.0;...
6.0 -6.0 -6.0;...
0.0 0.0 -12.0;...
-6.0 -6.0 6.0;...
-6.0 -6.0 -6.0;...
-12.0 0.0 0.0;...
-6.0 -6.0 -6.0;...
-6.0 -6.0 6.0;...
0.0 -12.0 0.0];

rotation = pi / 4;
rotMatrix = [
  cos(rotation) -sin(rotation) 0; ...
  sin(rotation) cos(rotation) 0; ...
  0 0 1];

rotation2 = atan2(sqrt(2), 1);
rotMatrix2 = [...
 1 0 0;...
 0 cos(rotation2) -sin(rotation2);...
 0 sin(rotation2) cos(rotation2)];

fid = fopen([outputFolder '\' outputFile],'wt');
fprintf(fid, 'solid rhombicDodecahedron\n');
for zmult = 0:1
  for j = -2:2
    istart = -2;
    if (mod(j,2)==1)
      iend = 1;
    else
      iend = 2;
    endif
    if abs(j) ==2
      istart = -1;
      iend = 1;
    endif
    for i = istart:iend
      vertices = baseVertices;
      vertices = vertices * rotMatrix' * rotMatrix2';
      vertices = vertices  + ones(size(vertices,1),1) * [i*12*sqrt(2) j*6*sqrt(6) 6*sqrt(3)];
      if (mod(j,2)==1)
        vertices = vertices  + ones(size(vertices,1),1) * [6*sqrt(2) 0 0];
      end
      
      vertices(:,3) = zmult * vertices(:,3);
      
      fprintf(fid, 'facet normal 0.0 0.0 1.0\n');
      fprintf(fid, '    outer loop\n');
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(1,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(2,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(3,:));
      fprintf(fid, '    endloop\n');
      fprintf(fid, 'endfacet\n');
      fprintf(fid, 'facet normal 0.0 0.0 1.0\n');
      fprintf(fid, '    outer loop\n');
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(4,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(5,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(6,:));
      fprintf(fid, '    endloop\n');
      fprintf(fid, 'endfacet\n');
      fprintf(fid, 'facet normal 0.0 0.0 1.0\n');
      fprintf(fid, '    outer loop\n');
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(7,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(8,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(9,:));
      fprintf(fid, '    endloop\n');
      fprintf(fid, 'endfacet\n');
      fprintf(fid, 'facet normal 0.0 0.0 1.0\n');
      fprintf(fid, '    outer loop\n');
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(10,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(11,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(12,:));
      fprintf(fid, '    endloop\n');
      fprintf(fid, 'endfacet\n');
      fprintf(fid, 'facet normal 0.0 0.0 1.0\n');
      fprintf(fid, '    outer loop\n');
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(13,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(14,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(15,:));
      fprintf(fid, '    endloop\n');
      fprintf(fid, 'endfacet\n');
      fprintf(fid, 'facet normal 0.0 0.0 1.0\n');
      fprintf(fid, '    outer loop\n');
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(16,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(17,:));
      fprintf(fid, '        vertex %.3f %.3f %.3f\n', vertices(18,:));
      fprintf(fid, '    endloop\n');
      fprintf(fid, 'endfacet\n');
    end
  end
end
fprintf(fid, 'endsolid\n');
fclose(fid);

