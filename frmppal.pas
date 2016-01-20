unit frmppal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBCtrl, dxTL, dxDBTLCl, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, dxCntner, dxDBTL, Menus, 
  ComCtrls, ExtCtrls,sCustomMenuManager, jpeg, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppVar, ppPrnabl, ppBands,
  ppCache, ppModule, raCodMod, ppParameter, StdCtrls, Animate, GIFCtrl,
  ppStrtch, ppRichTx;

type
  Tfrmprin = class(TForm)
    menup: TMainMenu;
    PERSONAL1: TMenuItem;
    CONSULTA1: TMenuItem;
    Personal2: TMenuItem;
    mov: TMenuItem;
    Acercade1: TMenuItem;
    Salir1: TMenuItem;
    Reportes1: TMenuItem;
    bs: TStatusBar;
    Administrativo1: TMenuItem;
    depe: TMenuItem;
    OCZEB1: TMenuItem;
    GenerarOC1: TMenuItem;
    Actualizar2: TMenuItem;
    consulta2: TMenuItem;
    Personal3: TMenuItem;
    N10: TMenuItem;
    Ingresos2: TMenuItem;
    ListadoCaracas1: TMenuItem;
    Credenciales1: TMenuItem;
    IngresosxMovimientos1: TMenuItem;
    N13: TMenuItem;
    N16: TMenuItem;
    N12: TMenuItem;
    N18: TMenuItem;
    Menu1: TMenuItem;
    General1: TMenuItem;
    Saliente1: TMenuItem;
    N26: TMenuItem;
    Image3: TImage;
    Proveedores2: TMenuItem;
    men: TsMenuManager;
    N3: TMenuItem;
    Zona1: TMenuItem;
    relaciondeMovimientosxDependencia1: TMenuItem;
    prod: TMenuItem;
    lista: TMenuItem;
    Administracion1: TMenuItem;
    Mantenimiento1: TMenuItem;
    Actualizacin1: TMenuItem;
    CONTROLDEESTUDIOS1: TMenuItem;
    taquilla1: TMenuItem;
    N1: TMenuItem;
    ControldeEstudios2: TMenuItem;
    Entregados1: TMenuItem;
    Pendientes1: TMenuItem;
    OrdendeCompra1: TMenuItem;
    Proveedores1: TMenuItem;
    Productos1: TMenuItem;
    Escuelas1: TMenuItem;
    GenerarOCxLote1: TMenuItem;
    Mens1: TMenuItem;
    RelacionOCxMunicipios1: TMenuItem;
    ActasdeEntrega1: TMenuItem;
    OrdendeCompraxMunicipios1: TMenuItem;
    MadresProcesadoras1: TMenuItem;
    Registro1: TMenuItem;
    ControldeAsistencia: TMenuItem;
    AsignaciondeDependencia: TMenuItem;
    Procesos1: TMenuItem;
    CalculodeNomina1: TMenuItem;
    CierredeNmina1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    MadresProcesadoras2: TMenuItem;
    RecibosdePago1: TMenuItem;
    ConsultasParamtricas1: TMenuItem;
    CambiarClave1: TMenuItem;
    PAE1: TMenuItem;
    Finanzas1: TMenuItem;
    RendirOC1: TMenuItem;
    RendicionOC1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    IngresodeControl1: TMenuItem;
    Consulta3: TMenuItem;
    N7: TMenuItem;
    Finanzas2: TMenuItem;
    RelacindeCheques1: TMenuItem;
    ConsolidadoCompromisoxProyecto1: TMenuItem;
    Caja1: TMenuItem;
    N8: TMenuItem;
    NominaGeneral1: TMenuItem;
    Gerenciales1: TMenuItem;
    ResumenOCGeneradasxMunicipio1: TMenuItem;
    ResumenOCRendidasxProyectp1: TMenuItem;
    ResumenOCRendidasxMunicipio1: TMenuItem;
    ResumenOCPagadasxProyecto1: TMenuItem;
    ResumenOCPagadasxMunicipio1: TMenuItem;
    Diaria1: TMenuItem;
    xFecha1: TMenuItem;
    ResumenOCAnuladasxProyecto1: TMenuItem;
    ResumendeOCAnuladasxMunicipio1: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    Caja2: TMenuItem;
    RelacionEntregaCheques1: TMenuItem;
    N17: TMenuItem;
    ResumenMadresxProyecto1: TMenuItem;
    ResumenMadresxMunicipio1: TMenuItem;
    ReportedeMadresxDependencia1: TMenuItem;
    con_madres: TZQuery;
    datamadres: TDataSource;
    pprepmadres: TppReport;
    ppmadres: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppVariable1: TppVariable;
    v2: TppVariable;
    v3: TppVariable;
    v4: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLabel9: TppLabel;
    tot_mat: TppLabel;
    tot_mad: TppLabel;
    tot_mon: TppLabel;
    tot_monf: TppLabel;
    raCodeModule1: TraCodeModule;
    datamadxproy: TDataSource;
    con_madxproy: TZQuery;
    ppreportemadxproy: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppImage3: TppImage;
    ppLabel11: TppLabel;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine15: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppDBPipeline1: TppDBPipeline;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine9: TppLine;
    ppLabel10: TppLabel;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppVariable5: TppVariable;
    raCodeModule2: TraCodeModule;
    tot: TppLabel;
    tot_mat2: TppLabel;
    tot_mad2: TppLabel;
    tot_mon2: TppLabel;
    tot_monf2: TppLabel;
    ppVariable6: TppVariable;
    ppLine11: TppLine;
    pprepmadxmun: TppReport;
    ppDBPipeline2: TppDBPipeline;
    con_madxmun: TZQuery;
    datamadxmun: TDataSource;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppLabel13: TppLabel;
    ppShape2: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine16: TppLine;
    ppLabel18: TppLabel;
    ppLine17: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppVariable7: TppVariable;
    ppLabel22: TppLabel;
    tot_mat3: TppLabel;
    tot_mad3: TppLabel;
    tot_mon3: TppLabel;
    tot_monf3: TppLabel;
    ppVariable8: TppVariable;
    ppVariable9: TppVariable;
    ppVariable10: TppVariable;
    ppVariable11: TppVariable;
    raCodeModule3: TraCodeModule;
    Proyecciones1: TMenuItem;
    MadresProcesadoras3: TMenuItem;
    Madres1: TMenuItem;
    OrdenesdeComprasInternas1: TMenuItem;
    Image1: TImage;
    Shape1: TShape;
    Image2: TImage;
    Image4: TImage;
    Shape2: TShape;
    Shape3: TShape;
    Productos2: TMenuItem;
    Proveedores3: TMenuItem;
    OCInternas1: TMenuItem;
    Auditoria1: TMenuItem;
    Listado1: TMenuItem;
    xProyecto1: TMenuItem;
    SoloPae1: TMenuItem;
    CantidaddeMovimientosxFechas1: TMenuItem;
    EvaluacionDocente1: TMenuItem;
    EvaluacionDocente2: TMenuItem;
    MatriculaTotal1: TMenuItem;
    BackupBD1: TMenuItem;
    Respaldar1: TMenuItem;
    resp: TRxGIFAnimator;
    RelacionOCxMunicipiosxProveedor1: TMenuItem;
    base: TShape;
    OrdenesdePago1: TMenuItem;
    ReporteRendiciondeMadres1: TMenuItem;
    PAE2: TMenuItem;
    Becas1: TMenuItem;
    RegistroyControldebecas1: TMenuItem;
    almacen: TMenuItem;
    Planteles1: TMenuItem;
    materiales: TMenuItem;
    registro: TMenuItem;
    Antropometricas1: TMenuItem;
    Alumnos1: TMenuItem;
    BienesNacionales1: TMenuItem;
    ActasdeEntrega2: TMenuItem;
    N19: TMenuItem;
    BienesNacionales2: TMenuItem;
    con_regmad: TZQuery;
    pprepregmad: TppReport;
    ppParameterList2: TppParameterList;
    ppregmad: TppDBPipeline;
    data_regmad: TDataSource;
    MadresRegistradas1: TMenuItem;
    ListadoGeneral1: TMenuItem;
    con_esc: TZQuery;
    ppescu: TppDBPipeline;
    dataesc: TDataSource;
    ppHeaderBand4: TppHeaderBand;
    ppImage4: TppImage;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel23: TppLabel;
    ppShape4: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    v1: TppVariable;
    r1: TppVariable;
    ppFooterBand4: TppFooterBand;
    ppLine24: TppLine;
    ppLabel31: TppLabel;
    tot_madres: TppLabel;
    tot_rep: TppLabel;
    raCodeModule4: TraCodeModule;
    pprepges: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppImage6: TppImage;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppLabel40: TppLabel;
    ppShape6: TppShape;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine38: TppLine;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLine39: TppLine;
    ppLabel51: TppLabel;
    tot_dep: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    var12: TppVariable;
    raCodeModule5: TraCodeModule;
    PlantelesPrivados1: TMenuItem;
    Planteles2: TMenuItem;
    Empleados1: TMenuItem;
    con_plantel: TZQuery;
    data_plantel: TDataSource;
    repplanp: TppReport;
    ppParameterList3: TppParameterList;
    ppreplantel: TppDBPipeline;
    PlantelesPrivados2: TMenuItem;
    Dependencias1: TMenuItem;
    Empleados2: TMenuItem;
    Nmina1: TMenuItem;
    ppHeaderBand5: TppHeaderBand;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLabel29: TppLabel;
    ppShape5: TppShape;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLine23: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLine30: TppLine;
    ppImage5: TppImage;
    ppLabel41: TppLabel;
    ppLine40: TppLine;
    ppLabel56: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText37: TppDBText;
    ppVariable12: TppVariable;
    ppFooterBand5: TppFooterBand;
    ppLine31: TppLine;
    ppLabel42: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel55: TppLabel;
    tot_depp: TppLabel;
    raCodeModule6: TraCodeModule;
    con_empp: TZQuery;
    data_empp: TDataSource;
    ppDBPipeline3: TppDBPipeline;
    repemp: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppLabel52: TppLabel;
    ppShape7: TppShape;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLine41: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLabel63: TppLabel;
    ppLine47: TppLine;
    ppImage7: TppImage;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine49: TppLine;
    ppLabel67: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppLabel68: TppLabel;
    ppParameterList4: TppParameterList;
    ppLabel69: TppLabel;
    ppDBText47: TppDBText;
    ppLabel70: TppLabel;
    ppDBText42: TppDBText;
    ppLine50: TppLine;
    ppLine42: TppLine;
    ppVariable13: TppVariable;
    Tot_empp: TppLabel;
    raCodeModule7: TraCodeModule;
    SumarioOCPAE1: TMenuItem;
    General2: TMenuItem;
    xproveedor1: TMenuItem;
    itularidad1: TMenuItem;
    ppLabel59: TppLabel;
    ppDBText46: TppDBText;
    ppDBText48: TppDBText;
    ConfiguraciondePresupuesto1: TMenuItem;
    OCRendidas1: TMenuItem;
    OCGeneradas1: TMenuItem;
    SoporteTcnico1: TMenuItem;
    SistemaSoporteTcnico1: TMenuItem;
    PlanimetriadeRed1: TMenuItem;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    itulos1: TMenuItem;
    RelacindeTtulos1: TMenuItem;
    con_listit: TZQuery;
    datalistit: TDataSource;
    pplistit: TppDBPipeline;
    replistit: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppDetailBand8: TppDetailBand;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLabel79: TppLabel;
    ppImage8: TppImage;
    ppSystemVariable18: TppSystemVariable;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppLabel80: TppLabel;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText62: TppDBText;
    AutenticaciondeTtulos1: TMenuItem;
    ppreptitfn: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppImage9: TppImage;
    ppDetailBand9: TppDetailBand;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppFooterBand9: TppFooterBand;
    pptitfn: TppDBPipeline;
    con_titfn: TZQuery;
    datatitfn: TDataSource;
    ppLabel72: TppLabel;
    ppLabel64: TppLabel;
    ppLabel71: TppLabel;
    ppLabel73: TppLabel;
    ppSystemVariable21: TppSystemVariable;
    ppLabel74: TppLabel;
    ppSystemVariable22: TppSystemVariable;
    ppSystemVariable23: TppSystemVariable;
    ppLabel75: TppLabel;
    ppRichText1: TppRichText;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel76: TppLabel;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppShape25: TppShape;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppShape26: TppShape;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    MisionRibas1: TMenuItem;
    HojasdeRegistro1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure CONSULTA1Click(Sender: TObject);
    procedure Actualizar2Click(Sender: TObject);
    procedure Ingresos2Click(Sender: TObject);
    procedure ListadoCaracas1Click(Sender: TObject);
    procedure Credenciales1Click(Sender: TObject);
    procedure IngresosxMovimientos1Click(Sender: TObject);
    procedure General1Click(Sender: TObject);
    procedure Saliente1Click(Sender: TObject);
    procedure Proveedores2Click(Sender: TObject);
    procedure Zona1Click(Sender: TObject);
    procedure relaciondeMovimientosxDependencia1Click(Sender: TObject);
    procedure depeClick(Sender: TObject);
    procedure prodClick(Sender: TObject);
    procedure Mantenimiento1Click(Sender: TObject);
    procedure listaClick(Sender: TObject);
    procedure taquilla1Click(Sender: TObject);
    procedure Entregados1Click(Sender: TObject);
    procedure Pendientes1Click(Sender: TObject);
    procedure Actualizacin1Click(Sender: TObject);
    procedure GenerarOC1Click(Sender: TObject);
    procedure OrdendeCompra1Click(Sender: TObject);
    procedure Proveedores1Click(Sender: TObject);
    procedure Productos1Click(Sender: TObject);
    procedure GenerarOCxLote1Click(Sender: TObject);
    procedure Mens1Click(Sender: TObject);
    procedure RelacionOCxMunicipios1Click(Sender: TObject);
    procedure ActasdeEntrega1Click(Sender: TObject);
    procedure OrdendeCompraxMunicipios1Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure AsignaciondeDependenciaClick(Sender: TObject);
    procedure CalculodeNomina1Click(Sender: TObject);
    procedure CierredeNmina1Click(Sender: TObject);
    procedure RecibosdePago1Click(Sender: TObject);
    procedure ConsultasParamtricas1Click(Sender: TObject);
    procedure ControldeAsistenciaClick(Sender: TObject);
    procedure CambiarClave1Click(Sender: TObject);
    procedure RendirOC1Click(Sender: TObject);
    procedure IngresodeControl1Click(Sender: TObject);
    procedure Consulta3Click(Sender: TObject);
    procedure OCPagadas1Click(Sender: TObject);
    procedure ConsolidadoCompromisoxProyecto1Click(Sender: TObject);
    procedure NominaGeneral1Click(Sender: TObject);
    procedure ResumenOCGeneradasxMunicipio1Click(Sender: TObject);
    procedure Diaria1Click(Sender: TObject);
    procedure xFecha1Click(Sender: TObject);
    procedure ResumenOCRendidasxProyectp1Click(Sender: TObject);
    procedure ResumenOCRendidasxMunicipio1Click(Sender: TObject);
    procedure ResumenOCPagadasxProyecto1Click(Sender: TObject);
    procedure ResumenOCPagadasxMunicipio1Click(Sender: TObject);
    procedure ResumenOCAnuladasxProyecto1Click(Sender: TObject);
    procedure ResumendeOCAnuladasxMunicipio1Click(Sender: TObject);
    procedure Caja1Click(Sender: TObject);
    procedure RelacionEntregaCheques1Click(Sender: TObject);
    procedure ResumenMadresxProyecto1Click(Sender: TObject);
    procedure ResumenMadresxMunicipio1Click(Sender: TObject);
    procedure ReportedeMadresxDependencia1Click(Sender: TObject);
    procedure ppLabel9Print(Sender: TObject);
    procedure totPrint(Sender: TObject);
    procedure ppLabel22Print(Sender: TObject);
    procedure Madres1Click(Sender: TObject);
    procedure MadresProcesadoras3Click(Sender: TObject);
    procedure OCInternas1Click(Sender: TObject);
    procedure Productos2Click(Sender: TObject);
    procedure Proveedores3Click(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
    procedure Listado1Click(Sender: TObject);
    procedure xProyecto1Click(Sender: TObject);
    procedure SoloPae1Click(Sender: TObject);
    procedure CantidaddeMovimientosxFechas1Click(Sender: TObject);
    procedure EvaluacionDocente2Click(Sender: TObject);
    procedure MatriculaTotal1Click(Sender: TObject);
    function EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;
    procedure FormShow(Sender: TObject);
    procedure Respaldar1Click(Sender: TObject);
    procedure RelacionOCxMunicipiosxProveedor1Click(Sender: TObject);
    procedure OrdenesdePago1Click(Sender: TObject);
    procedure RelacindeCheques1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RegistroyControldebecas1Click(Sender: TObject);
    procedure Planteles1Click(Sender: TObject);
    procedure registroClick(Sender: TObject);
    procedure actinventaClick(Sender: TObject);
    procedure Alumnos1Click(Sender: TObject);
    procedure ActasdeEntrega2Click(Sender: TObject);
    procedure BienesNacionales2Click(Sender: TObject);
    procedure MadresRegistradas1Click(Sender: TObject);
    procedure ppLabel31Print(Sender: TObject);
    procedure ListadoGeneral1Click(Sender: TObject);
    procedure ppDBText28GetText(Sender: TObject; var Text: String);
    procedure ppLabel51Print(Sender: TObject);
    procedure Planteles2Click(Sender: TObject);
    procedure Empleados1Click(Sender: TObject);
    procedure ppDBText37GetText(Sender: TObject; var Text: String);
    procedure Dependencias1Click(Sender: TObject);
    procedure ppDBText45GetText(Sender: TObject; var Text: String);
    procedure Empleados2Click(Sender: TObject);
    procedure Nmina1Click(Sender: TObject);
    procedure General2Click(Sender: TObject);
    procedure xproveedor1Click(Sender: TObject);
    procedure itularidad1Click(Sender: TObject);
    procedure ConfiguraciondePresupuesto1Click(Sender: TObject);
    procedure OCGeneradas1Click(Sender: TObject);
    procedure OCRendidas1Click(Sender: TObject);
    procedure SistemaSoporteTcnico1Click(Sender: TObject);
    procedure PlanimetriadeRed1Click(Sender: TObject);
    procedure itulos1Click(Sender: TObject);
    procedure RelacindeTtulos1Click(Sender: TObject);
    procedure AutenticaciondeTtulos1Click(Sender: TObject);
    procedure HojasdeRegistro1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprin: Tfrmprin;

implementation

uses frmusuarios, frmacces, frmmovi, frming, frmrep, frmcred,
  frmlistaxtipomov, frmmovis, frmzeb, frmprove, frmgrupos, frmescu,
  frmrepxde, frmproductos, frmmenus, frmlistapre, frmcontroles,
  frmrepcones, frmreppencones, frmescpromen, frmocompra, frmocgeneral,
  frmreporoc, frmreppro, frmrepprod, frmrepescu, frmocxlot, frmrepmenu,
  repocmp, frmrepacen, frmrepocxm, frmacercade, frmCalculoPagos,
  frmConsultasParametricas, frmAsignacionDependencia, frmCierreNomina,
  frmControlAsistencia, frmModMadreProcesadora, frmNewRegMadre,
  frmRecibosdePago, frmRegistrarMadres, frmcclave,
  frmrendicion, frmcocrendi, frrmreprend, frmocpagadas, frmconcheq,
  frmrepcocon, frmNominaGeneral, frmrenxfec, frmrepocgenxmun,
  frmreprenxproy, frmreprenxmun, frmreppagxproy, frmreppagxmun,
  frmrepanulxproy, frmrepanulxmun, frmcaja, frmrepchequeen,
  frmrepproyeccionmad, frmrepproyeccionpae, frmocint, frmprodocint,
  frmprovint, frmrepcred2, frmrepana, frmrepdepxproy, frmrepescsolopae,
  frmrepmxf,frmbproint, frmvacantes, frmrepmatt, ShellAPI, repocmpxesc,
  frmmanordpago, frmreprenoppae, unitfrmbecas, frmalum, frmbnac,
  frmrepbnac, frmpprivados, frmempleadosplapriv, frmplanprivados,
  frmreportedepp, frmrepsumpae, frmbus, frmrepsumpaexpro, frmtitu,
  frmconfpre, frmocgeneradas, frmlistaocren, frmsoporte, frmplanillas,
  frmtitulosmribas, frmhojareg;

{$R *.dfm}
//***
function Tfrmprin.EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;
var
sAplicacion: array[0..512] of char;  
DirectorioActual: array[0..255] of char;  
DirectorioTrabajo: String;
InformacionInicial: TStartupInfo;  
InformacionProceso: TProcessInformation;  
iResultado, iCodigoSalida: DWord;
begin  
StrPCopy( sAplicacion, sPrograma );
GetDir( 0, DirectorioTrabajo );
StrPCopy( DirectorioActual, DirectorioTrabajo );  
FillChar( InformacionInicial, Sizeof( InformacionInicial ), #0 );
InformacionInicial.cb := Sizeof( InformacionInicial );
InformacionInicial.dwFlags := STARTF_USESHOWWINDOW;
InformacionInicial.wShowWindow := Visibilidad;  
CreateProcess( nil, sAplicacion, nil, nil, False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,nil, nil, InformacionInicial, InformacionProceso );  // Espera hasta que termina la ejecución
repeat
iCodigoSalida := WaitForSingleObject( InformacionProceso.hProcess, 1000 );
Application.ProcessMessages;

until ( iCodigoSalida <> WAIT_TIMEOUT );  
GetExitCodeProcess( InformacionProceso.hProcess, iResultado );  
MessageBeep( 0 );  
CloseHandle( InformacionProceso.hProcess );  
Result := iResultado;
end;


//***

procedure Tfrmprin.Salir1Click(Sender: TObject);
begin
close;
frmacceso.Close;
end;

procedure Tfrmprin.CONSULTA1Click(Sender: TObject);
begin
if (frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15) then
begin
    frmgrup.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;




procedure Tfrmprin.Actualizar2Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
    frmin.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Ingresos2Click(Sender: TObject);
begin
  if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
  begin
    frmrepin.ShowModal
  end
  else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ListadoCaracas1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
  frmcred2.showmodal
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Credenciales1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
  frmcre.ShowModal
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.IngresosxMovimientos1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
   frmlisxtm.ShowModal
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.General1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10))  then
begin
    frmmov.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Saliente1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
    frmmovps.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Proveedores2Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmprov.ShowModal
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Zona1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15))then
begin
    frmzona.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.relaciondeMovimientosxDependencia1Click(
  Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
    frmrepxdep.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.depeClick(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmesc.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.prodClick(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmprod.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Mantenimiento1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmmenu.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.listaClick(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmlistaprecios.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.taquilla1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) then
begin
  frmimppla.ShowModal;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Entregados1Click(Sender: TObject);
begin
 if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) then
begin
  frmrepce.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Pendientes1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) then
begin
  frmreppcones.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Actualizacin1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmescprovmen.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.GenerarOC1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmocgen.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.OrdendeCompra1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmrepoc.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Proveedores1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmrepro.showmodal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Productos1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmreprod.Showmodal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.GenerarOCxLote1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmocxlote.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Mens1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmrepmen.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.RelacionOCxMunicipios1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmocxmunp.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ActasdeEntrega1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmrepace.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.OrdendeCompraxMunicipios1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmrepocxmu.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Acercade1Click(Sender: TObject);
 procedure ShowFormAnimated(TheForm:TForm);
   begin
     TheForm.BringToFront;
     AnimateWindow(TheForm.Handle,2000,AW_CENTER);
     TheForm.Show;
   end;

 begin
   //Ocultamos Form1
   frmacerde.Hide;

   //La mostramos con animacion
   ShowFormAnimated(frmacerde);

end;

procedure Tfrmprin.Registro1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
 objfrmRegistrarMadres.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
 
end;

procedure Tfrmprin.AsignaciondeDependenciaClick(Sender: TObject);
begin


if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
 objfrmAsignacionDependencia.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.CalculodeNomina1Click(Sender: TObject);
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
 objfrmCalculoPagos.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.CierredeNmina1Click(Sender: TObject);
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
 objfrmCierreNomina.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.RecibosdePago1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))  then
