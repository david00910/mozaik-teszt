<?php

namespace App\Http\Controllers;

use App\County;
use App\Settlement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Mockery\Exception;
use Carbon\Carbon;

class SettlementFinderController extends Controller
{
    protected function indexCounties()
    {

        try {

            $counties = County::all();

        }
        catch (Exception $e) {
            return response()->json([
                'status' => $e->getCode(),
                'msg' => $e->getMessage()
            ], 400);
        }

        return response()->json(
            $counties, 200
        );
    }

    protected function indexSettlements($id)
    {

        try {

            $settlements = County::find($id)->settlements;

        }
        catch (Exception $e) {
            return response()->json([
                'status' => $e->getCode(),
                'msg' => $e->getMessage()
            ], 400);
        }

        return response()->json(
            $settlements, 200
        );
    }

    protected function addNewSettlement(Request $request)
    {
        Validator::make($request->all(), [
            'newSettlementName' => 'required',
            'newSettlementpCode' => 'required',
            'countyId' => 'required'

        ]);


        DB::beginTransaction();

        try {

            $settlement = new Settlement();
            $settlement->sName = $request->newSettlementName;
            $settlement->pCode = $request->newSettlementpCode;
            $settlement->county = $request->countyId;
            $settlement->updated_at = now();
            $settlement->save();
            DB::commit();

            return response()->json([
                'status' => 'A település hozzáadása sikeres volt. Köszönjük hozzájárulását!',
            ], 200);

        }
        catch (Exception $e) {
            return response()->json([
                'status' => $e->getCode(),
                'msg' => $e->getMessage()
            ], 400);
        }

    }

    protected function editSettlement(Request $request, $id)
    {
        Validator::make($request->all(), [
            'editedSettlementName' => 'required',
            'editedSettlementpCode' => 'required',
            'countyId' => 'required'

        ]);


        DB::beginTransaction();

        try {

            $settlement = Settlement::find($id);
            $settlement->sName = $request->editedSettlementName;
            $settlement->pCode = $request->editedSettlementpCode;
            $settlement->county = $request->countyId;
            $settlement->updated_at = now();
            $settlement->save();
            DB::commit();

            return response()->json([
                'status' => 'A település módosítása sikeres volt.',
            ], 200);

        }
        catch (Exception $e) {
            return response()->json([
                'status' => $e->getCode(),
                'msg' => $e->getMessage()
            ], 400);
        }

    }

    protected function deleteSettlement($id) {
        $settlement = Settlement::find($id);

        if ($settlement->delete()) {

            return response()->json(['msg' => 'A település törlése sikeres volt.'], 200);
        } else {
            return response()->json(['msg' => 'Hiba történt a törlés során. Próbálja újra!'], 500);
        }
    }
}
