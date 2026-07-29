# Explore: explore_1041
# Auto-generated LookML Explore File

include: "/views/domain_24/view_03124.view.lkml"
include: "/views/domain_26/view_03126.view.lkml"
include: "/views/domain_27/view_03127.view.lkml"
include: "/views/domain_28/view_03128.view.lkml"

explore: explore_1041 {
  label: "Explore Explore 1041"
  description: "Comprehensive analytics explore joining base view_03124 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03124
  
  always_filter: {
    filters: [view_03124.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03124.created_at_date: "7 days"]
    unless: [view_03124.id, view_03124.status]
  }

  join: view_03126 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03124.user_id} = ${view_03126.id} ;;
    required_joins: []
  }

  join: view_03127 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03124.account_id} = ${view_03127.account_id} ;;
    required_joins: [view_03126]
  }

  join: view_03128 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03124.category} = ${view_03128.category} ;;
  }

  access_filter: {
    field: view_03124.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03124.is_deleted} = false ;;
}
