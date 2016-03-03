    /**
    * Return first Object record for a given ID
    *
    * @param parentId SFID for the parent of the Object
    */
    public static Object getObject(ID objectId) {
        List<Object> ObjectList = [
            SELECT
                Id,
                Name,
                OwnerId
            FROM
                Object
            WHERE
                Id = :objectId
        ];

        if (!ObjectList.isEmpty()) {
            return ObjectList.get(0);
        }
        return null;
    }