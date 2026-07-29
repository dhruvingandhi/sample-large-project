# Explore: explore_0156
# Auto-generated LookML Explore File

include: "/views/domain_19/view_00469.view.lkml"
include: "/views/domain_21/view_00471.view.lkml"
include: "/views/domain_22/view_00472.view.lkml"
include: "/views/domain_23/view_00473.view.lkml"

explore: explore_0156 {
  label: "Explore Explore 0156"
  description: "Comprehensive analytics explore joining base view_00469 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00469
  
  always_filter: {
    filters: [view_00469.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00469.created_at_date: "7 days"]
    unless: [view_00469.id, view_00469.status]
  }

  join: view_00471 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00469.user_id} = ${view_00471.id} ;;
    required_joins: []
  }

  join: view_00472 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00469.account_id} = ${view_00472.account_id} ;;
    required_joins: [view_00471]
  }

  join: view_00473 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00469.category} = ${view_00473.category} ;;
  }

  access_filter: {
    field: view_00469.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00469.is_deleted} = false ;;
}
