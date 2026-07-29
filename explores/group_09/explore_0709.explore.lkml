# Explore: explore_0709
# Auto-generated LookML Explore File

include: "/views/domain_28/view_02128.view.lkml"
include: "/views/domain_30/view_02130.view.lkml"
include: "/views/domain_31/view_02131.view.lkml"
include: "/views/domain_32/view_02132.view.lkml"

explore: explore_0709 {
  label: "Explore Explore 0709"
  description: "Comprehensive analytics explore joining base view_02128 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02128
  
  always_filter: {
    filters: [view_02128.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02128.created_at_date: "7 days"]
    unless: [view_02128.id, view_02128.status]
  }

  join: view_02130 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02128.user_id} = ${view_02130.id} ;;
    required_joins: []
  }

  join: view_02131 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02128.account_id} = ${view_02131.account_id} ;;
    required_joins: [view_02130]
  }

  join: view_02132 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02128.category} = ${view_02132.category} ;;
  }

  access_filter: {
    field: view_02128.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02128.is_deleted} = false ;;
}
