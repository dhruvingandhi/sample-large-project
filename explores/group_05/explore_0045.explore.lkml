# Explore: explore_0045
# Auto-generated LookML Explore File

include: "/views/domain_36/view_00136.view.lkml"
include: "/views/domain_38/view_00138.view.lkml"
include: "/views/domain_39/view_00139.view.lkml"
include: "/views/domain_40/view_00140.view.lkml"

explore: explore_0045 {
  label: "Explore Explore 0045"
  description: "Comprehensive analytics explore joining base view_00136 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00136
  
  always_filter: {
    filters: [view_00136.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00136.created_at_date: "7 days"]
    unless: [view_00136.id, view_00136.status]
  }

  join: view_00138 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00136.user_id} = ${view_00138.id} ;;
    required_joins: []
  }

  join: view_00139 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00136.account_id} = ${view_00139.account_id} ;;
    required_joins: [view_00138]
  }

  join: view_00140 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00136.category} = ${view_00140.category} ;;
  }

  access_filter: {
    field: view_00136.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00136.is_deleted} = false ;;
}
