public with sharing class InputSanitizer {

    /* Validates organization number according to requirements specified
     on https://www.brreg.no/om-oss/registrene-vare/om-enhetsregisteret/organisasjonsnummeret/
     @param orgNumber organization number
     @return Returns true if provided input matches requirements.
    */
    public static boolean isValidNorwegianOrgNumber(String orgNumber){
        try {
            if(orgNumber == null){return false;}
            if(orgNumber.length()!=9){return false;}
            if (!orgNumber.containsOnly('1234567890')){return false;}

            List<String> numbers = orgNumber.split('');
            Integer weightedSum = Integer.valueOf(numbers[0]) * 3;
            weightedSum += (Integer.valueOf(numbers[1]) * 2);
            weightedSum += (Integer.valueOf(numbers[2]) * 7);
            weightedSum += (Integer.valueOf(numbers[3]) * 6);
            weightedSum += (Integer.valueOf(numbers[4]) * 5);
            weightedSum += (Integer.valueOf(numbers[5]) * 4);
            weightedSum += (Integer.valueOf(numbers[6]) * 3);
            weightedSum += (Integer.valueOf(numbers[7]) * 2);
            
            Integer remainder = math.mod(weightedSum, 11);
            Integer controlNumber = 11 - remainder;
           
            return controlNumber == Integer.valueOf(numbers[8]);
        
        } catch (TypeException e) {
            return false;
        }
    }

    public static boolean isValidContractExternalId(String contractExternalId){
        if(String.isBlank(contractExternalId)){return false;}
        //Max field size is 48
        if(contractExternalId.length()>48){return false;}
        //Only alphanumeric characters allowed
        return Pattern.matches('^[0-9]*$', contractExternalId);
    }


    public static boolean isValidRecordId(String stringId){
        if(String.isBlank(stringId)){return false;}
        // Cast to Id
        try{
            Id recordId = Id.valueOf(stringId);
        }
        catch(StringException e){
            return false;
        }
        return true;
    }

}