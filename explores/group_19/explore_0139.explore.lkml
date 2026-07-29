# Explore: explore_0139
# Auto-generated LookML Explore File

include: "/views/domain_18/view_00418.view.lkml"
include: "/views/domain_20/view_00420.view.lkml"
include: "/views/domain_21/view_00421.view.lkml"
include: "/views/domain_22/view_00422.view.lkml"

explore: explore_0139 {
  label: "Explore Explore 0139"
  description: "Comprehensive analytics explore joining base view_00418 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00418
  
  always_filter: {
    filters: [view_00418.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00418.created_at_date: "7 days"]
    unless: [view_00418.id, view_00418.status]
  }

  join: view_00420 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00418.user_id} = ${view_00420.id} ;;
    required_joins: []
  }

  join: view_00421 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00418.account_id} = ${view_00421.account_id} ;;
    required_joins: [view_00420]
  }

  join: view_00422 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00418.category} = ${view_00422.category} ;;
  }

  access_filter: {
    field: view_00418.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00418.is_deleted} = false ;;
}
