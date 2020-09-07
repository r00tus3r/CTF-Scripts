.class public Lcom/badlogic/gdx/utils/AtomicQueue;
.super Ljava/lang/Object;
.source "AtomicQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final queue:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final readIndex:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final writeIndex:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->writeIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->readIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 37
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->queue:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    return-void
.end method

.method private next(I)I
    .locals 1

    add-int/lit8 p1, p1, 0x1

    .line 41
    iget-object v0, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->queue:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    rem-int/2addr p1, v0

    return p1
.end method


# virtual methods
.method public poll()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->readIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 56
    iget-object v1, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->writeIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 58
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->queue:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 59
    iget-object v2, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->readIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/AtomicQueue;->next(I)I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-object v1
.end method

.method public put(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->writeIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 46
    iget-object v1, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->readIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    .line 47
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/AtomicQueue;->next(I)I

    move-result v2

    if-ne v2, v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 49
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->queue:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 50
    iget-object p1, p0, Lcom/badlogic/gdx/utils/AtomicQueue;->writeIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    const/4 p1, 0x1

    return p1
.end method
