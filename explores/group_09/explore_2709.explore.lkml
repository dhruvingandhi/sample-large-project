# Explore: explore_2709
# Auto-generated LookML Explore File

include: "/views/domain_28/view_08128.view.lkml"
include: "/views/domain_30/view_08130.view.lkml"
include: "/views/domain_31/view_08131.view.lkml"
include: "/views/domain_32/view_08132.view.lkml"

explore: explore_2709 {
  label: "Explore Explore 2709"
  description: "Comprehensive analytics explore joining base view_08128 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08128
  
  always_filter: {
    filters: [view_08128.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08128.created_at_date: "7 days"]
    unless: [view_08128.id, view_08128.status]
  }

  join: view_08130 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08128.user_id} = ${view_08130.id} ;;
    required_joins: []
  }

  join: view_08131 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08128.account_id} = ${view_08131.account_id} ;;
    required_joins: [view_08130]
  }

  join: view_08132 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08128.category} = ${view_08132.category} ;;
  }

  access_filter: {
    field: view_08128.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08128.is_deleted} = false ;;
}
