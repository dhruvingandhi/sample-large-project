# Explore: explore_0633
# Auto-generated LookML Explore File

include: "/views/domain_50/view_01900.view.lkml"
include: "/views/domain_02/view_01902.view.lkml"
include: "/views/domain_03/view_01903.view.lkml"
include: "/views/domain_04/view_01904.view.lkml"

explore: explore_0633 {
  label: "Explore Explore 0633"
  description: "Comprehensive analytics explore joining base view_01900 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01900
  
  always_filter: {
    filters: [view_01900.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01900.created_at_date: "7 days"]
    unless: [view_01900.id, view_01900.status]
  }

  join: view_01902 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01900.user_id} = ${view_01902.id} ;;
    required_joins: []
  }

  join: view_01903 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01900.account_id} = ${view_01903.account_id} ;;
    required_joins: [view_01902]
  }

  join: view_01904 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01900.category} = ${view_01904.category} ;;
  }

  access_filter: {
    field: view_01900.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01900.is_deleted} = false ;;
}
