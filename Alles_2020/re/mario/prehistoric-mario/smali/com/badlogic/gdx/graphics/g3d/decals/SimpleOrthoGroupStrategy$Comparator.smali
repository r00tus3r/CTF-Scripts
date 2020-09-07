.class Lcom/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy$Comparator;
.super Ljava/lang/Object;
.source "SimpleOrthoGroupStrategy.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Comparator"
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
.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy$Comparator;->this$0:Lcom/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/badlogic/gdx/graphics/g3d/decals/Decal;Lcom/badlogic/gdx/graphics/g3d/decals/Decal;)I
    .locals 2

    .line 113
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->getZ()F

    move-result v0

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->getZ()F

    move-result v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 114
    :cond_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->getZ()F

    move-result p1

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->getZ()F

    move-result p2

    sub-float/2addr p1, p2

    const/4 p2, 0x0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_1

    const/4 p1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    :goto_0
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 110
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/decals/SimpleOrthoGroupStrategy$Comparator;->compare(Lcom/badlogic/gdx/graphics/g3d/decals/Decal;Lcom/badlogic/gdx/graphics/g3d/decals/Decal;)I

    move-result p1

    return p1
.end method
