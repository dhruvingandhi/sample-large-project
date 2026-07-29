# Explore: explore_0821
# Auto-generated LookML Explore File

include: "/views/domain_14/view_02464.view.lkml"
include: "/views/domain_16/view_02466.view.lkml"
include: "/views/domain_17/view_02467.view.lkml"
include: "/views/domain_18/view_02468.view.lkml"

explore: explore_0821 {
  label: "Explore Explore 0821"
  description: "Comprehensive analytics explore joining base view_02464 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02464
  
  always_filter: {
    filters: [view_02464.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02464.created_at_date: "7 days"]
    unless: [view_02464.id, view_02464.status]
  }

  join: view_02466 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02464.user_id} = ${view_02466.id} ;;
    required_joins: []
  }

  join: view_02467 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02464.account_id} = ${view_02467.account_id} ;;
    required_joins: [view_02466]
  }

  join: view_02468 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02464.category} = ${view_02468.category} ;;
  }

  access_filter: {
    field: view_02464.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02464.is_deleted} = false ;;
}
