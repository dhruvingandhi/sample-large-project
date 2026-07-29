# Explore: explore_0841
# Auto-generated LookML Explore File

include: "/views/domain_24/view_02524.view.lkml"
include: "/views/domain_26/view_02526.view.lkml"
include: "/views/domain_27/view_02527.view.lkml"
include: "/views/domain_28/view_02528.view.lkml"

explore: explore_0841 {
  label: "Explore Explore 0841"
  description: "Comprehensive analytics explore joining base view_02524 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02524
  
  always_filter: {
    filters: [view_02524.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02524.created_at_date: "7 days"]
    unless: [view_02524.id, view_02524.status]
  }

  join: view_02526 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02524.user_id} = ${view_02526.id} ;;
    required_joins: []
  }

  join: view_02527 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02524.account_id} = ${view_02527.account_id} ;;
    required_joins: [view_02526]
  }

  join: view_02528 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02524.category} = ${view_02528.category} ;;
  }

  access_filter: {
    field: view_02524.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02524.is_deleted} = false ;;
}
