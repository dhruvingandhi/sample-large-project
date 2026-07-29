# Explore: explore_0673
# Auto-generated LookML Explore File

include: "/views/domain_20/view_02020.view.lkml"
include: "/views/domain_22/view_02022.view.lkml"
include: "/views/domain_23/view_02023.view.lkml"
include: "/views/domain_24/view_02024.view.lkml"

explore: explore_0673 {
  label: "Explore Explore 0673"
  description: "Comprehensive analytics explore joining base view_02020 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02020
  
  always_filter: {
    filters: [view_02020.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02020.created_at_date: "7 days"]
    unless: [view_02020.id, view_02020.status]
  }

  join: view_02022 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02020.user_id} = ${view_02022.id} ;;
    required_joins: []
  }

  join: view_02023 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02020.account_id} = ${view_02023.account_id} ;;
    required_joins: [view_02022]
  }

  join: view_02024 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02020.category} = ${view_02024.category} ;;
  }

  access_filter: {
    field: view_02020.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02020.is_deleted} = false ;;
}
