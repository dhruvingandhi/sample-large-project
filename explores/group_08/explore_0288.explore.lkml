# Explore: explore_0288
# Auto-generated LookML Explore File

include: "/views/domain_15/view_00865.view.lkml"
include: "/views/domain_17/view_00867.view.lkml"
include: "/views/domain_18/view_00868.view.lkml"
include: "/views/domain_19/view_00869.view.lkml"

explore: explore_0288 {
  label: "Explore Explore 0288"
  description: "Comprehensive analytics explore joining base view_00865 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00865
  
  always_filter: {
    filters: [view_00865.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00865.created_at_date: "7 days"]
    unless: [view_00865.id, view_00865.status]
  }

  join: view_00867 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00865.user_id} = ${view_00867.id} ;;
    required_joins: []
  }

  join: view_00868 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00865.account_id} = ${view_00868.account_id} ;;
    required_joins: [view_00867]
  }

  join: view_00869 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00865.category} = ${view_00869.category} ;;
  }

  access_filter: {
    field: view_00865.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00865.is_deleted} = false ;;
}
