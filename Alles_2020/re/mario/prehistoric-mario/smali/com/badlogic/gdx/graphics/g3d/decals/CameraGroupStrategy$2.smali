.class Lcom/badlogic/gdx/graphics/g3d/decals/CameraGroupStrategy$2;
.super Ljava/lang/Object;
.source "CameraGroupStrategy.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/graphics/g3d/decals/CameraGroupStrategy;-><init>(Lcom/badlogic/gdx/graphics/Camera;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/badlogic/gdx/graphics/g3d/decals/Decal;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$camera:Lcom/badlogic/gdx/graphics/Camera;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 0

    .line 99
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/CameraGroupStrategy$2;->val$camera:Lcom/badlogic/gdx/graphics/Camera;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/badlogic/gdx/graphics/g3d/decals/Decal;Lcom/badlogic/gdx/graphics/g3d/decals/Decal;)I
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/CameraGroupStrategy$2;->val$camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->dst(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    .line 103
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/CameraGroupStrategy$2;->val$camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/math/Vector3;->dst(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p2

    sub-float/2addr p2, p1

    .line 104
    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 99
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/decals/CameraGroupStrategy$2;->compare(Lcom/badlogic/gdx/graphics/g3d/decals/Decal;Lcom/badlogic/gdx/graphics/g3d/decals/Decal;)I

    move-result p1

    return p1
.end method
