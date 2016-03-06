/**
* Given an object type, print out a list of all of the fields for
* that specific object
*
* @param type Type of object to use
*/
public static String getObjectFields(String type) {

    Schema.DescribeSobjectResult results = Schema.describeSObject(type);

    Schema.ChildRelationship[] rels = res.getChildRelationships();
    // Use rels if needed

    String resultString = 'SELECT \n';
    for (String key : res.fields.getMap().keySet()) {
        String result = res.fields.getMap().get(key).getDescribe().getName();
        resultString += '\n' + result + ',';
    }

    return resultString;
}

/**
* Given a string array of object types, return a string
* containing all of the fields for each object individually
*
* @param types String array containing object types
*/
public static String getMultipleObjectFields(String[] types) {
    String resultString = '';

    for (String type : types) {
        result += '\n' + getObjectFields(type)
    }

    return resultString;
}
