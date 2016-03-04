
String[] types = new String[]{'Contact'};

Schema.DescribeSobjectResult[] results = Schema.describeSObjects(types);
System.debug('Got describe information for ' + results.size() + ' sObjects.');

for(Schema.DescribeSobjectResult res : results) {
    System.debug('sObject Label: ' + res.getLabel());
    System.debug('Number of fields: ' + res.fields.getMap().size());
    System.debug(res.isCustom() ? 'This is a custom object.' : 'This is a standard object.');

    Schema.ChildRelationship[] rels = res.getChildRelationships();
    if (rels.size() > 0) {
        System.debug(res.getName() + ' has ' + rels.size() + ' child relationships.');
    }

    system.debug('## Result Map: ' + res.fields.getMap());
    String resultString = 'SELECT \n';
    for (String key : res.fields.getMap().keySet()) {
        String result = res.fields.getMap().get(key).getDescribe().getName();
        system.debug('## field Name: ' + key);
        system.debug('## field Result: ' + result);
        resultString += '\n' + result + ',';
    }

    system.debug('## Query Fields Result: ');
    system.debug(resultString);
}
