export type LithoStage =
  | "pattern"
  | "retrieval"
  | "hypothesis_update"
  | "final";
export type PatternType =
  | "line"
  | "contact"
  | "corner"
  | "dense_array"
  | "custom";
export type InsightMode =
  | "nominal"
  | "stress"
  | "exploratory";
export interface MaskPattern {
  pattern_id: string;
  pattern_type: PatternType;
  width: number;
  height: number;
  pixels: number[][];
}
export interface SimulationResult {
  aerial_image: number[][];
  wafer_image: number[][];
  fidelity_score: number;
  edge_error: number;
  area_error: number;
}
export interface RetrievedRegime {
  regime_id: string;
  distance: number;
  focus_nm: number;
  dose_scale: number;
  blur_sigma: number;
  threshold: number;
  regime_class?: string | null;
}
export interface ProcessHypothesis {
  hypothesis_id: string;
  focus_nm: number;
  dose_scale: number;
  blur_sigma: number;
  threshold: number;
  posterior_weight: number;
  fidelity_score: number;
  edge_error: number;
  area_error: number;
}
export interface InsightBlock {
  mode: InsightMode;
  primary_driver: string;
  message: string;
}
export interface LithoFrame {
  frame_id: number;
  stage: LithoStage;
  pattern?: MaskPattern | null;
  best_result?: SimulationResult | null;
  retrieved_regimes: RetrievedRegime[];
  ranked_hypotheses: ProcessHypothesis[];
  insight?: InsightBlock | null;
}
export type TooltipKey =
  | "header_overview"
  | "mask_pattern"
  | "aerial_image"
  | "printed_wafer"
  | "retrieved_regimes"
  | "hypothesis_ranking"
  | "optics_insight"
  | "process_insight"
  | "inference_insight"
  | "controls_overview";
export interface TooltipEntry {
  title: string;
  body: string;
}