begin
 objfrmRecibosdePago.ShowModal;
end
else
 application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);


end;


procedure Tfrmprin.ConsultasParamtricas1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))  then
begin
 objfrmConsultasparametricas.ShowModal;
end 
else
 application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ControldeAsistenciaClick(Sender: TObject);
begin

if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
 objfrmControlAsistencia.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.CambiarClave1Click(Sender: TObject);
begin
frmcamclave.ShowModal;
end;

procedure Tfrmprin.RendirOC1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmcocren.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.IngresodeControl1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
begin
  frmocpag.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Consulta3Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
begin
  frmconche.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.OCPagadas1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
begin

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ConsolidadoCompromisoxProyecto1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
   begin
     frmrepcomcon.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.NominaGeneral1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))  then
begin
 objfrmNominaGeneral.ShowModal;
end 
else
 application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ResumenOCGeneradasxMunicipio1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
   begin
    frmocgenxmun.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Diaria1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmrelren.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.xFecha1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmrendxfec.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ResumenOCRendidasxProyectp1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
   begin
     frmrepcoren.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ResumenOCRendidasxMunicipio1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8))  then
   begin
       frmreprenxmuni.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ResumenOCPagadasxProyecto1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8))  then
   begin
     frmreppagxproye.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ResumenOCPagadasxMunicipio1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
   begin
      frmreppagxmuni.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ResumenOCAnuladasxProyecto1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
   begin
     frmrepanuxproy.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ResumendeOCAnuladasxMunicipio1Click(Sender: TObject);
