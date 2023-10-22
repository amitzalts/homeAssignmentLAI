// ignore_for_file: constant_identifier_names
enum BiomarkersEnum {
  ALT('Alanine Aminotransferase (ALT)', 'U/L', 45.0, 0, false, 1),
  AlkalinePhosphatase('Alkaline Phosphatase', 'U/L', 120.0, 30.0, true, 1),
  AST('Aspartate Aminotransferase (AST)', 'U/L', 35.0, 0, false, 1),
  Glucose('Glucose', 'mg/dl', 106.0, 74.0, true, 1),
  HbA1c('Hemoglobin A1c (HbA1c)', 'mmol/mol', 18.0, 13.5, true, 1),
  HighSensitivityCReactiveProtein('High Sensitivity C-Reactive Protein', 'mg/L', 5.0, 0, false, 2),
  HDL('High-density Lipoprotein (HDL)', 'mg/dL', 200, 40.0, true, 1);

  const BiomarkersEnum(this.name, this.unitOfMeasurement, this.mainIndicator,
      this.secondaryIndicator, this.hasSecondaryIndicator, this.fixedPoint);

  final String name;
  final String unitOfMeasurement;
  final double mainIndicator;
  final double secondaryIndicator;
  final bool hasSecondaryIndicator;
  final int fixedPoint;
}
