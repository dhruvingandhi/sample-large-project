# Explore: explore_0769
# Auto-generated LookML Explore File

include: "/views/domain_08/view_02308.view.lkml"
include: "/views/domain_10/view_02310.view.lkml"
include: "/views/domain_11/view_02311.view.lkml"
include: "/views/domain_12/view_02312.view.lkml"

explore: explore_0769 {
  label: "Explore Explore 0769"
  description: "Comprehensive analytics explore joining base view_02308 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02308
  
  always_filter: {
    filters: [view_02308.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02308.created_at_date: "7 days"]
    unless: [view_02308.id, view_02308.status]
  }

  join: view_02310 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02308.user_id} = ${view_02310.id} ;;
    required_joins: []
  }

  join: view_02311 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02308.account_id} = ${view_02311.account_id} ;;
    required_joins: [view_02310]
  }

  join: view_02312 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02308.category} = ${view_02312.category} ;;
  }

  access_filter: {
    field: view_02308.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02308.is_deleted} = false ;;
}
