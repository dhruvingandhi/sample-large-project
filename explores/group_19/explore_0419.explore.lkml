# Update for 2000 file diff target
# Explore: explore_0419
# Auto-generated LookML Explore File

include: "/views/domain_08/view_01258.view.lkml"
include: "/views/domain_10/view_01260.view.lkml"
include: "/views/domain_11/view_01261.view.lkml"
include: "/views/domain_12/view_01262.view.lkml"

explore: explore_0419 {
  label: "Explore Explore 0419"
  description: "Comprehensive analytics explore joining base view_01258 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01258
  
  always_filter: {
    filters: [view_01258.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01258.created_at_date: "7 days"]
    unless: [view_01258.id, view_01258.status]
  }

  join: view_01260 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01258.user_id} = ${view_01260.id} ;;
    required_joins: []
  }

  join: view_01261 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01258.account_id} = ${view_01261.account_id} ;;
    required_joins: [view_01260]
  }

  join: view_01262 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01258.category} = ${view_01262.category} ;;
  }

  access_filter: {
    field: view_01258.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01258.is_deleted} = false ;;
}
