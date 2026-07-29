# Explore: explore_2860
# Auto-generated LookML Explore File

include: "/views/domain_31/view_08581.view.lkml"
include: "/views/domain_33/view_08583.view.lkml"
include: "/views/domain_34/view_08584.view.lkml"
include: "/views/domain_35/view_08585.view.lkml"

explore: explore_2860 {
  label: "Explore Explore 2860"
  description: "Comprehensive analytics explore joining base view_08581 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08581
  
  always_filter: {
    filters: [view_08581.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08581.created_at_date: "7 days"]
    unless: [view_08581.id, view_08581.status]
  }

  join: view_08583 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08581.user_id} = ${view_08583.id} ;;
    required_joins: []
  }

  join: view_08584 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08581.account_id} = ${view_08584.account_id} ;;
    required_joins: [view_08583]
  }

  join: view_08585 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08581.category} = ${view_08585.category} ;;
  }

  access_filter: {
    field: view_08581.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08581.is_deleted} = false ;;
}
