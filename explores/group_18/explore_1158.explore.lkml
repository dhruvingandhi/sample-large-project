# Explore: explore_1158
# Auto-generated LookML Explore File

include: "/views/domain_25/view_03475.view.lkml"
include: "/views/domain_27/view_03477.view.lkml"
include: "/views/domain_28/view_03478.view.lkml"
include: "/views/domain_29/view_03479.view.lkml"

explore: explore_1158 {
  label: "Explore Explore 1158"
  description: "Comprehensive analytics explore joining base view_03475 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03475
  
  always_filter: {
    filters: [view_03475.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03475.created_at_date: "7 days"]
    unless: [view_03475.id, view_03475.status]
  }

  join: view_03477 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03475.user_id} = ${view_03477.id} ;;
    required_joins: []
  }

  join: view_03478 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03475.account_id} = ${view_03478.account_id} ;;
    required_joins: [view_03477]
  }

  join: view_03479 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03475.category} = ${view_03479.category} ;;
  }

  access_filter: {
    field: view_03475.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03475.is_deleted} = false ;;
}
