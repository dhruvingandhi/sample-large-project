# Explore: explore_2821
# Auto-generated LookML Explore File

include: "/views/domain_14/view_08464.view.lkml"
include: "/views/domain_16/view_08466.view.lkml"
include: "/views/domain_17/view_08467.view.lkml"
include: "/views/domain_18/view_08468.view.lkml"

explore: explore_2821 {
  label: "Explore Explore 2821"
  description: "Comprehensive analytics explore joining base view_08464 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08464
  
  always_filter: {
    filters: [view_08464.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08464.created_at_date: "7 days"]
    unless: [view_08464.id, view_08464.status]
  }

  join: view_08466 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08464.user_id} = ${view_08466.id} ;;
    required_joins: []
  }

  join: view_08467 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08464.account_id} = ${view_08467.account_id} ;;
    required_joins: [view_08466]
  }

  join: view_08468 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08464.category} = ${view_08468.category} ;;
  }

  access_filter: {
    field: view_08464.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08464.is_deleted} = false ;;
}
