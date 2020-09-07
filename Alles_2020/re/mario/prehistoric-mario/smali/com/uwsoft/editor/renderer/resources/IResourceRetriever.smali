.class public interface abstract Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;
.super Ljava/lang/Object;
.source "IResourceRetriever.java"


# virtual methods
.method public abstract getBitmapFont(Ljava/lang/String;I)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
.end method

.method public abstract getParticleEffect(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;
.end method

.method public abstract getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;
.end method

.method public abstract getSCMLFile(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
.end method

.method public abstract getSceneVO(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;
.end method

.method public abstract getSkeletonAtlas(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;
.end method

.method public abstract getSkeletonJSON(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
.end method

.method public abstract getSkin()Lcom/uwsoft/editor/renderer/utils/MySkin;
.end method

.method public abstract getSpriteAnimation(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;
.end method

.method public abstract getTextureRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
.end method