begin
 if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
   begin
      frmrepanuxmun.ShowModal;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Caja1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=4) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
begin
   frmcajas.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.RelacionEntregaCheques1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=4) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
begin
   frmrepcheqen.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ResumenMadresxProyecto1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8))  then
   begin
   con_madxproy.Close;
   con_madxproy.Open;
   if not con_madxproy.IsEmpty then
   begin
      ppreportemadxproy.Print;
   end;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ResumenMadresxMunicipio1Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8))  then
   begin
   con_madxmun.Close;
   con_madxmun.Open;
   if not con_madxmun.IsEmpty then
   begin
      pprepmadxmun.Print;
   end;
   end
   else
     application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ReportedeMadresxDependencia1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))  then
begin
con_madres.Close;
con_madres.Open;
if not  con_madres.IsEmpty then
begin
  pprepmadres.Print;
end;
end
else
 application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ppLabel9Print(Sender: TObject);
begin
tot_mat.Text:=formatfloat('#,##0.',v2.AsDouble);
tot_mad.Text:=formatfloat('#,##0.',v3.AsDouble);
tot_mon.Text:=formatfloat('#,##0.00',v4.AsDouble);
tot_monf.Text:=formatfloat('#,##0.00',v4.AsDouble/1000);
end;

procedure Tfrmprin.totPrint(Sender: TObject);
begin
tot_mat2.Text:=formatfloat('#,##0.',ppVariable3.AsDouble);
tot_mad2.Text:=formatfloat('#,##0.',ppVariable4.AsDouble);
tot_mon2.Text:=formatfloat('#,##0.00',ppVariable5.AsDouble);
tot_monf2.Text:=formatfloat('#,##0.00',ppVariable6.AsDouble);
end;

