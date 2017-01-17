package com.kaciula.archiman.data.local.database;

import io.realm.RealmObject;
import io.realm.annotations.PrimaryKey;

public class UserDb extends RealmObject {
  @PrimaryKey
  public long accountId;
  public String name;
}
