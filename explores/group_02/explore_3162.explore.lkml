# Explore: explore_3162
# Auto-generated LookML Explore File

include: "/views/domain_37/view_09487.view.lkml"
include: "/views/domain_39/view_09489.view.lkml"
include: "/views/domain_40/view_09490.view.lkml"
include: "/views/domain_41/view_09491.view.lkml"

explore: explore_3162 {
  label: "Explore Explore 3162"
  description: "Comprehensive analytics explore joining base view_09487 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09487
  
  always_filter: {
    filters: [view_09487.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09487.created_at_date: "7 days"]
    unless: [view_09487.id, view_09487.status]
  }

  join: view_09489 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09487.user_id} = ${view_09489.id} ;;
    required_joins: []
  }

  join: view_09490 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09487.account_id} = ${view_09490.account_id} ;;
    required_joins: [view_09489]
  }

  join: view_09491 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09487.category} = ${view_09491.category} ;;
  }

  access_filter: {
    field: view_09487.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09487.is_deleted} = false ;;
}
