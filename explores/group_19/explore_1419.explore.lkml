# Update for 2000 file diff target
# Explore: explore_1419
# Auto-generated LookML Explore File

include: "/views/domain_08/view_04258.view.lkml"
include: "/views/domain_10/view_04260.view.lkml"
include: "/views/domain_11/view_04261.view.lkml"
include: "/views/domain_12/view_04262.view.lkml"

explore: explore_1419 {
  label: "Explore Explore 1419"
  description: "Comprehensive analytics explore joining base view_04258 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04258
  
  always_filter: {
    filters: [view_04258.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04258.created_at_date: "7 days"]
    unless: [view_04258.id, view_04258.status]
  }

  join: view_04260 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04258.user_id} = ${view_04260.id} ;;
    required_joins: []
  }

  join: view_04261 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04258.account_id} = ${view_04261.account_id} ;;
    required_joins: [view_04260]
  }

  join: view_04262 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04258.category} = ${view_04262.category} ;;
  }

  access_filter: {
    field: view_04258.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04258.is_deleted} = false ;;
}
