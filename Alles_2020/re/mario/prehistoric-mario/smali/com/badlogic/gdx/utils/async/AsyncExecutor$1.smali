.class Lcom/badlogic/gdx/utils/async/AsyncExecutor$1;
.super Ljava/lang/Object;
.source "AsyncExecutor.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/utils/async/AsyncExecutor;-><init>(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/utils/async/AsyncExecutor;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/async/AsyncExecutor;Ljava/lang/String;)V
    .locals 0

    .line 44
    iput-object p1, p0, Lcom/badlogic/gdx/utils/async/AsyncExecutor$1;->this$0:Lcom/badlogic/gdx/utils/async/AsyncExecutor;

    iput-object p2, p0, Lcom/badlogic/gdx/utils/async/AsyncExecutor$1;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 2

    .line 47
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/async/AsyncExecutor$1;->val$name:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method