procedure Tfrmprin.ppLabel22Print(Sender: TObject);
begin
tot_mat3.Text:=formatfloat('#,##0.',ppVariable8.AsDouble);
tot_mad3.Text:=formatfloat('#,##0.',ppVariable9.AsDouble);
tot_mon3.Text:=formatfloat('#,##0.00',ppVariable10.AsDouble);
tot_monf3.Text:=formatfloat('#,##0.00',ppVariable11.AsDouble);

end;

procedure Tfrmprin.Madres1Click(Sender: TObject);
begin
   frmproyeccmad.ShowModal;
end;

procedure Tfrmprin.MadresProcesadoras3Click(Sender: TObject);
begin
  frmpaeproy.ShowModal;
end;

procedure Tfrmprin.OCInternas1Click(Sender: TObject);
begin

   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=5) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 6))  then
begin
   frmocinte.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Productos2Click(Sender: TObject);
begin

  if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=5) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 6))  then
begin
   frmprodint.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Proveedores3Click(Sender: TObject);
begin

    if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=5) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 6))  then
begin
   frmproveint.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Auditoria1Click(Sender: TObject);
begin
 if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
  begin
    frmrepanalista.ShowModal;
  end
  else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.Listado1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmrepesc.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.xProyecto1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmrepescxproy.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);


