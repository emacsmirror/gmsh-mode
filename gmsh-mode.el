;;; gmsh-mode.el --- Highlight GMSH mesh generator script syntax -*- lexical-binding: t -*-

;; Author: Matsievskiy S.V.
;; Maintainer: Matsievskiy S.V.
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.1"))
;; Homepage: https://gitlab.com/matsievskiysv/gmsh-mode
;; Keywords: languages


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; Highlight GMSH mesh generator script syntax.

(require 'cc-mode)

;;; Code:

(defvar gmsh-fontlock-builtin-functions
  (list
   "Acos"
   "Asin"
   "Atan"
   "Atan2"
   "Ceil"
   "Cos"
   "Cosh"
   "Exp"
   "Fabs"
   "Fmod"
   "Floor"
   "Hypot"
   "Log"
   "Log10"
   "Max"
   "Min"
   "Modulo"
   "Rand"
   "Round"
   "Sqrt"
   "Sin"
   "Sinh"
   "Tan"
   "Tanh"
   "Cpu"
   "Memory"
   "TotalMemory"
   "newp"
   "newc"
   "newcl"
   "newl"
   "news"
   "newv"
   "newll"
   "newsl"
   "newreg"
   "Str"
   "DefineConstant"
   "SetNumber"
   "SetString"
   "Abort"
   "Exit"
   "CreateDir"
   "Printf"
   "Warning"
   "Error"
   "Merge"
   "ShapeFromFile"
   "Draw"
   "SplitCurrentWindowHorizontal"
   "SplitCurrentWindowVertical"
   "SetCurrentWindow"
   "UnsplitWindow"
   "SetChanged"
   "BoundingBox"
   "Delete Model"
   "Delete Physicals"
   "Delete Variables"
   "Delete Options"
   "Delete"
   "Print"
   "Sleep"
   "SystemCall"
   "NonBlockingSystemCall"
   "OnelabRun"
   "SetName"
   "SetFactory"
   "SyncModel"
   "NewModel"
   "Include"
   "Physical Point"
   "Point"
   "Line"
   "Bezier"
   "BSpline"
   "Spline"
   "Circle"
   "Ellipse"
   "Compound"
   "Curve Loop"
   "Curve"
   "Wire"
   "Physical Curve"
   "Line Loop"
   "Physical Surface"
   "Surface"
   "Plane Surface"
   "BSpline Surface"
   "Bezier Surface"
   "Disk"
   "Rectangle"
   "Surface Loop"
   "Volume"
   "Sphere"
   "Box"
   "Cylinder"
   "Torus"
   "Cone"
   "Wedge"
   "ThruSections"
   "Ruled ThruSections"
   "Physical Volume"
   "Extrude"
   "Layers"
   "QuadTriNoNewVerts"
   "QuadTriAddVerts"
   "ThruSections"
   "Ruled ThruSections"
   "Fillet"
   "Chamfer"
   "BooleanIntersection"
   "BooleanUnion"
   "BooleanDifference"
   "BooleanFragments"
   "BooleanIntersection"
   "BooleanUnion"
   "BooleanDifference"
   "Dilate"
   "Rotate"
   "Symmetry"
   "Affine"
   "Translate"
   "Boundary"
   "CombinedBoundary"
   "PointsOf"
   "Intersect Curve"
   "Split Curve"
   "Coherence"
   "Recursive Delete"
   "Delete"
   "Delete Embedded"
   "SetMaxTag Point"
   "Recursive Hide"
   "Hide"
   "Recursive Show"
   "Show"
   "MeshSize"
   "Background Field"
   "Field"
   "Attractor"
   "AttractorAnisoCurve"
   "AutomaticMeshSizeField"
   "Ball"
   "BoundaryLayer"
   "Box"
   "Curvature"
   "Cylinder"
   "Distance"
   "ExternalProcess"
   "Frustum"
   "Gradient"
   "IntersectAniso"
   "Laplacian"
   "LonLat"
   "MathEval"
   "MathEvalAniso"
   "Max"
   "MaxEigenHessian"
   "Mean"
   "Min"
   "MinAniso"
   "Octree"
   "Param"
   "PostView"
   "Restrict"
   "Structured"
   "Threshold"
   "Transfinite Curve"
   "Transfinite Surface"
   "Transfinite Volume"
   "TransfQuadTri"
   "RefineMesh"
   "OptimizeMesh"
   "AdaptMesh"
   "RelocateMesh"
   "RecombineMesh"
   "Recombine"
   "SetOrder"
   "PartitionMesh"
   "Periodic Curve"
   "Periodic Surface"
   "Coherence Mesh"
   "CreateTopology"
   "CreateGeometry"
   "ClassifySurfaces"
   "RenumberMeshNodes"
   "RenumberMeshElements"
   "Recursive Color"
   "Color"
   "Recombine Surface"
   "MeshAlgorithm Surface"
   "MeshSizeFromBoundary Surface"
   "Compound Curve"
   "Compaund Surface"
   "ReverseMesh"
   "ReorientMesh"
   "Save"
   "Smoother Surface"
   "Homology"
   "Cohomology"
   "Alias View"
   "AliasWithOptions View"
   "CopyOptions View"
   "Combine ElementsByViewName"
   "Combine ElementsFromAllViews"
   "Combine Views"
   "Combine ElementsFromVisibleViews"
   "Combine TimeStepsByViewName"
   "Combine TimeSteps"
   "Combine TimeStepsFromAllViews"
   "Combine TimeStepsFromVisibleViews"
   "Delete View"
   "Delete Empty Views"
   "Background Mesh View"
   "Plugin"
   "Run"
   "SendToServer View"
   "TIME"
   "INTERPOLATION_SCHEME"
   "Find"
   "StrFind"
   "StrCmp"
   "StrLen"
   "TextAttributes"
   "Exists"
   "FileExists"
   "StringToName"
   "GetNumber"
   "GetValue"
   "DefineNumber"
   "List"
   "Unique"
   "Abs"
   "ListFromFile"
   "LinSpace"
   "LogSpace"
   "Mass"
   "CenterOfMass"
   "MatrixOfInertia"
   "Today"
   "OnelabAction"
   "GmshExecutableName"
   "CurrentDirectory"
   "CurrentDir"
   "CurrentFileName"
   "StrPrefix"
   "StrRelative"
   "StrCat"
   "Str"
   "StrChoice"
   "StrSub"
   "UpperCase"
   "AbsolutePath"
   "DirName"
   "Sprintf"
   "GetEnv"
   "GetString"
   "GetStringValue"
   "StrReplace"
   "NameToString"
   "DefineString"
   "Mesh"
   "Duplicata"
   "Left"
   "Right"
   "Alternate"
   "AlternateRight"
   "AlternateLeft"
   "Using View"
   "ScaleLastLayer"
   "Using Progression"
   "Bump"
   "N2S"
   "System"
   "Using Sewing"
   "Using Wire"
   "Using")
  "List of GMSH builtin functions.")

(defvar gmsh-fontlock-keywords
  (list
   "For"
   "In"
   "EndFor"
   "If"
   "ElseIf"
   "Else"
   "EndIf"
   "Return"
   "Choices"
   "Name")
  "List of GMSH keywords.")

(defvar gmsh-fontlock-constants
  (list
   "View"
   "Pi"
   "GMSH_MAJOR_VERSION"
   "GMSH_MINOR_VERSION"
   "GMSH_PATCH_VERSION"
   "MPI_Size"
   "MPI_Rank")
  "List of GMSH constants.")

(defvar gmsh-font-lock-keywords
  (list
   (cons "!" 'font-lock-negation-char-face)
   (list (concat
	  "\\(?:^\\|;\\|=\\)\\s-*\\("
	  (regexp-opt '("Mesh" "Geometry" "General" "PostProcessing"))
	  "\\(?:\\.\\(?:\\sw\\|\\s_\\)+\\)+\\)")
	 1
	 'font-lock-constant-face)
   (list "\\(Macro\\|Call\\)\\s-+\\(\\(?:\\sw\\|\\s_\\)+\\)\\b"
	 '(1 font-lock-keyword-face)
	 '(2 font-lock-function-name-face))
   (cons (concat "\\b" (regexp-opt gmsh-fontlock-keywords) "\\b") 'font-lock-keyword-face)
   (cons (concat "\\b" (regexp-opt gmsh-fontlock-builtin-functions) "\\b") 'font-lock-builtin-face)
   (cons (concat "\\b" (regexp-opt gmsh-fontlock-constants) "\\b") 'font-lock-constant-face)
   (list "\\(?:^\\|;\\)\\s-*\\(\\(?:\\sw\\|\\s_\\)+\\)\\(?:\\[\\]\\)?\\s-*[\\+-\\*/]?="
	 1 'font-lock-variable-name-face)))

(defvar gmsh-mode-map
  (let ((map (make-sparse-keymap)))
    ;; currently empty
    map)
  "GMSH keymap.")

(defvar gmsh--completion-keywords
  (delete-dups (mapcan #'split-string (append gmsh-fontlock-builtin-functions
                                              gmsh-fontlock-keywords
                                              gmsh-fontlock-constants)))
  "GMSH completion list.")

;;;###autoload
(defun gmsh-mode-completion-at-point ()
  "GMSH function to be used for the hook `completion-at-point-functions'."
  (let* ((bds (bounds-of-thing-at-point 'symbol))
         (start (car bds))
         (end (cdr bds)))
    (list start end gmsh--completion-keywords . nil)))

;;;###autoload
(define-derived-mode gmsh-mode c-mode "GMSH"
  "GMSH mesh generator major mode."
  :group 'gmsh
  :syntax-table c-mode-syntax-table
  (setq-local comment-start "//"
              comment-padding 1
              indent-line-function 'c-indent-line
              font-lock-defaults '(gmsh-font-lock-keywords nil t))
  (add-hook 'completion-at-point-functions 'gmsh-mode-completion-at-point nil 'local))
(add-to-list 'auto-mode-alist '("\\.gmsh\\'" . gmsh-mode))
(add-to-list 'auto-mode-alist '("\\.geo\\'" . gmsh-mode))

(provide 'gmsh-mode)

;;; gmsh-mode.el ends here
