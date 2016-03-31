package com.ieebook.wxshop.service.user;

import com.ieebook.wxshop.entity.user.User;
import com.ieebook.wxshop.service.BaseService;
import org.springframework.stereotype.Repository;

@Repository
public class UserService extends BaseService {
    public User getUserByUid(int uid) {
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "User.getUserByUid", uid);
    }
}
