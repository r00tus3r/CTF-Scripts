.class public Lcom/badlogic/gdx/math/collision/Segment;
.super Ljava/lang/Object;
.source "Segment.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x260540af3e7b07b2L


# instance fields
.field public final a:Lcom/badlogic/gdx/math/Vector3;

.field public final b:Lcom/badlogic/gdx/math/Vector3;


# direct methods
.method public constructor <init>(FFFFFF)V
    .locals 1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    .line 34
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 54
    iget-object p1, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p4, p5, p6}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    .line 34
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    .line 41
    iget-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 42
    iget-object p1, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 69
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/math/collision/Segment;

    .line 70
    iget-object v2, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    iget-object v3, p1, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    iget-object p1, p1, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/math/Vector3;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 77
    iget-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->hashCode()I

    move-result v0

    const/16 v1, 0x47

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x47

    .line 78
    iget-object v1, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/Vector3;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public len()F
    .locals 2

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->dst(Lcom/badlogic/gdx/math/Vector3;)F

    move-result v0

    return v0
.end method

.method public len2()F
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/math/collision/Segment;->a:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p0, Lcom/badlogic/gdx/math/collision/Segment;->b:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->dst2(Lcom/badlogic/gdx/math/Vector3;)F

    move-result v0

    return v0
.end method
