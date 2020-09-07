.class public Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;
.super Ljava/lang/Object;
.source "Predicate.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/Predicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PredicateIterable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public iterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "TT;>;"
        }
    .end annotation
.end field

.field public iterator:Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Predicate$PredicateIterator<",
            "TT;>;"
        }
    .end annotation
.end field

.field public predicate:Lcom/badlogic/gdx/utils/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Predicate<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;Lcom/badlogic/gdx/utils/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "TT;>;",
            "Lcom/badlogic/gdx/utils/Predicate<",
            "TT;>;)V"
        }
    .end annotation

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 89
    iput-object v0, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterator:Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;

    .line 92
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->set(Ljava/lang/Iterable;Lcom/badlogic/gdx/utils/Predicate;)V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 106
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->predicate:Lcom/badlogic/gdx/utils/Predicate;

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;-><init>(Ljava/util/Iterator;Lcom/badlogic/gdx/utils/Predicate;)V

    return-object v0

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterator:Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;

    if-nez v0, :cond_1

    .line 108
    new-instance v0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->predicate:Lcom/badlogic/gdx/utils/Predicate;

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;-><init>(Ljava/util/Iterator;Lcom/badlogic/gdx/utils/Predicate;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterator:Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;

    goto :goto_0

    .line 110
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterable:Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->predicate:Lcom/badlogic/gdx/utils/Predicate;

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;->set(Ljava/util/Iterator;Lcom/badlogic/gdx/utils/Predicate;)V

    .line 111
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterator:Lcom/badlogic/gdx/utils/Predicate$PredicateIterator;

    return-object v0
.end method

.method public set(Ljava/lang/Iterable;Lcom/badlogic/gdx/utils/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "TT;>;",
            "Lcom/badlogic/gdx/utils/Predicate<",
            "TT;>;)V"
        }
    .end annotation

    .line 96
    iput-object p1, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->iterable:Ljava/lang/Iterable;

    .line 97
    iput-object p2, p0, Lcom/badlogic/gdx/utils/Predicate$PredicateIterable;->predicate:Lcom/badlogic/gdx/utils/Predicate;

    return-void
.end method
