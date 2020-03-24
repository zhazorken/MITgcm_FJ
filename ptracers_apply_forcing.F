C $Header: /u/gcmpack/MITgcm/pkg/ptracers/ptracers_apply_forcing.F,v 1.1 2014/07/09 16:54:21 jmc Exp $
C $Name:  $

#include "PTRACERS_OPTIONS.h"

CBOP
C !ROUTINE: PTRACERS_APPLY_FORCING

C !INTERFACE: ==========================================================
      SUBROUTINE PTRACERS_APPLY_FORCING(
     U                    gPtracer,
     I                    surfForcPtr,
     I                    iMin,iMax,jMin,jMax, k, bi, bj,
     I                    iTracer, myTime, myIter, myThid )

C !DESCRIPTION:
C     Apply passive tracer forcing, i.e., sources and sinks of tracer,
C      by adding forcing terms to the tendency array

C !USES: ===============================================================
      IMPLICIT NONE
#include "SIZE.h"
#include "EEPARAMS.h"
#include "PARAMS.h"
#include "GRID.h"
#ifdef ALLOW_ICEPLUME
#include "ICEPLUME.h"
#include "FFIELDS.h"
#include "PTRACERS_PARAMS.h"
#include "PTRACERS_START.h"
#include "PTRACERS_FIELDS.h"
#endif /* ALLOW_ICEPLUME */

C !INPUT PARAMETERS: ===================================================
C  gPtracer             :: the tendency array
C  surfForcPtr          :: surface forcing term
C  iMin iMax jMin jMax  :: working range of tile for applying forcing
C  k                    :: vertical level number
C  bi,bj                :: tile indices
C  iTracer              :: tracer number
C  myIter               :: time-step number
C  myTime               :: model time
C  myThid               :: thread number
      _RL gPtracer   (1-OLx:sNx+OLx,1-OLy:sNy+OLy)
      _RL surfForcPtr(1-OLx:sNx+OLx,1-OLy:sNy+OLy)
      INTEGER iMin,iMax,jMin,jMax
      INTEGER k, bi,bj, iTracer
      _RL myTime
      INTEGER myIter
      INTEGER myThid

C !OUTPUT PARAMETERS: ==================================================
C  gPtracer       :: updates tendency array

#ifdef ALLOW_PTRACERS

C !LOCAL VARIABLES: ====================================================
C  i,j            :: loop indices
      INTEGER i,j
C     number of surface interface layer
      INTEGER kSurface

#ifdef ALLOW_ICEPLUME
      _RL ptr_addMass
#endif /* ALLOW_ICEPLUME */

CEOP

      IF ( usingPCoords ) THEN
       kSurface = Nr
      ELSE
       kSurface = 1
      ENDIF

C--   Surface forcing term surfForcPtr is previously computed by
C     PTRACERS_FORCING_SURF (and stored as surfaceForcingPTr)
C     because it is needed by KPP_TRANSPORT_PTR.

#ifdef ALLOW_GCHEM
      IF ( useGCHEM ) THEN
        CALL GCHEM_ADD_TENDENCY(
     U                 gPtracer,
     I                 iMin,iMax,jMin,jMax, k, bi, bj,
     I                 iTracer, myTime, myIter, myThid )
      ENDIF
#endif /* ALLOW_GCHEM */

      IF ( k .EQ. kSurface ) THEN
        DO j=jMin,jMax
         DO i=iMin,iMax
          gPtracer(i,j) = gPtracer(i,j)
     &                  + surfForcPtr(i,j)
     &                   *recip_drF(k)*recip_hFacC(i,j,k,bi,bj)
         ENDDO
        ENDDO
      ENDIF

#ifdef ALLOW_RBCS
      IF ( useRBCS ) THEN
         CALL RBCS_ADD_TENDENCY(
     U                 gPtracer,
     I                 k, bi, bj, iTracer+2,
     I                 myTime, myIter, myThid )
      ENDIF
#endif /* ALLOW_RBCS */


#ifdef ALLOW_ADDFLUID
#ifdef ALLOW_ICEPLUME

C This conveys the passive tracers through the plume, as for T and S

       ptr_addMass = 1 ! force loop entry
#endif /* ALLOW_ICEPLUME */

      IF ( selectAddFluid.NE.0 .AND. ptr_addMass.NE.UNSET_RL ) THEN
       IF ( ( selectAddFluid.GE.1 .AND. nonlinFreeSurf.GT.0 )
     &      .OR. convertFW2Salt.EQ.-1. _d 0 ) THEN

         DO j=1,sNy
          DO i=1,sNx

#ifdef ALLOW_ICEPLUME
       ptr_addMass = ptr_addMass3D(I,J,k,bi,bj,iTracer) ! get real value
#endif /* ALLOW_ICEPLUME */

            gPtracer(i,j) = gPtracer(i,j)
     &        + addMass(i,j,k,bi,bj)*mass2rUnit
     &          *( ptr_addMass - pTracer(i,j,k,bi,bj,iTracer) )
     &          *recip_rA(i,j,bi,bj)
     &          *recip_drF(k)*_recip_hFacC(i,j,k,bi,bj)
          ENDDO
         ENDDO
       ELSE
         DO j=1,sNy
          DO i=1,sNx

#ifdef ALLOW_ICEPLUME
       ptr_addMass = ptr_addMass3D(I,J,k,bi,bj,iTracer) ! get real value
#endif /* ALLOW_ICEPLUME */

            gPtracer(i,j) = gPtracer(i,j)
     &        + addMass(i,j,k,bi,bj)*mass2rUnit
     &          *( ptr_addMass - PTRACERS_ref(k,iTracer) )
     &          *recip_rA(i,j,bi,bj)
     &          *recip_drF(k)*_recip_hFacC(i,j,k,bi,bj)

          ENDDO
         ENDDO
       ENDIF
      ENDIF

#endif /* ALLOW_ADDFLUID */
#endif /* ALLOW_PTRACERS */

      RETURN
      END
