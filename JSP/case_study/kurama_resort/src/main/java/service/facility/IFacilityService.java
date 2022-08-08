package service.facility;

import model.Customer;
import model.Facility;
import model.FacilityType;
import model.RentType;

import java.util.List;
import java.util.Map;

public interface IFacilityService {
    List<Facility> selectAllFacility();

    List<Facility> selectAllServiceIncludeDeleted();

    Facility selectFacility(int facilityId);

    boolean insertFacility(Facility facility);

    boolean updateFacility(Facility facility);

    boolean removeFacility(int facilityId);

    List<RentType> selectRentType();

    List<FacilityType> selectFacilityTypeId();

    List<Facility> searchByName(String name);

    Map<String, String> insertCheckedFacility(Facility facility);

}
