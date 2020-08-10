import { SubSurfaceScatteringPostProcess } from "../PostProcesses/subSurfaceScatteringPostProcess";
import { Scene } from "../scene";
import { ISceneComponent, SceneComponentConstants } from "../sceneComponent";
import { GeometryBufferRenderer } from "./geometryBufferRenderer";

declare module "../scene" {
    export interface Scene {

    }
}

/**
 * Defines the Geometry Buffer scene component responsible to manage a G-Buffer useful
 * in several rendering techniques.
 */
export class SubSurfaceScatteringSceneComponent implements ISceneComponent {
    /**
     * The component name helpful to identify the component in the list of scene components.
     */
    public readonly name = SceneComponentConstants.NAME_GEOMETRYBUFFERRENDERER;

    /**
     * The scene the component belongs to.
     */
    public scene: Scene;

    /**
     * Scene-wide subsurface scattering post process
     */
    public subSurfaceScatteringPostProcess: SubSurfaceScatteringPostProcess;

    /**
     * Creates a new instance of the component for the given scene
     * @param scene Defines the scene to register the component in
     */
    constructor(scene: Scene) {
        this.subSurfaceScatteringPostProcess = new SubSurfaceScatteringPostProcess("subSurfaceScattering", scene, 1, null, undefined, scene.getEngine());
        this.subSurfaceScatteringPostProcess.autoClear = false;
        this.scene = scene;
    }

    /**
     * Registers the component in a given scene
     */
    public register(): void {
    }

    /**
     * Rebuilds the elements related to this component in case of
     * context lost for instance.
     */
    public rebuild(): void {
        // Nothing to do for this component
    }

    /**
     * Disposes the component and the associated ressources
     */
    public dispose(): void {
        // Nothing to do for this component
    }

}

GeometryBufferRenderer._SceneComponentInitialization = (scene: Scene) => {
    // Register the G Buffer component to the scene.
    let component = scene._getComponent(SceneComponentConstants.NAME_GEOMETRYBUFFERRENDERER) as SubSurfaceScatteringSceneComponent;
    if (!component) {
        component = new SubSurfaceScatteringSceneComponent(scene);
        scene._addComponent(component);
    }
};
