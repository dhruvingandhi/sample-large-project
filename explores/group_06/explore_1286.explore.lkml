# Explore: explore_1286
# Auto-generated LookML Explore File

include: "/views/domain_09/view_03859.view.lkml"
include: "/views/domain_11/view_03861.view.lkml"
include: "/views/domain_12/view_03862.view.lkml"
include: "/views/domain_13/view_03863.view.lkml"

explore: explore_1286 {
  label: "Explore Explore 1286"
  description: "Comprehensive analytics explore joining base view_03859 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03859
  
  always_filter: {
    filters: [view_03859.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03859.created_at_date: "7 days"]
    unless: [view_03859.id, view_03859.status]
  }

  join: view_03861 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03859.user_id} = ${view_03861.id} ;;
    required_joins: []
  }

  join: view_03862 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03859.account_id} = ${view_03862.account_id} ;;
    required_joins: [view_03861]
  }

  join: view_03863 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03859.category} = ${view_03863.category} ;;
  }

  access_filter: {
    field: view_03859.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03859.is_deleted} = false ;;
}
