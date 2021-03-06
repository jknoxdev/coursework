function createfigure(x1, y1)
%CREATEFIGURE(X1,Y1)
%  X1:  vector of x data
%  Y1:  vector of y data
 
%  Auto-generated by MATLAB on 19-Nov-2004 17:36:43
 
%% Create figure
figure1 = figure;
 
%% Create axes
axes1 = axes('Parent',figure1);
axis(axes1,[-6.5 1.5 -25 5]);
title(axes1,'Figure 1 - Measured Zener Diode I-V Characteristics');
xlabel(axes1,'E (V) of the Power Supply Voltage');
ylabel(axes1,'Iz (mA) Current of the Diode');
grid(axes1,'on');
hold(axes1,'all');
 
%% Create plot
plot1 = plot(x1,y1,'LineWidth',3);
 
%% Create arrow
annotation1 = annotation(figure1,'arrow',[0.7589 0.7589],[0.1167 0.8929]);
 
%% Create arrow
annotation2 = annotation(figure1,'arrow',[0.1286 0.8946],[0.7857 0.7881]);
 
%% Create textbox
annotation3 = annotation(...
  figure1,'textbox',...
  'Position',[0.6804 0.7746 0.075 0.0746],...
  'EdgeColor',[1 1 1],...
  'String',{'Vz'},...
  'FitHeightToText','on');
 
%% Create textbox
annotation4 = annotation(...
  figure1,'textbox',...
  'Position',[0.7714 0.6825 0.07857 0.0746],...
  'EdgeColor',[1 1 1],...
  'String',{'Iz'},...
  'FitHeightToText','on');
 