end;

procedure Tfrmprin.SoloPae1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmrepspae.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.CantidaddeMovimientosxFechas1Click(Sender: TObject);
begin
 if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
  begin
    frmrepmovf.ShowModal;
  end
  else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.EvaluacionDocente2Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
   frmvac.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.MatriculaTotal1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmrepmt.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.FormShow(Sender: TObject);
begin
resp.Visible:=false;
base.Visible:=false;
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) then
  BackupBD1.Enabled:=true
else
  BackupBD1.Enabled:=false;

end;

procedure Tfrmprin.Respaldar1Click(Sender: TObject);
begin
 BackupBD1.Enabled:=true;
  resp.Visible:=true;
  base.Visible:=true;
  if EjecutarYEsperar( 'C:\respaldo.bat', SW_HIDE ) = 0 then
  begin
        resp.Visible:=false;
        base.Visible:=false;
        application.MessageBox( 'Respaldo Realizado....!','Mensaje al Usuario',32 );
  end
  else
  begin
        resp.Visible:=false;
        base.Visible:=false;
        application.MessageBox( 'Respaldo no Realizado...!','Mensaje al Usuario',16 );
  end;
end;

procedure Tfrmprin.RelacionOCxMunicipiosxProveedor1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmocmpxesc.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.OrdenesdePago1Click(Sender: TObject);
begin
 if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
