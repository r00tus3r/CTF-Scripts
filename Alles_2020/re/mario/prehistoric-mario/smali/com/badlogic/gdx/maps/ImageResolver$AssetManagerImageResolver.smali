.class public Lcom/badlogic/gdx/maps/ImageResolver$AssetManagerImageResolver;
.super Ljava/lang/Object;
.source "ImageResolver.java"

# interfaces
.implements Lcom/badlogic/gdx/maps/ImageResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/maps/ImageResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AssetManagerImageResolver"
.end annotation


# instance fields
.field private final assetManager:Lcom/badlogic/gdx/assets/AssetManager;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/AssetManager;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/badlogic/gdx/maps/ImageResolver$AssetManagerImageResolver;->assetManager:Lcom/badlogic/gdx/assets/AssetManager;

    return-void
.end method


# virtual methods
.method public getImage(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 3

    .line 54
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iget-object v1, p0, Lcom/badlogic/gdx/maps/ImageResolver$AssetManagerImageResolver;->assetManager:Lcom/badlogic/gdx/assets/AssetManager;

    const-class v2, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1, p1, v2}, Lcom/badlogic/gdx/assets/AssetManager;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    return-object v0
.end method
