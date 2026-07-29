# Explore: explore_1821
# Auto-generated LookML Explore File

include: "/views/domain_14/view_05464.view.lkml"
include: "/views/domain_16/view_05466.view.lkml"
include: "/views/domain_17/view_05467.view.lkml"
include: "/views/domain_18/view_05468.view.lkml"

explore: explore_1821 {
  label: "Explore Explore 1821"
  description: "Comprehensive analytics explore joining base view_05464 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05464
  
  always_filter: {
    filters: [view_05464.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05464.created_at_date: "7 days"]
    unless: [view_05464.id, view_05464.status]
  }

  join: view_05466 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05464.user_id} = ${view_05466.id} ;;
    required_joins: []
  }

  join: view_05467 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05464.account_id} = ${view_05467.account_id} ;;
    required_joins: [view_05466]
  }

  join: view_05468 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05464.category} = ${view_05468.category} ;;
  }

  access_filter: {
    field: view_05464.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05464.is_deleted} = false ;;
}
