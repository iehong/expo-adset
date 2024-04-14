package expo.modules.adset;

import android.content.Context;

import java.util.Collections;
import java.util.List;

import expo.modules.core.interfaces.Package;
import expo.modules.core.interfaces.ReactActivityLifecycleListener;

public class MyPackage implements Package {
  @Override
  public List<? extends ReactActivityLifecycleListener> createReactActivityLifecycleListeners(Context activityContext) {
    return Collections.singletonList(new MyLibReactActivityLifecycleListener());
  }
}
