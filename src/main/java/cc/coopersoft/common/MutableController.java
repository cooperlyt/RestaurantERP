package cc.coopersoft.common;

/**
 * Created by cooper on 6/10/16.
 */
public abstract class MutableController implements java.io.Serializable{

    private transient boolean dirty;

    public boolean clearDirty()
    {
        boolean result = dirty;
        dirty = false;
        return result;
    }

    /**
     * Set the dirty flag if the value has changed.
     * Call whenever a subclass attribute is updated.
     *
     * @param oldValue the old value of an attribute
     * @param newValue the new value of an attribute
     * @return true if the newValue is not equal to the oldValue
     */
    protected <U> boolean setDirty(U oldValue, U newValue)
    {
        boolean attributeDirty = oldValue!=newValue && (
                oldValue==null ||
                        !oldValue.equals(newValue)
        );
        dirty = dirty || attributeDirty;
        return attributeDirty;
    }

    /**
     * Set the dirty flag.
     */
    protected void setDirty()
    {
        dirty = true;
    }

}
