
/**
* Given an object type, print out a list of all of the fields for
* that specific object
*
*/
String[] types = new String[]{'Contact'};

Schema.DescribeSobjectResult[] results = Schema.describeSObjects(types);

for(Schema.DescribeSobjectResult res : results) {

    Schema.ChildRelationship[] rels = res.getChildRelationships();
    // Use rels if needed

    String resultString = 'SELECT \n';
    for (String key : res.fields.getMap().keySet()) {
        String result = res.fields.getMap().get(key).getDescribe().getName();
        resultString += '\n' + result + ',';
    }

    system.debug('## Query Fields Result: ');
    system.debug(resultString);
}
