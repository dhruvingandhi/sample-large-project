# Explore: explore_2446
# Auto-generated LookML Explore File

include: "/views/domain_39/view_07339.view.lkml"
include: "/views/domain_41/view_07341.view.lkml"
include: "/views/domain_42/view_07342.view.lkml"
include: "/views/domain_43/view_07343.view.lkml"

explore: explore_2446 {
  label: "Explore Explore 2446"
  description: "Comprehensive analytics explore joining base view_07339 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07339
  
  always_filter: {
    filters: [view_07339.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07339.created_at_date: "7 days"]
    unless: [view_07339.id, view_07339.status]
  }

  join: view_07341 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07339.user_id} = ${view_07341.id} ;;
    required_joins: []
  }

  join: view_07342 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07339.account_id} = ${view_07342.account_id} ;;
    required_joins: [view_07341]
  }

  join: view_07343 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07339.category} = ${view_07343.category} ;;
  }

  access_filter: {
    field: view_07339.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07339.is_deleted} = false ;;
}
