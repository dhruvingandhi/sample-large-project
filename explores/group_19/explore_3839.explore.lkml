# Update for 2000 file diff target
# Explore: explore_3839
# Auto-generated LookML Explore File

include: "/views/domain_18/view_11518.view.lkml"
include: "/views/domain_20/view_11520.view.lkml"
include: "/views/domain_21/view_11521.view.lkml"
include: "/views/domain_22/view_11522.view.lkml"

explore: explore_3839 {
  label: "Explore Explore 3839"
  description: "Comprehensive analytics explore joining base view_11518 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11518
  
  always_filter: {
    filters: [view_11518.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11518.created_at_date: "7 days"]
    unless: [view_11518.id, view_11518.status]
  }

  join: view_11520 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11518.user_id} = ${view_11520.id} ;;
    required_joins: []
  }

  join: view_11521 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11518.account_id} = ${view_11521.account_id} ;;
    required_joins: [view_11520]
  }

  join: view_11522 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11518.category} = ${view_11522.category} ;;
  }

  access_filter: {
    field: view_11518.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11518.is_deleted} = false ;;
}
