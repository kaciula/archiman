package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.model.User;

import java.util.List;

import rx.Observable;

public interface UsersDataSource {

    Observable<List<User>> getMembersOfOrganisation(String organisationName);
}
