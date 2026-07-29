# Explore: explore_2828
# Auto-generated LookML Explore File

include: "/views/domain_35/view_08485.view.lkml"
include: "/views/domain_37/view_08487.view.lkml"
include: "/views/domain_38/view_08488.view.lkml"
include: "/views/domain_39/view_08489.view.lkml"

explore: explore_2828 {
  label: "Explore Explore 2828"
  description: "Comprehensive analytics explore joining base view_08485 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08485
  
  always_filter: {
    filters: [view_08485.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08485.created_at_date: "7 days"]
    unless: [view_08485.id, view_08485.status]
  }

  join: view_08487 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08485.user_id} = ${view_08487.id} ;;
    required_joins: []
  }

  join: view_08488 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08485.account_id} = ${view_08488.account_id} ;;
    required_joins: [view_08487]
  }

  join: view_08489 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08485.category} = ${view_08489.category} ;;
  }

  access_filter: {
    field: view_08485.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08485.is_deleted} = false ;;
}
