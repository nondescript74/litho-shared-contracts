import Foundation
public enum LithoStage: String, Codable, Sendable {
    case pattern
    case retrieval
    case hypothesisUpdate = "hypothesis_update"
    case final
}
public enum PatternType: String, Codable, Sendable {
    case line
    case contact
    case corner
    case denseArray = "dense_array"
    case custom
}
public enum InsightMode: String, Codable, Sendable {
    case nominal
    case stress
    case exploratory
}
public struct MaskPattern: Codable, Sendable, Equatable {
    public let patternID: String
    public let patternType: PatternType
    public let width: Int
    public let height: Int
    public let pixels: [[Double]]
    public init(
        patternID: String,
        patternType: PatternType,
        width: Int,
        height: Int,
        pixels: [[Double]]
    ) {
        self.patternID = patternID
        self.patternType = patternType
        self.width = width
        self.height = height
        self.pixels = pixels
    }
    enum CodingKeys: String, CodingKey {
        case patternID = "pattern_id"
        case patternType = "pattern_type"
        case width
        case height
        case pixels
    }
}
public struct ProcessHypothesis: Codable, Sendable, Equatable, Identifiable {
    public let id: String
    public let focusNM: Double
    public let doseScale: Double
    public let blurSigma: Double
    public let threshold: Double
    public let posteriorWeight: Double
    public let fidelityScore: Double
    public let edgeError: Double
    public let areaError: Double
    public init(
        id: String,
        focusNM: Double,
        doseScale: Double,
        blurSigma: Double,
        threshold: Double,
        posteriorWeight: Double,
        fidelityScore: Double,
        edgeError: Double,
        areaError: Double
    ) {
        self.id = id
        self.focusNM = focusNM
        self.doseScale = doseScale
        self.blurSigma = blurSigma
        self.threshold = threshold
        self.posteriorWeight = posteriorWeight
        self.fidelityScore = fidelityScore
        self.edgeError = edgeError
        self.areaError = areaError
    }
    enum CodingKeys: String, CodingKey {
        case id = "hypothesis_id"
        case focusNM = "focus_nm"
        case doseScale = "dose_scale"
        case blurSigma = "blur_sigma"
        case threshold
        case posteriorWeight = "posterior_weight"
        case fidelityScore = "fidelity_score"
        case edgeError = "edge_error"
        case areaError = "area_error"
    }
}
public struct RetrievedRegime: Codable, Sendable, Equatable, Identifiable {
    public let id: String
    public let distance: Double
    public let focusNM: Double
    public let doseScale: Double
    public let blurSigma: Double
    public let threshold: Double
    public let regimeClass: String?
    public init(
        id: String,
        distance: Double,
        focusNM: Double,
        doseScale: Double,
        blurSigma: Double,
        threshold: Double,
        regimeClass: String? = nil
    ) {
        self.id = id
        self.distance = distance
        self.focusNM = focusNM
        self.doseScale = doseScale
        self.blurSigma = blurSigma
        self.threshold = threshold
        self.regimeClass = regimeClass
    }
    enum CodingKeys: String, CodingKey {
        case id = "regime_id"
        case distance
        case focusNM = "focus_nm"
        case doseScale = "dose_scale"
        case blurSigma = "blur_sigma"
        case threshold
        case regimeClass = "regime_class"
    }
}
public struct SimulationResult: Codable, Sendable, Equatable {
    public let aerialImage: [[Double]]
    public let waferImage: [[Double]]
    public let fidelityScore: Double
    public let edgeError: Double
    public let areaError: Double
    public init(
        aerialImage: [[Double]],
        waferImage: [[Double]],
        fidelityScore: Double,
        edgeError: Double,
        areaError: Double
    ) {
        self.aerialImage = aerialImage
        self.waferImage = waferImage
        self.fidelityScore = fidelityScore
        self.edgeError = edgeError
        self.areaError = areaError
    }
    enum CodingKeys: String, CodingKey {
        case aerialImage = "aerial_image"
        case waferImage = "wafer_image"
        case fidelityScore = "fidelity_score"
        case edgeError = "edge_error"
        case areaError = "area_error"
    }
}
public struct InsightBlock: Codable, Sendable, Equatable {
    public let mode: InsightMode
    public let primaryDriver: String
    public let message: String
    public init(
        mode: InsightMode,
        primaryDriver: String,
        message: String
    ) {
        self.mode = mode
        self.primaryDriver = primaryDriver
        self.message = message
    }
    enum CodingKeys: String, CodingKey {
        case mode
        case primaryDriver = "primary_driver"
        case message
    }
}
public struct LithoFrame: Codable, Sendable, Equatable {
    public let frameID: Int
    public let stage: LithoStage
    public let pattern: MaskPattern?
    public let bestResult: SimulationResult?
    public let retrievedRegimes: [RetrievedRegime]
    public let rankedHypotheses: [ProcessHypothesis]
    public let insight: InsightBlock?
    public init(
        frameID: Int,
        stage: LithoStage,
        pattern: MaskPattern? = nil,
        bestResult: SimulationResult? = nil,
        retrievedRegimes: [RetrievedRegime] = [],
        rankedHypotheses: [ProcessHypothesis] = [],
        insight: InsightBlock? = nil
    ) {
        self.frameID = frameID
        self.stage = stage
        self.pattern = pattern
        self.bestResult = bestResult
        self.retrievedRegimes = retrievedRegimes
        self.rankedHypotheses = rankedHypotheses
        self.insight = insight
    }
    enum CodingKeys: String, CodingKey {
        case frameID = "frame_id"
        case stage
        case pattern
        case bestResult = "best_result"
        case retrievedRegimes = "retrieved_regimes"
        case rankedHypotheses = "ranked_hypotheses"
        case insight
    }
}
public extension LithoFrame {
    static func decode(from data: Data) throws -> LithoFrame {
        let decoder = JSONDecoder()
        return try decoder.decode(LithoFrame.self, from: data)
    }
    func encode(prettyPrinted: Bool = false) throws -> Data {
        let encoder = JSONEncoder()
        if prettyPrinted {
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        }
        return try encoder.encode(self)
    }
}
