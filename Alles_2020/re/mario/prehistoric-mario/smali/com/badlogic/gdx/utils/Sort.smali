.class public Lcom/badlogic/gdx/utils/Sort;
.super Ljava/lang/Object;
.source "Sort.java"


# static fields
.field private static instance:Lcom/badlogic/gdx/utils/Sort;


# instance fields
.field private comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

.field private timSort:Lcom/badlogic/gdx/utils/TimSort;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static instance()Lcom/badlogic/gdx/utils/Sort;
    .locals 1

    .line 64
    sget-object v0, Lcom/badlogic/gdx/utils/Sort;->instance:Lcom/badlogic/gdx/utils/Sort;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/Sort;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Sort;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/utils/Sort;->instance:Lcom/badlogic/gdx/utils/Sort;

    .line 65
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/utils/Sort;->instance:Lcom/badlogic/gdx/utils/Sort;

    return-object v0
.end method


# virtual methods
.method public sort(Lcom/badlogic/gdx/utils/Array;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable;",
            ">(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)V"
        }
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ComparableTimSort;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    iget-object v1, p1, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/badlogic/gdx/utils/ComparableTimSort;->doSort([Ljava/lang/Object;II)V

    return-void
.end method

.method public sort(Lcom/badlogic/gdx/utils/Array;Ljava/util/Comparator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/TimSort;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/TimSort;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    iget-object v1, p1, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v0, v1, p2, v2, p1}, Lcom/badlogic/gdx/utils/TimSort;->doSort([Ljava/lang/Object;Ljava/util/Comparator;II)V

    return-void
.end method

.method public sort([Ljava/lang/Object;)V
    .locals 3

    .line 37
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ComparableTimSort;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, v1, v2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->doSort([Ljava/lang/Object;II)V

    return-void
.end method

.method public sort([Ljava/lang/Object;II)V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ComparableTimSort;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->comparableTimSort:Lcom/badlogic/gdx/utils/ComparableTimSort;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->doSort([Ljava/lang/Object;II)V

    return-void
.end method

.method public sort([Ljava/lang/Object;Ljava/util/Comparator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/TimSort;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/TimSort;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/badlogic/gdx/utils/TimSort;->doSort([Ljava/lang/Object;Ljava/util/Comparator;II)V

    return-void
.end method

.method public sort([Ljava/lang/Object;Ljava/util/Comparator;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;",
            "Ljava/util/Comparator<",
            "-TT;>;II)V"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/TimSort;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/TimSort;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Sort;->timSort:Lcom/badlogic/gdx/utils/TimSort;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/utils/TimSort;->doSort([Ljava/lang/Object;Ljava/util/Comparator;II)V

    return-void
.end method
