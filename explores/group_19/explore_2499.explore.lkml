# Explore: explore_2499
# Auto-generated LookML Explore File

include: "/views/domain_48/view_07498.view.lkml"
include: "/views/domain_50/view_07500.view.lkml"
include: "/views/domain_01/view_07501.view.lkml"
include: "/views/domain_02/view_07502.view.lkml"

explore: explore_2499 {
  label: "Explore Explore 2499"
  description: "Comprehensive analytics explore joining base view_07498 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07498
  
  always_filter: {
    filters: [view_07498.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07498.created_at_date: "7 days"]
    unless: [view_07498.id, view_07498.status]
  }

  join: view_07500 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07498.user_id} = ${view_07500.id} ;;
    required_joins: []
  }

  join: view_07501 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07498.account_id} = ${view_07501.account_id} ;;
    required_joins: [view_07500]
  }

  join: view_07502 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07498.category} = ${view_07502.category} ;;
  }

  access_filter: {
    field: view_07498.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07498.is_deleted} = false ;;
}
