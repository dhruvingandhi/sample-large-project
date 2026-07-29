# Explore: explore_2555
# Auto-generated LookML Explore File

include: "/views/domain_16/view_07666.view.lkml"
include: "/views/domain_18/view_07668.view.lkml"
include: "/views/domain_19/view_07669.view.lkml"
include: "/views/domain_20/view_07670.view.lkml"

explore: explore_2555 {
  label: "Explore Explore 2555"
  description: "Comprehensive analytics explore joining base view_07666 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07666
  
  always_filter: {
    filters: [view_07666.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07666.created_at_date: "7 days"]
    unless: [view_07666.id, view_07666.status]
  }

  join: view_07668 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07666.user_id} = ${view_07668.id} ;;
    required_joins: []
  }

  join: view_07669 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07666.account_id} = ${view_07669.account_id} ;;
    required_joins: [view_07668]
  }

  join: view_07670 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07666.category} = ${view_07670.category} ;;
  }

  access_filter: {
    field: view_07666.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07666.is_deleted} = false ;;
}
