package expo.modules.adset;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

import com.jiagu.sdk.OSETSDKProtected;
import com.kc.openset.OSETSDK;
import com.kc.openset.ad.OSETRewardVideoCache;
import com.kc.openset.listener.OSETInitListener;

import java.util.Objects;

import expo.modules.core.interfaces.ReactActivityLifecycleListener;

public class MyLibReactActivityLifecycleListener implements ReactActivityLifecycleListener {
  @Override
  public void onCreate(Activity activity, Bundle savedInstanceState) {
    ApplicationInfo info = null;
    try {
      info = activity.getPackageManager().getApplicationInfo(activity.getApplicationInfo().packageName,
              PackageManager.GET_META_DATA);
    } catch (PackageManager.NameNotFoundException e) {
      throw new RuntimeException(e);
    }
    OSETSDKProtected.install(activity.getApplication());
    var apikey=Objects.requireNonNull(info.metaData.getString("ADSET_APP"));
    var reward=Objects.requireNonNull(info.metaData.getString("ADSET_REWARD"));
    OSETSDK.getInstance().init(activity.getApplication(), apikey, new OSETInitListener() {
      @Override
      public void onError(String s) {
      }

      @Override
      public void onSuccess() {
        OSETRewardVideoCache.getInstance().setContext(activity)
                .setPosId(reward).startLoad();
      }
    });
  }

  @Override
  public void onDestroy(Activity activity) {
    OSETRewardVideoCache.getInstance().destroy();
  }
}
