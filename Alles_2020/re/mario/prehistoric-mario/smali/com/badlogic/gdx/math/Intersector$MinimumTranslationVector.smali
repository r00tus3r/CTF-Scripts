.class public Lcom/badlogic/gdx/math/Intersector$MinimumTranslationVector;
.super Ljava/lang/Object;
.source "Intersector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Intersector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MinimumTranslationVector"
.end annotation


# instance fields
.field public depth:F

.field public normal:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1342
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1344
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/Intersector$MinimumTranslationVector;->normal:Lcom/badlogic/gdx/math/Vector2;

    const/4 v0, 0x0

    .line 1346
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$MinimumTranslationVector;->depth:F

    return-void
.end method
