# Explore: explore_0332
# Auto-generated LookML Explore File

include: "/views/domain_47/view_00997.view.lkml"
include: "/views/domain_49/view_00999.view.lkml"
include: "/views/domain_50/view_01000.view.lkml"
include: "/views/domain_01/view_01001.view.lkml"

explore: explore_0332 {
  label: "Explore Explore 0332"
  description: "Comprehensive analytics explore joining base view_00997 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00997
  
  always_filter: {
    filters: [view_00997.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00997.created_at_date: "7 days"]
    unless: [view_00997.id, view_00997.status]
  }

  join: view_00999 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00997.user_id} = ${view_00999.id} ;;
    required_joins: []
  }

  join: view_01000 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00997.account_id} = ${view_01000.account_id} ;;
    required_joins: [view_00999]
  }

  join: view_01001 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00997.category} = ${view_01001.category} ;;
  }

  access_filter: {
    field: view_00997.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00997.is_deleted} = false ;;
}
