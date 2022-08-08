package service.facility.impl;

import model.Facility;
import model.FacilityType;
import model.RentType;
import repository.facility.IFacilityRepository;
import repository.facility.impl.FacilityRepository;
import service.facility.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository();

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
}
