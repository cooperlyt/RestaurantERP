package cc.coopersoft.restaurant.operation;

import cc.coopersoft.restaurant.operation.model.Office;
import cc.coopersoft.restaurant.operation.repository.OfficeRepository;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cooper on 6/10/16.
 */
@Named
@RequestScoped
public class OfficeManager {


    @Inject
    private OfficeRepository officeRepository;

    private boolean showDestroy;

    private String condition;

    public boolean isShowDestroy() {
        return showDestroy;
    }

    public void setShowDestroy(boolean showDestroy) {
        this.showDestroy = showDestroy;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    private List<Office> resultList;

    public List<Office> getResultList(){
        if (resultList == null){
            resultList = new ArrayList<Office>();

            if (showDestroy){
                resultList = officeRepository.findByConditionAll(condition);
            }else{
                resultList = officeRepository.findByCondition(condition);
            }

        }
        return resultList;
    }
}
