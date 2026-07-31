# Update for 2000 file diff target
# Explore: explore_3440
# Auto-generated LookML Explore File

include: "/views/domain_21/view_10321.view.lkml"
include: "/views/domain_23/view_10323.view.lkml"
include: "/views/domain_24/view_10324.view.lkml"
include: "/views/domain_25/view_10325.view.lkml"

explore: explore_3440 {
  label: "Explore Explore 3440"
  description: "Comprehensive analytics explore joining base view_10321 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10321
  
  always_filter: {
    filters: [view_10321.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10321.created_at_date: "7 days"]
    unless: [view_10321.id, view_10321.status]
  }

  join: view_10323 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10321.user_id} = ${view_10323.id} ;;
    required_joins: []
  }

  join: view_10324 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10321.account_id} = ${view_10324.account_id} ;;
    required_joins: [view_10323]
  }

  join: view_10325 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10321.category} = ${view_10325.category} ;;
  }

  access_filter: {
    field: view_10321.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10321.is_deleted} = false ;;
}
