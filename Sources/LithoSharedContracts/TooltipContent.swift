import Foundation
public enum TooltipKey: String, CaseIterable, Codable, Sendable {
    case headerOverview = "header_overview"
    case maskPattern = "mask_pattern"
    case aerialImage = "aerial_image"
    case printedWafer = "printed_wafer"
    case retrievedRegimes = "retrieved_regimes"
    case hypothesisRanking = "hypothesis_ranking"
    case opticsInsight = "optics_insight"
    case processInsight = "process_insight"
    case inferenceInsight = "inference_insight"
    case controlsOverview = "controls_overview"
}
public struct TooltipEntry: Codable, Sendable, Equatable {
    public let title: String
    public let body: String
    public init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
public enum TooltipContent {
    public static let registry: [TooltipKey: TooltipEntry] = [
        .headerOverview: TooltipEntry(
            title: "What this engine is",
            body: "This public demonstration shows a reduced-order computational lithography decision engine combining geometric pattern encoding, process-neighborhood retrieval, simplified optical image formation, and multi-hypothesis ranking."
        ),
        .maskPattern: TooltipEntry(
            title: "Mask pattern",
            body: "This is the intended geometric fragment before projection through the imaging system. The printed wafer result depends not only on geometry, but on optical transfer, process response, and local context."
        ),
        .aerialImage: TooltipEntry(
            title: "Aerial image",
            body: "This continuous intensity field represents the optical image formed from the input geometry under the current process hypothesis. It is an intermediate optical field, not the final printed topology."
        ),
        .printedWafer: TooltipEntry(
            title: "Printed wafer result",
            body: "This panel shows the predicted printed topology after simplified process response. Small changes in focus, dose, or threshold behavior can materially alter line width, corner fidelity, or bridging tendency."
        ),
        .retrievedRegimes: TooltipEntry(
            title: "Retrieved regimes",
            body: "The engine encodes the current geometry into a compact latent process signature and retrieves nearby prior regimes. These seed the hypothesis set and provide process-context grounding without disclosing proprietary correction strategy."
        ),
        .hypothesisRanking: TooltipEntry(
            title: "Hypothesis ranking",
            body: "The engine evaluates multiple candidate exposure states in parallel, scores each predicted print outcome against geometric fidelity criteria, and maintains ranked alternatives as evidence evolves."
        ),
        .opticsInsight: TooltipEntry(
            title: "Optical image formation",
            body: "The intermediate intensity field is generated from the mask geometry using a reduced-order image formation model. The public demonstration simplifies the internal representation while preserving interpretable optical structure."
        ),
        .processInsight: TooltipEntry(
            title: "Resist and process response",
            body: "Printed topology depends on threshold behavior, local process window, and sensitivity under dose and focus variation. The public demonstration simplifies these interactions while preserving process-dependent divergence."
        ),
        .inferenceInsight: TooltipEntry(
            title: "Multi-state decision logic",
            body: "Instead of collapsing uncertainty to one answer, the engine retrieves nearby process neighborhoods, generates competing hypotheses, and ranks predicted outcomes by fidelity and plausibility."
        ),
        .controlsOverview: TooltipEntry(
            title: "Controls",
            body: "Pattern selection, stress mode, and overlay controls allow exploration of how geometry, optical image formation, and process variation influence the ranked hypothesis set."
        )
    ]
}
