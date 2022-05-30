public with sharing class EmployerAltinnRight {
  public String serviceCode {get;set;}
  public String serviceEditionCode{get;set;}

  public EmployerAltinnRight(String serviceCode, String serviceEditionCode){
    this.serviceCode = serviceCode;
    this.serviceEditionCode = serviceEditionCode;
  }
}