begin
    frmordenpago.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.RelacindeCheques1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=8)) then
begin
    frmrepopp.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Salir1Click(Sender);
end;

procedure Tfrmprin.RegistroyControldebecas1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 21))  then
begin
   frmbecas.Show;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;



procedure Tfrmprin.Planteles1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger>2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 11))  then
begin

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.registroClick(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 11))  then
begin

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.actinventaClick(Sender: TObject);
begin
  if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=4) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 11))  then
begin

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.Alumnos1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmalu.ShowModal
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ActasdeEntrega2Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=5) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 11)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 6)) then
begin
    frmbn.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;



procedure Tfrmprin.BienesNacionales2Click(Sender: TObject);
begin
   if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=5) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 11)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 6)) then
begin
    frmrepbn.ShowModal
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.MadresRegistradas1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=2) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6))  then
begin
con_regmad.Close;
con_regmad.Open;
if not  con_regmad.IsEmpty then
begin
  pprepregmad.Print;
end;
end
else
 application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ppLabel31Print(Sender: TObject);
begin
tot_madres.Text:=formatfloat('#,##0.',v1.AsDouble);
tot_rep.Text:=formatfloat('#,##0.',r1.AsDouble);
end;

procedure Tfrmprin.ListadoGeneral1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   pprepges.Print;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ppDBText28GetText(Sender: TObject; var Text: String);
begin
tot_dep.Text:=formatfloat('#,##0.',var12.AsDouble);
end;

