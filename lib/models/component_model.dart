class Component {
  final String code;
  final String name;
  final String description;
  final String price;
  String? imagePath;

  Component(this.code, this.name, this.description, this.price,
      {this.imagePath = 'wild drop.png'});

  static List<Component> wildDropStandard = [
    Component(
      'DRP-OR-01',
      'Body',
      'Dimensions: 210X550X210 interior height : 140 cm',
      '0',
    ),
    Component(
      'DRP-OR-02',
      'Lighting',
      'Interior Lighting',
      '0',
    ),
    Component(
      'DRP-OR-03',
      'Luggage',
      '100 LT Special Luggage Section in the Cabin',
      '0',
    ),
    Component(
      'DRP-OR-04',
      'Window',
      'Openable Sliding Windows - Mosquito Net and Roller Blind System',
      '0',
    ),
    Component(
      'DRP-OR-05',
      'Fender',
      'Right-Left Wheel Top Fiber Fender',
      '0',
    ),
    Component(
      'DRP-OR-06',
      'Exterior Lighting',
      'Jokon Taillight And Reflectors',
      '0',
    ),
    Component(
      'DRP-OR-07',
      'Floor',
      'Soft Textured Interior Upholstery',
      '0',
    ),
    Component(
      'DRP-OR-08',
      'Electric System',
      '60A AGM GEL Battery, Battery Charger and Fuse Board',
      '0',
    ),
    Component(
      'DRP-OR-09',
      'Internal Electricity',
      '220 V Socket - 5 V USB Socket Port',
      '0',
    ),
    Component(
      'DRP-OR-10',
      'Rim - Tire',
      'Alloy Wheels 15' ' - All-Terrain Tires 195/70/R15',
      '0',
    ),
    Component(
      'DRP-OR-11',
      'Door - Frame',
      'Right-Left bidirectional entry',
      '0',
    ),
    Component(
      'DRP-OR-12',
      'Shovel',
      'Multifunctional Off Road Shovel',
      '0',
    ),
    Component(
      'DRP-OR-13',
      'Control Panel',
      '7' ' HMI Touch Control Panel',
      '0',
    ),
    Component(
      'DRP-OR-14',
      'Chassis',
      'AL-KO Imported Brake Axle 1000 kg',
      '0',
    ),
    Component(
      'DRP-OR-15',
      'Tube Holder',
      '250 LT Front External Storage Area',
      '0',
    ),
    Component(
      'DRP-OR-16',
      'Bed',
      '4 Piece Bed',
      '0',
    ),
  ];
  static final List<Component> wildDropExtra = [
    Component('DRP-ORO-01', 'Battery',
        '105 Amp AGM Gel Battery+D24:E39D24:ED24:E40', '150'),
    Component(
        'DRP-ORO-02', 'Alko Impact', 'ALKO Shock Absorber (2 Pieces)', '400'),
    Component('DRP-ORO-03', 'Alko Stabilizer', 'Alko Stabilizer', '700'),
    Component('DRP-ORO-04', 'Stairs', 'THULE Stairs ( 2PCS )', '550'),
    Component(
        'DRP-ORO-05', 'Refrigerator', 'DOMETIC REFRIGERATOR (14L)', '299'),
    Component('DRP-ORO-06', 'Refrigerator', 'ICE PEAK  REFRIGERATOR', '199'),
    Component('DRP-ORO-07', 'Double Color', 'DUAL COLOR EXTERIOR BODY', '799'),
    Component('DRP-ORO-08', 'Exterior Lighting',
        'JOKON ENVIRONMENT AND EXTERIOR LIGHTING', '150'),
    Component(
        'DRP-ORO-09', 'Outer Cover', 'DROPCAMP Offroad Outer Cover', '275'),
    Component('DRP-ORO-10', 'Shower', 'Outdoor Shower System', '200'),
    Component('DRP-ORO-11', 'Shower', 'Outdoor Shower Tent', '75'),
    Component('DRP-ORO-12', 'Solar Panel',
        'Portable Flexible Solar Panel 12 V 200 Watt SET', '2000'),
    Component('DRP-ORO-13', 'Ventilation', 'DOMETIC VENTILATION', '375'),
    Component('DRP-ORO-14', 'Ventilation', 'TYT BRAND SQUARE BRAND VENTILATION',
        '150'),
    Component('DRP-ORO-15', 'Combi', 'TRUMA 4E COMBI', '2750'),
    Component(
        'DRP-ORO-16', 'Kitchen', 'DOMETIC COOK SINK AND FOLDING FAUCET', '850'),
    Component(
        'DRP-ORO-17', 'Kitchen', 'SLIDING KITCHEN MODULE + CONNECTIONS', '199'),
    Component('DRP-ORO-18', 'Cook/Sink',
        'CAN Double Burner Cooker and Gas Installation', '625'),
    Component('DRP-ORO-19', 'Off-Road Bars',
        'Off-road Aggressive Protection Bars', '200'),
    Component('DRP-ORO-20', 'Color', 'METALLIC SPECIAL COLOR', '1750'),
    Component('DRP-ORO-21', 'Swatter', 'Large Cabin Swatter (2 Pieces)', '199'),
    Component('DRP-ORO-22', 'Stepne', 'Spare tire and Steel Rim', '500'),
    Component('DRP-ORO-23', 'Stepne Sheath', 'Spare Tire Case', '50'),
    Component(
        'DRP-ORO-24',
        'Stepne Carrying',
        'Spare Tire Metal Housing Front Forehead Offroad Type Connection',
        '150'),
    Component('DRP-ORO-25', 'Water Heating System',
        'Truma Term TT WATER HEATING SYSTEM', '399'),
    Component('DRP-ORO-26', 'Water System',
        'FULL SET + ASSEMBLY WITH 60 LT TANK', '399'),
    Component('DRP-ORO-27', 'Tent', 'THULE Tent', '1199'),
    Component('DRP-ORO-28', 'Gas Cylinder',
        'Gas Cylinder FOR SPECIAL GAS ENTRY KITCHEN AND HEATER', '200'),
    Component('DRP-ORO-29', 'WC', 'CASSETTE WC (PORTA POTTİ)', '125'),
    Component(
        'DRP-ORO-30', 'Webasto', 'Diesel Heating System (webasto)', '1350'),
  ];

  static final List<Component> widenDropStandard = [
    Component('DRP-M-1201', 'Body',
        'Dimensions: 210X550X210 interior height : 140 cm', '0'),
    Component('DRP-M-1502', 'Lighting', 'Interior Lighting', '0'),
    Component('DRP-M-1203', 'Luggage',
        '100 LT Special Luggage Section in the Cabin', '0'),
    Component('DRP-M-1204', 'Window',
        'Openable Sliding Windows - Mosquito Net and Roller Blind System', '0'),
    Component('DRP-M-1205', 'Fender', 'Right-Left Wheel Top Fiber Fender', '0'),
    Component('DRP-M-1506', 'Exterior Lighting',
        'Jokon Taillight And Reflectors', '0'),
    Component('DRP-M-1207', 'Floor', 'Soft Textured Interior Upholstery', '0'),
    Component('DRP-M-1508', 'Electric System',
        '60A AGM GEL Battery, Battery Charger and Fuse Board', '0'),
    Component('DRP-M-1509', 'Internal Electricity',
        '220 V Socket - 5 V USB Socket Port', '0'),
    Component('DRP-M-1210', 'Rim - Tire',
        'Alloy Wheels 15' ' - All-Terrain Tires 195/70/R15', '0'),
    Component(
        'DRP-M-1211', 'Door - Frame', 'Right-Left bidirectional entry', '0'),
    Component('DRP-M-1212', 'Module', 'Rear Opening Section as a Set', '0'),
    Component(
        'DRP-M-1513', 'Control Panel', '7' ' HMI Touch Control Panel', '0'),
    Component(
        'DRP-M-1214', 'Chassis', 'AL-KO Imported Brake Axle 1000 kg', '0'),
    Component(
        'DRP-M-1215', 'Tube Holder', '250 LT Front External Storage Area', '0'),
    Component('DRP-M-1216', 'Bed', '4 Piece Bed', '0'),
  ];
  static final List<Component> widenDropExtra = [
    Component('DRP-MO-1201', 'Battery',
        '105 Amp AGM Gel Battery+D24:E39D24:ED24:E40', '150'),
    Component(
        'DRP-MO-1202', 'Alko Impact', 'ALKO Shock Absorber (2 Pieces)', '400'),
    Component('DRP-MO-1203', 'Alko Stabilizer', 'Alko Stabilizer', '700'),
    Component('DRP-MO-1204', 'Stairs', 'THULE Stairs ( 2PCS )', '550'),
    Component(
        'DRP-MO-1305', 'Refrigerator', 'DOMETIC REFRIGERATOR (14L)', '299'),
    Component('DRP-MO-1306', 'Refrigerator', 'ICE PEAK  REFRIGERATOR', '199'),
    Component('DRP-MO-1207', 'Double Color', 'DUAL COLOR EXTERIOR BODY', '799'),
    Component('DRP-MO-1508', 'Exterior Lighting',
        'JOKON ENVIRONMENT AND EXTERIOR LIGHTING', '150'),
    Component(
        'DRP-MO-1209', 'Outer Cover', 'DROPCAMP Offroad Outer Cover', '275'),
    Component('DRP-MO-1210', 'Shower', 'Outdoor Shower System', '200'),
    Component('DRP-MO-1211', 'Shower', 'Outdoor Shower Tent', '75'),
    Component('DRP-MO-1512', 'Solar Panel',
        'Portable Flexible Solar Panel 12 V 200 Watt SET', '2000'),
    Component('DRP-MO-1513', 'Ventilation', 'DOMETIC VENTILATION', '375'),
    Component('DRP-MO-1514', 'Ventilation',
        'TYT BRAND SQUARE BRAND VENTILATION', '150'),
    Component('DRP-MO-1515', 'Combi', 'TRUMA 4E COMBI', '2750'),
    Component('DRP-MO-1316', 'Kitchen', 'DOMETIC COOK SINK AND FOLDING FAUCET',
        '850'),
    Component('DRP-MO-1217', 'Kitchen', 'SLIDING KITCHEN MODULE + CONNECTIONS',
        '199'),
    Component('DRP-MO-1318', 'Cook/Sink',
        'CAN Double Burner Cooker and Gas Installation', '625'),
    Component('DRP-MO-1219', 'Off-Road Bars',
        'Off-road Aggressive Protection Bars', '200'),
    Component('DRP-MO-1220', 'Color', 'METALLIC SPECIAL COLOR', '1750'),
    Component(
        'DRP-MO-1221', 'Swatter', 'Large Cabin Swatter (2 Pieces)', '199'),
    Component('DRP-MO-1222', 'Stepne', 'Spare tire and Steel Rim', '500'),
    Component('DRP-MO-1223', 'Stepne Sheath', 'Spare Tire Case', '50'),
    Component(
        'DRP-MO-1224',
        'Stepne Carrying',
        'Spare Tire Metal Housing Front Forehead Offroad Type Connection',
        '150'),
    Component('DRP-MO-1425', 'Water Heating System',
        'Truma Term TT WATER HEATING SYSTEM', '399'),
    Component('DRP-MO-1426', 'Water System',
        'FULL SET + ASSEMBLY WITH 60 LT TANK', '399'),
    Component('DRP-MO-1327', 'Tent', 'THULE Tent', '1199'),
    Component('DRP-MO-1328', 'Gas Cylinder',
        'Gas Cylinder FOR SPECIAL GAS ENTRY KITCHEN AND HEATER', '200'),
    Component('DRP-MO-1329', 'WC', 'CASSETTE WC (PORTA POTTİ)', '125'),
    Component(
        'DRP-MO-1330', 'Webasto', 'Diesel Heating System (webasto)', '1350'),
  ];
}
