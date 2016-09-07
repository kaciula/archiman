package com.kaciula.archiman.screen.main;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.kaciula.archiman.R;
import com.kaciula.archiman.model.User;

import java.util.ArrayList;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import timber.log.Timber;

public class MainView extends ViewFlipper implements AdapterView.OnItemClickListener {

    private static final int CHILD_CONTENT = 0;
    private static final int CHILD_PROGRESS = 1;
    private static final int CHILD_ERROR = 2;

    @Inject
    MainPresenter presenter;

    @BindView(R.id.list)
    ListView listView;

    private UserAdapter adapter;

    public MainView(Context context, AttributeSet attrs) {
        super(context, attrs);
        if (!isInEditMode())
            ((MainActivity) getContext()).inject(this);
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        ButterKnife.bind(this);
        if (!isInEditMode()) {
            presenter.setView(this);
            presenter.onInit();
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!isInEditMode())
            presenter.onAttached();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (!isInEditMode())
            presenter.onDetached();
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        User user = adapter.getItem(position);
        Toast.makeText(getContext(), user.username, Toast.LENGTH_SHORT).show();
    }

    @OnClick(R.id.btn_retry)
    void onClickRetry() {
        presenter.onClickRetry();
    }

    void setup() {
        adapter = new UserAdapter(getContext(), new ArrayList<User>());
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(this);
    }

    void updateContent(MainData data) {
        adapter.setItems(data.users);
    }

    void showContent() {
        setDisplayedChild(CHILD_CONTENT);
        Timber.d("child content ? " + getDisplayedChild());
    }

    void showProgress() {
        setDisplayedChild(CHILD_PROGRESS);
        Timber.d("child progress ? " + getDisplayedChild());
    }

    void showError() {
        setDisplayedChild(CHILD_ERROR);
    }
}
