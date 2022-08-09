package repository.facility.impl;

import model.Facility;
import model.FacilityType;
import model.RentType;
import repository.BaseRepository;
import repository.facility.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_ALL_FACILITY = "select * from dich_vu" +
            " where `status` = 1 ";
    private final String SELECT_ALL_FACILITY_INCLUDE_DELETED = "select * from dich_vu";
    private final String SELECT_FACILITY_BY_ID = "select * from dich_vu" +
            " where ma_dich_vu = ? ;";
    private final String INSERT_FACILITY = "insert into dich_vu " +
            "(`ma_dicH_vu`, " +
            "`ten_dich_vu`, " +
            "`dien_tich`, " +
            "`chi_phi_thue`, " +
            "`so_nguoi_toi_da`, " +
            "`ma_kieu_thue`, " +
            "`ma_loai_dich_vu`, " +
            "`tieu_chuan_phong`, " +
            "`mo_ta_tien_nghi_khac`, " +
            "`dien_tich_ho_boi`, " +
            "`so_tang`, " +
            "`dich_vu_mien_phi_di_kem`) \n" +
            "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private final String UPDATE_FACILITY = "update dich_vu " +
            "set `ten_dich_vu` = ?, " +
            "`dien_tich` = ?, " +
            "`chi_phi_thue` = ?, " +
            "`so_nguoi_toi_da` = ?, " +
            "`ma_kieu_thue` = ?, " +
            "`ma_loai_dich_vu` = ?, " +
            "`tieu_chuan_phong` = ?, " +
            "`mo_ta_tien_nghi_khac` = ?, " +
            "`dien_tich_ho_boi` = ?, " +
            "`so_tang` = ?, " +
            "`dich_vu_mien_phi_di_kem` = ? " +
            "where (`ma_dich_vu` = ?);";

    private final String DELETE_FACILITY = "update dich_vu " +
            "set `status` = 0 WHERE (`ma_dich_vu` = ?);";

    private final String SEARCH_FACILITY_BY_NAME = "select * from dich_vu" +
            " where (ten_dich_vu like ? ) and (`status` = 1) ;";

    private final String SELECT_RENT_TYPE = "select * from kieu_thue ;";

    private final String SELECT_FACILITY_TYPE = "select * from loai_dich_vu ;";


    @Override
    public List<Facility> selectAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        Facility facility = null;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//Facility(int facilityId, String name, int area, double cost, int maxPeople,
//                    int rentTypeId, int facilityTypeId, String standardRoom,
//                    String descriptionOtherConvenience, double poolArea, int numberOfFloors,
//                    String facilityFree)
                int facilityId = rs.getInt(1);
                String name = rs.getString(2);
                int area = rs.getInt(3);
                double cost = rs.getDouble(4);
                int maxPeople = rs.getInt(5);
                int rentTypeId = rs.getInt(6);
                int facilityTypeId = rs.getInt(7);
                String standardRoom = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea = rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String facilityFree = rs.getString(12);
                facility = new Facility(facilityId, name, area, cost, maxPeople,
                        rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience,
                        poolArea, numberOfFloors, facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public List<Facility> selectAllServiceIncludeDeleted() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SELECT_ALL_FACILITY_INCLUDE_DELETED);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//Facility(int facilityId, String name, int area, double cost, int maxPeople,
