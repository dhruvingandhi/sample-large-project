# Explore: explore_2866
# Auto-generated LookML Explore File

include: "/views/domain_49/view_08599.view.lkml"
include: "/views/domain_01/view_08601.view.lkml"
include: "/views/domain_02/view_08602.view.lkml"
include: "/views/domain_03/view_08603.view.lkml"

explore: explore_2866 {
  label: "Explore Explore 2866"
  description: "Comprehensive analytics explore joining base view_08599 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08599
  
  always_filter: {
    filters: [view_08599.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08599.created_at_date: "7 days"]
    unless: [view_08599.id, view_08599.status]
  }

  join: view_08601 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08599.user_id} = ${view_08601.id} ;;
    required_joins: []
  }

  join: view_08602 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08599.account_id} = ${view_08602.account_id} ;;
    required_joins: [view_08601]
  }

  join: view_08603 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08599.category} = ${view_08603.category} ;;
  }

  access_filter: {
    field: view_08599.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08599.is_deleted} = false ;;
}
