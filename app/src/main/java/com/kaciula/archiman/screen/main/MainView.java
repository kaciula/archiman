package com.kaciula.archiman.screen.main;

import android.content.Context;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.widget.ViewFlipper;

import com.kaciula.archiman.R;
import com.kaciula.archiman.data.model.User;
import com.kaciula.archiman.ui.Toasts;
import com.kaciula.archiman.ui.widget.DividerItemDecoration;

import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import timber.log.Timber;

public class MainView extends ViewFlipper implements MainContract.View {

    private static final int CHILD_CONTENT = 0;
    private static final int CHILD_PROGRESS = 1;
    private static final int CHILD_ERROR = 2;

    @BindView(R.id.recycler_view)
    RecyclerView recyclerView;

    private MainContract.Presenter presenter;
    private UserAdapter adapter;

    public MainView(Context context) {
        super(context);
        init();
    }

    public MainView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    private void init() {
        inflate(getContext(), R.layout.view_main, this);
        ButterKnife.bind(this);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        setup();
        if (!isInEditMode())
            presenter.attachView();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (!isInEditMode())
            presenter.detachView();
    }

    @Override
    public void setPresenter(MainContract.Presenter presenter) {
        this.presenter = presenter;
    }

    @OnClick(R.id.btn_retry)
    void onClickRetry() {
        presenter.onClickRetry();
    }

    @Override
    public void updateContent(MainData data) {
        adapter.setItems(data.users);
    }

    @Override
    public void showMessageOnClick(User user) {
        Toasts.show("Clicked on user " + user.toString());
    }

    @Override
    public void showContent() {
        setDisplayedChild(CHILD_CONTENT);
        Timber.d("child content ? " + getDisplayedChild());
    }

    @Override
    public void showProgress() {
        setDisplayedChild(CHILD_PROGRESS);
        Timber.d("child progress ? " + getDisplayedChild());
    }

    @Override
    public void showError() {
        setDisplayedChild(CHILD_ERROR);
    }

    private void setup() {
        recyclerView.addItemDecoration(new DividerItemDecoration(getContext()));
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext(), LinearLayoutManager
                .VERTICAL, false));
        adapter = new UserAdapter(getContext(), new ArrayList<User>(), presenter);
        recyclerView.setAdapter(adapter);
    }
}
