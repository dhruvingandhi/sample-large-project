# Explore: explore_3446
# Auto-generated LookML Explore File

include: "/views/domain_39/view_10339.view.lkml"
include: "/views/domain_41/view_10341.view.lkml"
include: "/views/domain_42/view_10342.view.lkml"
include: "/views/domain_43/view_10343.view.lkml"

explore: explore_3446 {
  label: "Explore Explore 3446"
  description: "Comprehensive analytics explore joining base view_10339 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10339
  
  always_filter: {
    filters: [view_10339.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10339.created_at_date: "7 days"]
    unless: [view_10339.id, view_10339.status]
  }

  join: view_10341 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10339.user_id} = ${view_10341.id} ;;
    required_joins: []
  }

  join: view_10342 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10339.account_id} = ${view_10342.account_id} ;;
    required_joins: [view_10341]
  }

  join: view_10343 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10339.category} = ${view_10343.category} ;;
  }

  access_filter: {
    field: view_10339.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10339.is_deleted} = false ;;
}
