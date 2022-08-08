package service.facility.impl;

import model.Facility;
import model.FacilityType;
import model.RentType;
import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository();

    private final String NAME_REGEX = "^((([A-Z]+)([a-z0-9]*)\\s)+)(([A-Z]+[a-z0-9]*)*)$";

    private final String PHONE_NUMBER_REGEX = "^((090)|(091)|(\\(84\\)\\+90)|(\\(84\\)\\+91))(([0-9]){7})$";


    @Override
    public List<Facility> selectAllFacility() {
        return facilityRepository.selectAllFacility();
    }

    @Override
    public List<Facility> selectAllServiceIncludeDeleted() {
        return facilityRepository.selectAllServiceIncludeDeleted();
    }

    @Override
    public Facility selectFacility(int facilityId) {
        return facilityRepository.selectFacility(facilityId);
    }

    @Override
    public boolean insertFacility(Facility facility) {
        return facilityRepository.insertFacility(facility);
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return facilityRepository.updateFacility(facility);
    }

    @Override
    public boolean removeFacility(int facilityId) {
        return facilityRepository.removeFacility(facilityId);
    }

    @Override
    public List<RentType> selectRentType() {
        return facilityRepository.selectRentType();
    }

    @Override
    public List<FacilityType> selectFacilityTypeId() {
        return facilityRepository.selectFacilityTypeId();
    }

    @Override
    public List<Facility> searchByName(String name) {
        return facilityRepository.searchByName(name);
    }

    @Override
    public Map<String, String> insertCheckedFacility(Facility facility) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!facility.getName().isEmpty()){
            if (!facility.getName().matches(NAME_REGEX)){
                mapErrors.put("nameRegex", "Please input right format!");
            }
        }else {
            mapErrors.put("nameRegex", "Please input name!");
        }

        if (facility.getArea() <= 0){
            mapErrors.put("areaRegex", "Please input right number!");
        }

        if (facility.getCost() <= 0){
            mapErrors.put("costRegex", "Please input right number!");
        }

        if (facility.getMaxPeople() <= 0){
            mapErrors.put("maxPeopleRegex", "Please input right number!");
        }

        if (facility.getPoolArea() < 0){
            mapErrors.put("poolAreaRegex", "Please input right number!");
        }

        if (facility.getNumberOfFloors() < 0){
            mapErrors.put("numberOfFloors", "Please input right number!");
        }

        //add more regex here


        if (mapErrors.size()==0){
            this.facilityRepository.insertFacility(facility);
        }
        return mapErrors;
    }
}
