/**
 * jiangyukun on 16/1/2.
 */
define(function () {
    var refreshState = false;
    return {
        getRefreshState: function () {
            try {
                return refreshState;
            } finally {
                refreshState = false;
            }
        },
        setFreshState: function (freshable) {
            refreshState = freshable;
        }
    }
});
