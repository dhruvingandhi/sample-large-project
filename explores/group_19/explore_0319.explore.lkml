# Update for 2000 file diff target
# Explore: explore_0319
# Auto-generated LookML Explore File

include: "/views/domain_08/view_00958.view.lkml"
include: "/views/domain_10/view_00960.view.lkml"
include: "/views/domain_11/view_00961.view.lkml"
include: "/views/domain_12/view_00962.view.lkml"

explore: explore_0319 {
  label: "Explore Explore 0319"
  description: "Comprehensive analytics explore joining base view_00958 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00958
  
  always_filter: {
    filters: [view_00958.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00958.created_at_date: "7 days"]
    unless: [view_00958.id, view_00958.status]
  }

  join: view_00960 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00958.user_id} = ${view_00960.id} ;;
    required_joins: []
  }

  join: view_00961 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00958.account_id} = ${view_00961.account_id} ;;
    required_joins: [view_00960]
  }

  join: view_00962 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00958.category} = ${view_00962.category} ;;
  }

  access_filter: {
    field: view_00958.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00958.is_deleted} = false ;;
}
