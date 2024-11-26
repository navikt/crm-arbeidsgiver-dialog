/*
 * This is a helper class for validating variabel types.
 * */
public with sharing class InputValidator {
    /**
     * Validates whether the given organization number is a valid Norwegian organization number.
     * The validation follows the rules specified at:
     * https://www.brreg.no/om-oss/registrene-vare/om-enhetsregisteret/organisasjonsnummeret/
     *
     * @param orgNumber The organization number to validate.
     * @return Returns true if the organization number is valid, otherwise false.
     */
    public static boolean isValidNorwegianOrgNumber(String orgNumber) {
        try {
            if (orgNumber == null) {
                return false;
            }
            if (orgNumber.length() != 9) {
                return false;
            }
            if (!orgNumber.containsOnly('1234567890')) {
                return false;
            }

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

    /**
     * Validates whether the given contract external ID meets specified requirements.
     * Requirements:
     * - Not null or blank.
     * - Maximum length is 48 characters.
     * - Must contain only numeric characters.
     *
     * @param contractExternalId The contract external ID to validate.
     * @return Returns true if the contract external ID is valid, otherwise false.
     */
    public static boolean isValidContractExternalId(String contractExternalId) {
        if (String.isBlank(contractExternalId)) {
            return false;
        }
        if (contractExternalId.length() > 48) {
            return false;
        }
        return Pattern.matches('^[0-9]*$', contractExternalId);
    }

    /**
     * Validates whether the given string is a valid Salesforce record ID.
     * Validation involves attempting to cast the string to a valid Salesforce ID.
     *
     * @param stringId The string to validate as a Salesforce record ID.
     * @return Returns true if the string is a valid record ID, otherwise false.
     */
    public static boolean isValidRecordId(String stringId) {
        if (String.isBlank(stringId)) {
            return false;
        }
        try {
            Id recordId = Id.valueOf(stringId);
        } catch (StringException e) {
            return false;
        }
        return true;
    }
}
