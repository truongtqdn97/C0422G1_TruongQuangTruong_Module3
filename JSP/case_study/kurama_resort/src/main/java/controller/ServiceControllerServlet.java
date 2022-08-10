package controller;

import model.Facility;
import model.FacilityType;
import model.RentType;
import service.facility.IFacilityService;
import service.facility.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceControllerServlet", urlPatterns = {"/service"})
public class ServiceControllerServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            default:
                displayFacilityList(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewService(request, response);
                break;
            case "update":
                updateService(request, response);
                break;
            case "remove":
                removeService(request, response);
                break;
            case "search":
                searchServiceByName(request, response);
                break;
        }
    }

    private void removeService(HttpServletRequest request, HttpServletResponse response) {
        int fId = Integer.parseInt(request.getParameter("removeServiceId"));
        String message = "";
        boolean check = facilityService.removeFacility(fId);
        if (check) {
            message = "Delete completely!";
        } else message = "Can't delete!";
        List<Facility> facilityList = facilityService.selectAllFacility();
        List<FacilityType> facilityTypeList = facilityService.selectFacilityTypeId();
        List<RentType> rentTypeList = facilityService.selectRentType();
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("message", message);
        request.setAttribute("facilityList", facilityList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchServiceByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        List<Facility> facilityList = facilityService.searchByName(name);
        List<FacilityType> facilityTypeList = facilityService.selectFacilityTypeId();
        List<RentType> rentTypeList = facilityService.selectRentType();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response) {
        int fId = Integer.parseInt(request.getParameter("fId"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityType"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea;
        if (request.getParameter("poolArea").equals("")) {
            poolArea = 0;
        } else {
            poolArea = Double.parseDouble(request.getParameter("poolArea"));
        }
        int numberOfFloors;
        if (request.getParameter("numberOfFloors").equals("")) {
            numberOfFloors = 0;
        } else {
            numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        }
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(fId, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        boolean rowUpdated = facilityService.updateFacility(facility);
        String message = "";
        if (rowUpdated){
            message = "Update successfully!";
        }else {
            message = "Can't update!";
        }
        List<Facility> facilityList = facilityService.selectAllFacility();
        List<FacilityType> facilityTypeList = facilityService.selectFacilityTypeId();
        List<RentType> rentTypeList = facilityService.selectRentType();
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("message", message);
        request.setAttribute("facilityList", facilityList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int fId = Integer.parseInt(request.getParameter("fId"));
        Facility facility = facilityService.selectFacility(fId);
        List<FacilityType> facilityTypeList = facilityService.selectFacilityTypeId();
        List<RentType> rentTypeList = facilityService.selectRentType();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/edit.jsp");
        request.setAttribute("facility", facility);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewService(HttpServletRequest request, HttpServletResponse response) {
        //(int facilityId, String name, int area, double cost, int maxPeople,
        //                    int rentTypeId, int facilityTypeId, String standardRoom,
        //                    String descriptionOtherConvenience, double poolArea, int numberOfFloors,
        //                    String facilityFree)
        RequestDispatcher dispatcher;
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityType"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea;
        if (request.getParameter("poolArea").equals("")) {
            poolArea = 0;
        } else {
            poolArea = Double.parseDouble(request.getParameter("poolArea"));
        }
        int numberOfFloors;
        if (request.getParameter("numberOfFloors").equals("")) {
            numberOfFloors = 0;
        } else {
            numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        }
        String facilityFree = request.getParameter("facilityFree");
        List<Facility> facilityList = facilityService.selectAllServiceIncludeDeleted();
        int fId = facilityList.get(facilityList.size() - 1).getFacilityId() + 1;
        Facility facility = new Facility(fId, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);

        Map<String, String> mapErrors = this.facilityService.insertCheckedFacility(facility);
        if (mapErrors.size()>0){
            for (Map.Entry<String, String> entry: mapErrors.entrySet()){
                request.setAttribute(entry.getKey(), entry.getValue());
            }
            dispatcher = request.getRequestDispatcher("view/service/create.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

//        boolean rowCreated = facilityService.insertFacility(facility);
//        String message = "";
//        if (rowCreated){
//            message = "Create successfully!";
//        }else {
//            message = "Can't create new Service!";
//        }
        String message = "";
        if (mapErrors.isEmpty()){
            message = "Create successfully!";
        }else {
            message = "Can't create new Service!";
        }
        facilityList = facilityService.selectAllFacility();
        List<FacilityType> facilityTypeList = facilityService.selectFacilityTypeId();
        List<RentType> rentTypeList = facilityService.selectRentType();
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("message", message);
        request.setAttribute("facilityList", facilityList);
        dispatcher = request.getRequestDispatcher("view/service/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayFacilityList(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.selectAllFacility();
        List<FacilityType> facilityTypeList = facilityService.selectFacilityTypeId();
        List<RentType> rentTypeList = facilityService.selectRentType();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/service/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