procedure Tfrmprin.ppLabel51Print(Sender: TObject);
begin
   tot_dep.Text:=formatfloat('#,##0.',var12.AsInteger);
end;

procedure Tfrmprin.Planteles2Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=3) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) then
begin
   frmplan_priv.ShowModal
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;
procedure Tfrmprin.Empleados1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=3) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) then
begin
   frm_nompp.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.ppDBText37GetText(Sender: TObject; var Text: String);
begin
tot_depp.Text:=formatfloat('#,##0.',ppvariable12.AsDouble);
end;

procedure Tfrmprin.Dependencias1Click(Sender: TObject);
begin
   con_plantel.Close;
   con_plantel.Open;
   repplanp.Print;
end;

procedure Tfrmprin.ppDBText45GetText(Sender: TObject; var Text: String);
begin
tot_empp.Text:=formatfloat('#,##0.',ppvariable13.AsDouble);
end;

procedure Tfrmprin.Empleados2Click(Sender: TObject);
begin
 con_empp.close;
 con_empp.Open;
 repemp.Print;
end;

procedure Tfrmprin.Nmina1Click(Sender: TObject);
begin
   frmreportedependencias.ShowModal;
end;

procedure Tfrmprin.General2Click(Sender: TObject);
begin
  if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=5) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 6))  then
