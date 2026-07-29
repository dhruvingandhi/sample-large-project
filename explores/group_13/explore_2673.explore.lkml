# Explore: explore_2673
# Auto-generated LookML Explore File

include: "/views/domain_20/view_08020.view.lkml"
include: "/views/domain_22/view_08022.view.lkml"
include: "/views/domain_23/view_08023.view.lkml"
include: "/views/domain_24/view_08024.view.lkml"

explore: explore_2673 {
  label: "Explore Explore 2673"
  description: "Comprehensive analytics explore joining base view_08020 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08020
  
  always_filter: {
    filters: [view_08020.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08020.created_at_date: "7 days"]
    unless: [view_08020.id, view_08020.status]
  }

  join: view_08022 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08020.user_id} = ${view_08022.id} ;;
    required_joins: []
  }

  join: view_08023 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08020.account_id} = ${view_08023.account_id} ;;
    required_joins: [view_08022]
  }

  join: view_08024 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08020.category} = ${view_08024.category} ;;
  }

  access_filter: {
    field: view_08020.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08020.is_deleted} = false ;;
}
