%% Plot Results for FedBatch Operation
%
% (c) Klaus Schnitzlein - 18.11.2025

cin = simscape.Value([5,0,55],'mol/l');

figure(1)
c = retrieveLoggedData(simout,"Batch_Reactor.Across_Sensor","cout");
plot(simout.tout/3600,value(c(:,1),'mol/l')/value(cin(1),'mol/l'),'r',...
  simout.tout/3600,value(c(:,2),'mol/l')/value(cin(1),'mol/l'),'b',...
  'linewidth',2);
xlabel('t [hr]')
ylabel('c_i/c_{s_0} [mol/]')
set(gca,'linewidth',1.4,'fontsize',14)
grid
legend('Substrate','Biomass','location','best')
saveas(gcf,'Fig1.svg')

figure(2)
qin = retrieveLoggedData(simout,'Inflow.Velocity_Induced_Convection','qin');
qout = retrieveLoggedData(simout,'Outflow.Velocity_Induced_Convection','qin');
plot(simout.tout/3600,value(qin,'m^3/hr'),'r',...
  simout.tout/3600,value(qout,'m^3/hr'),'b',...
  'linewidth',2);
xlabel('t [hr]')
ylabel('q [m^3/hr]')
set(gca,'linewidth',1.4,'fontsize',14)
grid
legend('Inflow','Outflow','location','best')
saveas(gcf,'Fig2.svg')

figure(3)
V = retrieveLoggedData(simout,'Batch_Reactor.OpenVolume','Vout');
plot(simout.tout/3600,value(V,'m^3'),'r',...
  'linewidth',2);
xlabel('t [hr]')
ylabel('V [m^3]')
set(gca,'linewidth',1.4,'fontsize',14)
grid
saveas(gcf,'Fig3.svg')