begin
    frmspae.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.xproveedor1Click(Sender: TObject);
begin
  if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=5) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger= 6))  then
begin
   frmsumxp.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.itularidad1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
begin
    frmtit.showmodal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.ConfiguraciondePresupuesto1Click(Sender: TObject);
begin
//if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) or ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=10)) then
//begin
    frmconpre.showmodal;
//end
//else
//   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.OCGeneradas1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
   frmlistaocgen.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.OCRendidas1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=6)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger<=3) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=13)) then
begin
  frmlisocren.ShowModal;
end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

procedure Tfrmprin.SistemaSoporteTcnico1Click(Sender: TObject);
begin
ShellExecute(Handle,'open','http://10.5.75.10/soporte/soporte.php',nil,nil,SW_SHOW);
end;


procedure Tfrmprin.PlanimetriadeRed1Click(Sender: TObject);
begin
  form1.ShowModal;
end;

procedure Tfrmprin.itulos1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) then
begin
  frmtitulosmr.ShowModal;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.RelacindeTtulos1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) then
begin
  con_listit.Close;
  con_listit.Open;
  replistit.Print;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.AutenticaciondeTtulos1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) then
begin
  con_titfn.Close;
  con_titfn.Open;
  ppreptitfn.Print;

end
else
   application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);

end;

procedure Tfrmprin.HojasdeRegistro1Click(Sender: TObject);
begin
if ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) AND (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=15)) OR ((frmacceso.con_usu.FieldByName('NIVEL').AsInteger=1) and (frmacceso.con_usu.FieldByName('CODGRUPO').AsInteger=14)) then
begin
form2.ShowModal;
end
else
 application.MessageBox('Usuario NO Autorizado...!','Mensaje al Usuario',16);
end;

end.
