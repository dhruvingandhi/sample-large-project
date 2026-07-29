# Explore: explore_2059
# Auto-generated LookML Explore File

include: "/views/domain_28/view_06178.view.lkml"
include: "/views/domain_30/view_06180.view.lkml"
include: "/views/domain_31/view_06181.view.lkml"
include: "/views/domain_32/view_06182.view.lkml"

explore: explore_2059 {
  label: "Explore Explore 2059"
  description: "Comprehensive analytics explore joining base view_06178 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06178
  
  always_filter: {
    filters: [view_06178.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06178.created_at_date: "7 days"]
    unless: [view_06178.id, view_06178.status]
  }

  join: view_06180 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06178.user_id} = ${view_06180.id} ;;
    required_joins: []
  }

  join: view_06181 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06178.account_id} = ${view_06181.account_id} ;;
    required_joins: [view_06180]
  }

  join: view_06182 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06178.category} = ${view_06182.category} ;;
  }

  access_filter: {
    field: view_06178.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06178.is_deleted} = false ;;
}