//                    int rentTypeId, int facilityTypeId, String standardRoom,
//                    String descriptionOtherConvenience, double poolArea, int numberOfFloors,
//                    String facilityFree)
                int facilityId = rs.getInt(1);
                String name = rs.getString(2);
                int area = rs.getInt(3);
                double cost = rs.getDouble(4);
                int maxPeople = rs.getInt(5);
                int rentTypeId = rs.getInt(6);
                int facilityTypeId = rs.getInt(7);
                String standardRoom = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea = rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String facilityFree = rs.getString(12);
                Facility facility = new Facility(facilityId, name, area, cost, maxPeople,
                        rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience,
                        poolArea, numberOfFloors, facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public Facility selectFacility(int facilityId) {
        Facility facility = null;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SELECT_FACILITY_BY_ID);
            ps.setInt(1, facilityId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2);
                int area = rs.getInt(3);
                double cost = rs.getDouble(4);
                int maxPeople = rs.getInt(5);
                int rentTypeId = rs.getInt(6);
                int facilityTypeId = rs.getInt(7);
                String standardRoom = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea = rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String facilityFree = rs.getString(12);
                facility = new Facility(facilityId, name, area, cost, maxPeople,
                        rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience,
                        poolArea, numberOfFloors, facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }


    @Override
    public boolean insertFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        int rowInserted;
        int facilityTypeId = facility.getFacilityTypeId();
        String standardRoom = facility.getStandardRoom();
        String descriptionOtherConvenience = facility.getDescriptionOtherConvenience();
        double poolArea = facility.getPoolArea();
        int numberOfFloors = facility.getNumberOfFloors();
        String facilityFree = facility.getFacilityFree();
        if (facilityTypeId==1){
            facilityFree = null;
        }else if (facilityTypeId==2){
            poolArea = 0;
            facilityFree = null;
        }else if (facilityTypeId==3){
            standardRoom = null;
            descriptionOtherConvenience = null;
            poolArea = 0;
            numberOfFloors = 0;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_FACILITY);
            ps.setInt(1, facility.getFacilityId());
            ps.setString(2, facility.getName());
            ps.setInt(3, facility.getArea());
            ps.setDouble(4, facility.getCost());
            ps.setInt(5, facility.getMaxPeople());
            ps.setInt(6, facility.getRentTypeId());
            ps.setInt(7, facility.getFacilityTypeId());

            ps.setString(8, standardRoom);
            ps.setString(9, descriptionOtherConvenience);
            ps.setDouble(10, poolArea);
            ps.setInt(11, numberOfFloors);
            ps.setString(12, facilityFree);
            rowInserted = ps.executeUpdate();
            return rowInserted>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateFacility(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        int rowUpdated;
        int facilityTypeId = facility.getFacilityTypeId();
        String standardRoom = facility.getStandardRoom();
        String descriptionOtherConvenience = facility.getDescriptionOtherConvenience();
        double poolArea = facility.getPoolArea();
        int numberOfFloors = facility.getNumberOfFloors();
        String facilityFree = facility.getFacilityFree();
        if (facilityTypeId==1){
            facilityFree = null;
        }else if (facilityTypeId==2){
            poolArea = 0;
            facilityFree = null;
        }else if (facilityTypeId==3){
            standardRoom = null;
            descriptionOtherConvenience = null;
            poolArea = 0;
            numberOfFloors = 0;
        }
        try {
//            set `ten_dich_vu` = ?, " +
//            "`dien_tich` = ?, " +
//            "`chi_phi_thue` = ?, " +
//            "`so_nguoi_toi_da` = ?, " +

//            "`ma_kieu_thue` = ?, " +
//            "`ma_loai_dich_vu` = ?, " +
//            "`tieu_chuan_phong` = ?, " +

//            "`mo_ta_tien_nghi_khac` = ?, " +
//            "`dien_tich_ho_boi` = ?, " +
//            "`so_tang` = ?, " +
//            "`dich_vu_mien_phi_di_kem` = ? " +
//            "where (`ma_dich_vu` = ?);";
            PreparedStatement ps = connection.prepareStatement(UPDATE_FACILITY);
            ps.setString(1, facility.getName());
            ps.setInt(2, facility.getArea());
            ps.setDouble(3, facility.getCost());
            ps.setInt(4, facility.getMaxPeople());
            ps.setInt(5, facility.getRentTypeId());
            ps.setInt(6, facility.getFacilityTypeId());
            ps.setString(7, standardRoom);
            ps.setString(8, descriptionOtherConvenience);
            ps.setDouble(9, poolArea);
            ps.setInt(10, numberOfFloors);
            ps.setString(11, facilityFree);
            ps.setInt(12, facility.getFacilityId());
            rowUpdated = ps.executeUpdate();
            return rowUpdated>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean removeFacility(int facilityId) {
        int rowRemoved;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_FACILITY);
            ps.setInt(1, facilityId);
            rowRemoved = ps.executeUpdate();
            return rowRemoved>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<RentType> selectRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SELECT_RENT_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int rentTypeId = rs.getInt(1);
                String rentTypeName = rs.getString(2);
                rentTypeList.add(new RentType(rentTypeId, rentTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }

    @Override
    public List<FacilityType> selectFacilityTypeId() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int facilityTypeId = rs.getInt(1);
                String facilityTypeName = rs.getString(2);
                facilityTypeList.add(new FacilityType(facilityTypeId, facilityTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypeList;
    }

    @Override
    public List<Facility> searchByName(String name) {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        Facility facility = null;
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_FACILITY_BY_NAME);
            ps.setString(1, "%"+name+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int facilityId = rs.getInt(1);
                String name1 = rs.getString(2);
                int area = rs.getInt(3);
                double cost = rs.getDouble(4);
                int maxPeople = rs.getInt(5);
                int rentTypeId = rs.getInt(6);
                int facilityTypeId = rs.getInt(7);
                String standardRoom = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea = rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String facilityFree = rs.getString(12);
                facility = new Facility(facilityId, name1, area, cost, maxPeople,
                        rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience,
                        poolArea, numberOfFloors, facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return facilityList;
    }
}
