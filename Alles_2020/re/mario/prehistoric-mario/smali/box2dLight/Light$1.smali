.class Lbox2dLight/Light$1;
.super Ljava/lang/Object;
.source "Light.java"

# interfaces
.implements Lcom/badlogic/gdx/physics/box2d/RayCastCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lbox2dLight/Light;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbox2dLight/Light;


# direct methods
.method constructor <init>(Lbox2dLight/Light;)V
    .locals 0

    .line 412
    iput-object p1, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final reportRayFixture(Lcom/badlogic/gdx/physics/box2d/Fixture;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;F)F
    .locals 1

    .line 417
    invoke-static {}, Lbox2dLight/Light;->access$000()Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object p3

    const/high16 v0, -0x40800000    # -1.0f

    if-eqz p3, :cond_0

    iget-object p3, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    invoke-virtual {p3, p1}, Lbox2dLight/Light;->globalContactFilter(Lcom/badlogic/gdx/physics/box2d/Fixture;)Z

    move-result p3

    if-nez p3, :cond_0

    return v0

    .line 420
    :cond_0
    iget-object p3, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    invoke-static {p3}, Lbox2dLight/Light;->access$100(Lbox2dLight/Light;)Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object p3

    if-eqz p3, :cond_1

    iget-object p3, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    invoke-virtual {p3, p1}, Lbox2dLight/Light;->contactFilter(Lcom/badlogic/gdx/physics/box2d/Fixture;)Z

    move-result p3

    if-nez p3, :cond_1

    return v0

    .line 423
    :cond_1
    iget-object p3, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    iget-boolean p3, p3, Lbox2dLight/Light;->ignoreBody:Z

    if-eqz p3, :cond_2

    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object p1

    iget-object p3, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    invoke-virtual {p3}, Lbox2dLight/Light;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object p3

    if-ne p1, p3, :cond_2

    return v0

    .line 429
    :cond_2
    iget-object p1, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    iget-object p1, p1, Lbox2dLight/Light;->mx:[F

    iget-object p3, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    iget p3, p3, Lbox2dLight/Light;->m_index:I

    iget v0, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v0, p1, p3

    .line 430
    iget-object p1, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    iget-object p1, p1, Lbox2dLight/Light;->my:[F

    iget-object p3, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    iget p3, p3, Lbox2dLight/Light;->m_index:I

    iget p2, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput p2, p1, p3

    .line 431
    iget-object p1, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    iget-object p1, p1, Lbox2dLight/Light;->f:[F

    iget-object p2, p0, Lbox2dLight/Light$1;->this$0:Lbox2dLight/Light;

    iget p2, p2, Lbox2dLight/Light;->m_index:I

    aput p4, p1, p2

    return p4
.end method
