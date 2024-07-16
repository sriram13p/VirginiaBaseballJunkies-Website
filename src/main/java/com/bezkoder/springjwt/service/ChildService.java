package com.bezkoder.springjwt.service;

import com.bezkoder.springjwt.models.Child;
import com.bezkoder.springjwt.repository.ChildRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChildService {

    @Autowired
    private ChildRepository childRepository;


    public String addChild(Child child) {
         if(childRepository.save(child)!=null){
             return "success";
         }else{
             return "failed";
         }
    }

    public List<Child> getChildren(Long userID) {
        return childRepository.findByUserId(userID);
    }

    public Child fetchChild(long id) {
        return childRepository.getReferenceById(id);
    }
}
