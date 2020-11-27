L = 160*membrane(1,100);
f = figure;
ax = axes;

ax.XLim = [1 201];
ax.YLim = [1 201];
ax.ZLim = [-53.4 160];

ax.CameraPosition = [-145.5 -229.7 283.6];
ax.CameraTarget = [77.4 60.2 63.9];
ax.CameraUpVector = [0 0 1];
ax.CameraViewAngle = 36.7;

ax.Position = [0 0 1 1];
ax.DataAspectRatio = [1 1 .9];

l1 = light;
l1.Position = [160 400 80];
l1.Style = 'local';
l1.Color = [0 0.8 0.8];
 
l2 = light;
l2.Position = [.5 -1 .4];
l2.Color = [0.8 0.8 0];

s = surface(L);
s.EdgeColor = 'none';
view(3)
